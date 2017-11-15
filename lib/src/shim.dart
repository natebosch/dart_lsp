import 'dart:async';

import 'package:path/path.dart' as p;

import 'package:analysis_server_lib/analysis_server_lib.dart'
    hide Position, Location;

import 'apply_change.dart';
import 'position_convert.dart';
import 'protocol/language_server/interface.dart';
import 'protocol/language_server/messages.dart';
import 'utils/file_cache.dart';

Future<LanguageServer> startShimmedServer() async {
  var client = await AnalysisServer.create();
  await client.server.onConnected.first;
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
    await _server.dispose();
  }

  @override
  void exit() {
    if (_hasShutdown) {
      _onDone.complete();
    } else {
      _server.dispose();
      _onDone.completeError('Exit called before shutdown');
    }
  }

  @override
  Future<Null> textDocumentDidOpen(TextDocumentItem document) async {
    var path = _filePath(document.uri);
    _files[path] = findLineLengths(document.text);
    _fileVersions[path] = document.version;
    var directory = p.dirname(path);
    if (!_openDirectories.contains(directory)) {
      _openDirectories.add(directory);
      await _server.analysis
          .setAnalysisRoots(_openDirectories.toList(), const []);
    }
    _openFiles.add(document.uri);
    await _server.analysis.setPriorityFiles(_openFiles.toList());
    await _server.analysis
        .updateContent({path: new AddContentOverlay(document.text)});
  }

  @override
  Future<Null> textDocumentDidChange(VersionedTextDocumentIdentifier documentId,
      List<TextDocumentContentChangeEvent> changes) async {
    var path = _filePath(documentId.uri);
    if (_fileVersions[path] > documentId.version) return;
    _fileVersions[path] = documentId.version;
    if (changes.length == 1 && changes.first.range == null) {
      _files[path] = findLineLengths(changes.single.text);
      await _server.analysis
          .updateContent({path: new AddContentOverlay(changes.single.text)});
    } else {
      var overlay = new ChangeContentOverlay(changes.map((change) {
        var sourceEdit = _toSourceEdit(_files[path], change);
        _files[path] = applyChange(_files[path], change);
        return sourceEdit;
      }).toList());
      await _server.analysis.updateContent({path: overlay});
    }
  }

  @override
  Future<Null> textDocumentDidClose(TextDocumentIdentifier documentId) async {
    var path = _filePath(documentId.uri);
    await _server.analysis.updateContent({path: new RemoveContentOverlay()});
  }

  @override
  Future<CompletionList> textDocumentCompletion(
      TextDocumentIdentifier documentId, Position position) async {
    var path = _filePath(documentId.uri);
    var offset = offsetFromPosition(_files[path], position);
    var id = (await _server.completion.getSuggestions(path, offset)).id;
    _completionPaths[id] = path;
    return (_completions[id] = new Completer<CompletionList>()).future;
  }

  final _completions = <String, Completer<CompletionList>>{};
  final _completionPaths = <String, String>{};
  void _listeners() {
    _server.completion.onResults.listen((results) {
      var id = results.id;
      if (!_completions.containsKey(id)) throw 'Missing completion $id';
      var path = _completionPaths.remove(id);
      _completions
          .remove(id)
          .complete(_toCompletionList(_files[path], results));
    });
    _server.search.onResults.listen((results) {
      var id = results.id;
      if (!_searchResults.containsKey(id)) throw 'Missing element search $id';
      _searchResults.remove(id).complete(_toLocationList(results, _files));
    });
  }

  @override
  Future<Location> textDocumentDefinition(
      TextDocumentIdentifier documentId, Position position) async {
    var path = _filePath(documentId.uri);
    var offset = offsetFromPosition(_files[path], position);
    var result = await _server.analysis.getNavigation(path, offset, 1);
    if (result.targets.isEmpty) return null;
    return _navigationLocations(result).first;
  }

  Iterable<Location> _navigationLocations(NavigationResult result) =>
      result.targets.map((t) {
        var file = result.files[t.fileIndex];
        return new Location((b) => b
          ..uri = _toFileUri(file)
          ..range = rangeFromOffset(_files[file], t.offset, t.length));
      });

  @override
  Future<List<Location>> textDocumentReferences(
      TextDocumentIdentifier documentId,
      Position position,
      ReferenceContext context) async {
    var path = _filePath(documentId.uri);
    var offset = offsetFromPosition(_files[path], position);
    var id =
        (await _server.search.findElementReferences(path, offset, true)).id;
    var references =
        (_searchResults[id] = new Completer<List<Location>>()).future;
    if (context.includeDeclaration) {
      var definition = await _server.analysis.getNavigation(path, offset, 1);
      return (await references)..addAll(_navigationLocations(definition));
    }
    return references;
  }

  @override
  Future<Hover> textDocumentHover(
      TextDocumentIdentifier documentId, Position position) async {
    var path = _filePath(documentId.uri);
    var offset = offsetFromPosition(_files[path], position);
    var hovers = (await _server.analysis.getHover(path, offset)).hovers;
    if (hovers.isEmpty) return null;
    var hover = hovers.first;
    var range = rangeFromOffset(_files[path], hover.offset, hover.length);
    return new Hover((b) => b
      ..contents = _hoverMessage(hover)
      ..range = range);
  }

  final _searchResults = <String, Completer<List<Location>>>{};

  @override
  Stream<Diagnostics> get diagnostics =>
      _server.analysis.onErrors.map((errors) {
        var lines = _files[errors.file];
        return _toDiagnostics(lines, errors);
      }).distinct();
}

