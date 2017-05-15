import 'dart:async';

import 'package:path/path.dart' as p;

import 'position_convert.dart';
import 'protocol/analysis_server/client.dart';
import 'protocol/analysis_server/interface.dart';
import 'protocol/analysis_server/messages.dart' hide Location;
import 'protocol/language_server/interface.dart';
import 'protocol/language_server/messages.dart';
import 'utils/file_cache.dart';

Future<LanguageServer> startShimmedServer() async {
  var client = await SubprocessAnalysisServer.start();
  return new AnalysisServerAdapter(client);
}

/// Wraps an [AnalysisServer] and exposes it as a [LanguageServer].
class AnalysisServerAdapter implements LanguageServer {
  final AnalysisServer _server;

  final _files = new FileCache();

  final _fileVersions = <String, int>{};

  AnalysisServerAdapter(this._server) {
    _listeners();
  }

  final _openDirectories = new Set<String>();
  final _openFiles = new Set<String>();

  @override
  Future<Null> get onDone => _onDone.future;
  final _onDone = new Completer<Null>();
  bool _hasShutdown = false;

  @override
  Future<Null> shutdown() async {
    _hasShutdown = true;
    await _server.shutdown();
  }

  @override
  void exit() {
    if (_hasShutdown) {
      _onDone.complete();
    } else {
      _server.shutdown();
      _onDone.completeError('Exit called before shutdown');
    }
  }

  @override
  Future<Null> textDocumentDidOpen(TextDocumentItem document) async {
    var path = Uri.parse(document.uri).path;
    _files[path] = document.text.split('\n');
    _fileVersions[path] = document.version;
    var directory = p.dirname(path);
    if (!_openDirectories.contains(directory)) {
      _openDirectories.add(directory);
      await _server.setAnalysisRoots(_openDirectories.toList(), const []);
    }
    _openFiles.add(document.uri);
    await _server.setPriorityFiles(_openFiles.toList());
    await _server.updateContent(
        {path: new AddContentOverlay((b) => b..content = document.text)});
  }

  @override
  Future<Null> textDocumentDidChange(VersionedTextDocumentIdentifier documentId,
      List<TextDocumentContentChangeEvent> changes) async {
    var path = Uri.parse(documentId.uri).path;
    if (_fileVersions[path] > documentId.version) return;
    _fileVersions[path] = documentId.version;
    // TODO: Assumes the entire file is sent
    assert(changes.length == 1);
    _files[path] = changes.single.text.split('\n');
    await _server.updateContent(
        {path: new AddContentOverlay((b) => b..content = changes.single.text)});
  }

  @override
  Future<Null> textDocumentDidClose(TextDocumentIdentifier documentId) async {
    var path = Uri.parse(documentId.uri).path;
    await _server.updateContent({path: const RemoveContentOverlay()});
  }

  @override
  Future<CompletionList> textDocumentCompletion(
      TextDocumentIdentifier documentId, Position position) async {
    var path = Uri.parse(documentId.uri).path;
    var offset = offsetFromPosition(_files[path], position);
    var id = await _server.completionGetSuggestions(path, offset);
    _completionPaths[id] = path;
    return (_completions[id] = new Completer<CompletionList>()).future;
  }

  final _completions = <String, Completer<CompletionList>>{};
  final _completionPaths = <String, String>{};
  void _listeners() {
    _server.completionResults.listen((results) {
      var id = results.id;
      if (!_completions.containsKey(id)) throw 'Missing completion $id';
      var path = _completionPaths.remove(id);
      _completions
          .remove(id)
          .complete(_toCompletionList(_files[path], results));
    });
    _server.searchResults.listen((results) {
      var id = results.id;
      if (!_searchResults.containsKey(id)) throw 'Missing element search $id';
      _searchResults.remove(id).complete(_toLocationList(results, _files));
    });
  }

  @override
  Future<Location> textDocumentDefinition(
      TextDocumentIdentifier documentId, Position position) async {
    var path = Uri.parse(documentId.uri).path;
    var offset = offsetFromPosition(_files[path], position);
    var result = await _server.analysisGetNavigation(path, offset, 1);
    if (result.targets.isEmpty) return null;
    var target = result.targets.first;
    var targetFile = result.files[target.fileIndex];
    return new Location((b) => b
      ..uri = _toFileUri(targetFile)
      ..range =
          rangeFromOffset(_files[targetFile], target.offset, target.length));
  }

