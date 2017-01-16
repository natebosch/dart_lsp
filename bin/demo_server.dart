import 'dart:async';

import 'package:dart_language_server/dart_language_server.dart';

Future main() async {
  var demo = new DemoServer();
  await new StdIOLanguageServer.start(demo, '/tmp/wirelog.txt').onDone;
}

class DemoServer extends LanguageServer {
  final _onDone = new Completer<Null>();
  @override
  Future<Null> get onDone => _onDone.future;

  void exit() {
    _onDone.complete();
  }

  final _fileContents = <String, String>{};

  @override
  void textDocumentDidOpen(TextDocumentItem document) {
    _fileContents[document.uri] = document.text;
    _notifyDiagnostics(document.uri);
  }

  @override
  void textDocumentDidChange(VersionedTextDocumentIdentifier documentId,
      List<TextDocumentContentChangeEvent> changes) {
    _fileContents[documentId.uri] = changes.single.text;
    _notifyDiagnostics(documentId.uri);
  }

  final _diagnostics = new StreamController<Diagnostics>();
  @override
  Stream<Diagnostics> get diagnostics => _diagnostics.stream;

  void _notifyDiagnostics(String uri) {
    var lines = _fileContents[uri].split('\n');
    _diagnostics.add(new Diagnostics((b) => b
      ..uri = uri
      ..diagnostics = _findErrors(lines).toList()));
  }

  Iterable<Diagnostic> _findErrors(List<String> lines) sync* {
    for(int i = 0, l = lines.length; i<l; i++) {
      var line = lines[i];
      var errorIndex = line.indexOf('error');
      if (errorIndex >= 0) {
        yield new Diagnostic((b) => b
          ..severity = 1
          ..code = 'error found'
          ..message = 'do not like "error"'
          ..range = (new Range((b) => b
            ..start = (new Position((b) => b
              ..line = i
              ..character = errorIndex))
            ..end = (new Position((b) => b
              ..line = i
              ..character = errorIndex + 'error'.length)))));
      }
    }
  }
}