String _hoverMessage(HoverInformation hover) {
  var message = new StringBuffer();
  if (hover.elementDescription != null) {
    message.writeln(hover.elementDescription);
  }
  if (hover.isDeprecated) message.writeln('(deprecated)');
  if (hover.dartdoc != null) {
    if (message.isNotEmpty) message.writeln();
    message.writeln(hover.dartdoc);
  }
  return '$message';
}

String _filePath(String fileUri) =>
    Uri.decodeComponent(Uri.parse(fileUri).path);

List<Location> _toLocationList(SearchResults results, FileCache files) =>
    results.results
        .map((result) => result.location)
        .toSet()
        .map((location) => new Location((b) => b
          ..uri = _toFileUri(location.file)
          ..range = rangeFromLocation(files[location.file], location)))
        .toList();

Diagnostics _toDiagnostics(List<int> lineLengths, AnalysisErrors errors) =>
    new Diagnostics((b) => b
      ..uri = _toFileUri(errors.file)
      ..diagnostics = errors.errors
          .map((error) => _toDiagnostic(lineLengths, error))
          .toList());

String _toFileUri(String path) => '${new Uri.file(path)}';

CompletionList _toCompletionList(
        List<int> lineLengths, CompletionResults results) =>
    new CompletionList((b) => b
      ..isIncomplete = !results.isLast
      ..items = results.results
          .map((r) => _toCompletionItem(lineLengths, r, results))
          .toList());

CompletionItem _toCompletionItem(List<int> lineLengths,
        CompletionSuggestion suggestion, CompletionResults results) =>
    new CompletionItem((b) => b
      ..label = suggestion.completion
      ..kind = _completionKind(suggestion)
      ..textEdit = new TextEdit((b) => b
        ..newText = suggestion.completion
        ..range = rangeFromOffset(
            lineLengths, results.replacementOffset, results.replacementLength))
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

Diagnostic _toDiagnostic(List<int> lineLengths, AnalysisError error) =>
    new Diagnostic((b) => b
      ..range = rangeFromLocation(lineLengths, error.location)
      ..severity = _diagnosticSeverity(error.severity, error.type)
      ..code = error.code
      ..source = 'Dart analysis server'
      ..message = error.message);

int _diagnosticSeverity(String severity, String type) {
  if (severity == 'ERROR') return 1;
  if (severity == 'WARNING') return 2;
  return (type == 'INFO') ? 4 : 3;
}

CompletionItemKind _completionKind(CompletionSuggestion suggestion) {
  if (suggestion.element != null) {
    switch (suggestion.element.kind) {
      case 'GETTER':
      case 'SETTER':
      case 'FIELD':
        return CompletionItemKind.field;
      case 'FUNCTION':
        return CompletionItemKind.function;
      case 'METHOD':
        return CompletionItemKind.method;
      case 'LOCAL_VARIABLE':
      case 'TOP_LEVEL_VARIABLE':
        return CompletionItemKind.variable;
      case 'CLASS_ELEMENT':
      case 'CLASS_TYPE_ALIAS':
        return CompletionItemKind.classKind;
      case 'CONSTRUCTOR':
        return CompletionItemKind.constructor;
      case 'ENUM_CONSTANT':
      case 'ENUM_ELEMENT':
        return CompletionItemKind.enumKind;
      case 'FILE':
        return CompletionItemKind.file;
      case 'LIBRARY':
      case 'COMPILATION_UNIT':
        return CompletionItemKind.module;
    }
  }
  switch (suggestion.kind) {
    case 'ARGUMENT_LIST':
      return CompletionItemKind.snippet; // ?
    case 'IMPORT':
      return CompletionItemKind.module; // ?
    case 'IDENTIFIER':
      return CompletionItemKind.reference;
    case 'INVOCATION':
      return CompletionItemKind.method;
    case 'KEYWORD':
      return CompletionItemKind.keyword;
    case 'NAMED_ARGUMENT':
    case 'OPTIONAL_ARGUMENT':
      return CompletionItemKind.snippet; // ?
    case 'PARAMETER':
      return CompletionItemKind.value; //?
    default:
      return null;
  }
}

SourceEdit _toSourceEdit(
        Iterable<int> lineLengths, TextDocumentContentChangeEvent change) =>
    new SourceEdit(offsetFromPosition(lineLengths, change.range.start),
        change.rangeLength, change.text);