  @override
  Future<List<Location>> textDocumentReferences(
      TextDocumentIdentifier documentId,
      Position position,
      ReferenceContext context) async {
    //TODO: Not returning definition regardless of [context]
    var path = Uri.parse(documentId.uri).path;
    var offset = offsetFromPosition(_files[path], position);
    var id = await _server.findElementReferences(path, offset, true);
    return (_searchResults[id] = new Completer<List<Location>>()).future;
  }

  final _searchResults = <String, Completer<List<Location>>>{};

  @override
  Stream<Diagnostics> get diagnostics =>
      _server.analysisErrors.distinct().map((errors) {
        var lines = _files[errors.file];
        return _toDiagnostics(lines, errors);
      });
}

List<Location> _toLocationList(SearchResults results, FileCache files) =>
    results.results
        .map((result) => result.location)
        .map((location) => new Location((b) => b
          ..uri = _toFileUri(location.file)
          ..range = rangeFromLocation(files[location.file], location)))
        .toList();

Diagnostics _toDiagnostics(List<String> lines, AnalysisErrors errors) =>
    new Diagnostics((b) => b
      ..uri = _toFileUri(errors.file)
      ..diagnostics =
          errors.errors.map((error) => _toDiagnostic(lines, error)).toList());

String _toFileUri(String path) => '${new Uri.file(path)}';

CompletionList _toCompletionList(
        List<String> lines, CompletionResults results) =>
    new CompletionList((b) => b
      ..isIncomplete = !results.isLast
      ..items = results.results
          .map((r) => _toCompletionItem(lines, r, results))
          .toList());

CompletionItem _toCompletionItem(List<String> lines,
        CompletionSuggestion suggestion, CompletionResults results) =>
    new CompletionItem((b) => b
      ..label = suggestion.completion
      ..kind = _completionKind(suggestion.kind)
      ..textEdit = new TextEdit((b) => b
        ..newText = suggestion.completion
        ..range = rangeFromOffset(
            lines, results.replacementOffset, results.replacementLength))
      ..detail = _completionItemDetail(suggestion)
      ..documentation = suggestion.docComplete);

String _completionItemDetail(CompletionSuggestion suggestion) {
  if (suggestion.returnType != null && suggestion.docSummary != null) {
    return '${suggestion.returnType} : ${suggestion.docSummary}';
  }
  if (suggestion.docSummary != null) return suggestion.docSummary;
  if (suggestion.returnType != null) return suggestion.returnType;
  if (suggestion.parameterName != null) {
    if (suggestion.parameterType != null) {
      return '${suggestion.parameterName} : ${suggestion.parameterType}';
    }
    return '${suggestion.parameterName}';
  }
  return null;
}

Diagnostic _toDiagnostic(List<String> lines, AnalysisError error) =>
    new Diagnostic((b) => b
      ..range = rangeFromLocation(lines, error.location)
      ..severity = _severities[error.severity]
      ..code = error.code
      ..source = 'Dart analysis server'
      ..message = error.message);

const _severities = const <AnalysisErrorSeverity, int>{
  AnalysisErrorSeverity.info: 3,
  AnalysisErrorSeverity.warning: 2,
  AnalysisErrorSeverity.error: 1
};

CompletionItemKind _completionKind(CompletionSuggestionKind suggestionKind) {
  switch (suggestionKind) {
    case CompletionSuggestionKind.argumentList:
      return CompletionItemKind.snippet; // ?
    case CompletionSuggestionKind.import:
      return CompletionItemKind.module; // ?
    case CompletionSuggestionKind.identifier:
      return CompletionItemKind.reference;
    case CompletionSuggestionKind.invocation:
      return CompletionItemKind.method;
    case CompletionSuggestionKind.keyword:
      return CompletionItemKind.keyword;
    case CompletionSuggestionKind.namedArgument:
    case CompletionSuggestionKind.optionalArgument:
      return CompletionItemKind.snippet; // ?
    case CompletionSuggestionKind.parameter:
      return CompletionItemKind.value; //?
    default:
      return null;
  }
}
