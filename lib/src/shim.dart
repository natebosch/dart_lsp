import 'dart:async';

import 'package:path/path.dart' as p;

import 'protocol/analysis_server/client.dart';
import 'protocol/analysis_server/interface.dart';
import 'protocol/analysis_server/messages.dart';
import 'protocol/language_server/interface.dart';
import 'protocol/language_server/messages.dart';

Future<LanguageServer> startShimmedServer() async {
  var client = await SubprocessAnalysisServer.start();
  return new AnalysisServerAdapter(client);
}

/// Wraps an [AnalysisServer] and exposes it as a [LanguageServer].
class AnalysisServerAdapter implements LanguageServer {
  final AnalysisServer _server;

  AnalysisServerAdapter(this._server);

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
  Stream<Diagnostics> get diagnostics =>
      _server.analysisErrors.map(_toDiagnostics);
}

Diagnostics _toDiagnostics(AnalysisErrors errors) => new Diagnostics((b) => b
  ..uri = _toFileUri(errors.file)
  ..diagnostics = errors.errors.map(_toDiagnostic).toList());

String _toFileUri(String filePath) => '${new Uri.file(filePath)}';

Diagnostic _toDiagnostic(AnalysisError error) => new Diagnostic((b) => b
  ..range = _toRange(error.location)
  ..severity = _severities[error.severity]
  ..code = error.code
  ..source = 'Dart analysis server'
  ..message = error.message);

Range _toRange(Location location) {
  var start = new Position((b) => b
    ..line = location.startLine - 1
    ..character = location.startColumn - 1);
  //TODO: would need file contents to property translate by length.
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
