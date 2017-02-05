import 'dart:async';

import 'package:path/path.dart' as p;

import 'protocol/analysis_server/client.dart';
import 'protocol/analysis_server/interface.dart';
import 'protocol/analysis_server/messages.dart';
import 'protocol/language_server/interface.dart';
import 'protocol/language_server/messages.dart';
import 'utils/async.dart';

Future<LanguageServer> startShimmedServer([String wirelogPath]) async {
  var client = await SubprocessAnalysisServer.start(wirelogPath);
  return new AnalysisServerAdapter(client);
}

/// Wraps an [AnalysisServer] and exposes it as a [LanguageServer].
class AnalysisServerAdapter implements LanguageServer {
  final AnalysisServer _server;

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
    var filePath = Uri.parse(document.uri).path;
    var directory = p.dirname(filePath);
    if (!_openDirectories.contains(directory)) {
      _openDirectories.add(directory);
      await _server.setAnalysisRoots(_openDirectories.toList(), const []);
    }
    _openFiles.add(document.uri);
    await _server.setPriorityFiles(_openFiles.toList());
    await _server.updateContent(
        {filePath: new AddContentOverlay((b) => b..content = document.text)});
  }

  @override
  Future<Null> textDocumentDidChange(VersionedTextDocumentIdentifier documentId,
      List<TextDocumentContentChangeEvent> changes) async {
    var filePath = Uri.parse(documentId.uri).path;
    // TODO: Assumes version is latest
    // TODO: Assumes the entire file is sent
    assert(changes.length == 1);
    await _server.updateContent({
      filePath: new AddContentOverlay((b) => b..content = changes.single.text)
    });
  }

  @override
  Future<Null> textDocumentDidClose(TextDocumentIdentifier documentId) async {
    var filePath = Uri.parse(documentId.uri).path;
    await _server.updateContent({filePath: const RemoveContentOverlay()});
  }

  @override
  Future<CompletionList> textDocumentCompletion(
      TextDocumentIdentifier documentId, Position posiiton) async {
    var filePath = Uri.parse(documentId.uri).path;
    // TODO: Need to get offset in entire file
    var id = await _server.completionGetSuggestions(filePath, 0);
    return (_completions[id] = new Completer<CompletionList>()).future;
  }

  final _completions = <String, Completer<CompletionList>>{};
  void _listeners() {
    _server.completionResults.listen((results) {
      var id = results.id;
      if (!_completions.containsKey(id)) throw 'Missing completion $id';
      _completions.remove(id).complete(_toCompletionList(results));
    });
  }

  @override
  Stream<Diagnostics> get diagnostics => _server.analysisErrors
      .transform(distinctUntilChanged())
      .map(_toDiagnostics);
}

Diagnostics _toDiagnostics(AnalysisErrors errors) => new Diagnostics((b) => b
  ..uri = _toFileUri(errors.file)
  ..diagnostics = errors.errors.map(_toDiagnostic).toList());

String _toFileUri(String filePath) => '${new Uri.file(filePath)}';

CompletionList _toCompletionList(CompletionResults results) =>
    new CompletionList((b) => b
      ..isIncomplete = !results.isLast
      ..items =
          results.results.map((r) => _toCompletionItem(r, results)).toList());

CompletionItem _toCompletionItem(
        CompletionSuggestion suggestion, CompletionResults results) =>
    new CompletionItem((b) => b
      ..label = suggestion.completion
      ..kind = _completionKind(suggestion.kind)
      ..range =
          _rangeFromOffset(results.replacementOffset, results.replacementLength)
      ..detail = suggestion.docSummary);

Diagnostic _toDiagnostic(AnalysisError error) => new Diagnostic((b) => b
  ..range = _toRange(error.location)
  ..severity = _severities[error.severity]
  ..code = error.code
  ..source = 'Dart analysis server'
  ..message = error.message);

// TODO
Range _rangeFromOffset(int offset, int length) => null;

Range _toRange(Location location) {
  var start = new Position((b) => b
    ..line = location.startLine - 1
    ..character = location.startColumn - 1);
  //TODO: would need file contents to properly translate by length.
  var end = new Position((b) => b
    ..line = location.startLine - 1
    ..character = location.startColumn - 1 + location.length);
  return new Range((b) => b
    ..start = start
    ..end = end);
}

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
