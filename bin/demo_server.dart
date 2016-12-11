import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:json_rpc_2/json_rpc_2.dart';

import 'package:dart_language_server/dart_language_server.dart';

final random = new Random();

final _fileContents = <String, String>{};

Future main() async {
  var log = new File('/tmp/wirelog.txt').openWrite();
  var channel = new StdIOStreamChannel();
  var logged = wireLog(channel, log);
  Timer timer;
  bool hasShutdown = false;
  var server = new Peer(logged);
  server
    ..registerMethod('shutdown', () {
      hasShutdown = true;
    })
    ..registerMethod('exit', () {
      server.close();
    })
    ..registerMethod('textDocument/didOpen', (params) {
      var textDocument = params['textDocument'].value;
      var uri = textDocument['uri'];
      var fileContent = textDocument['text'];
      _fileContents[uri] = fileContent;
      _notifyDiagnostics(uri, server, log);
    })
    ..registerMethod('textDocument/didChange', (params) {
      var textDocument = params['textDocument'].value;
      var uri = textDocument['uri'];
      // Assume version is latest
      // Assume entire file was sent
      var fileContent = params['contentChanges'].value['text'];
      _fileContents[uri] = fileContent;
      _notifyDiagnostics(uri, server, log);
    })
    ..registerMethod('random_ints', (params) {
      return _randomInts(params['count'].value).toList();
    })
    ..registerMethod('start_notifications', () {
      timer ??= new Timer.periodic(const Duration(seconds: 3), (_) {
        server.sendNotification('some_notification', _randomInts(2));
      });
    })
    ..registerMethod('stop_notifications', () {
      timer?.cancel();
      timer = null;
    })
    ..registerFallback(([params]) {
      return 'fallback for "${params.method}" with params ${params.value}';
    });
  await server.listen();
  timer?.cancel();
  if (hasShutdown) {
    exitCode = 0;
  } else {
    exitCode = 1;
  }
  log.write('Done\n');
  log.close();
}

void _notifyDiagnostics(String uri, Peer server, IOSink log) {
  var fileContent = _fileContents[uri];
  var lines = fileContent.split('\n');
  var diagnostics = [];
  for (int i = 0, l = lines.length; i < l; i++) {
    var line = lines[i];
    var errorIndex = line.indexOf('error');
    if (errorIndex >= 0) {
      diagnostics.add({
        'severity': 1,
        'code': 'error found',
        'message': 'do not like "error"',
        'range': {
          'start': {'line': i, 'character': errorIndex},
          'end': {'line': i, 'character': errorIndex + 'error'.length}
        }
      });
    }
  }
  new Future.delayed(const Duration(milliseconds: 200), () {
    server.sendNotification('textDocument/publishDiagnostics',
        {'uri': uri, 'diagnostics': diagnostics});
  });
}

Iterable<int> _randomInts(int count) sync* {
  for (var i = 0; i < count; i++) {
    yield random.nextInt(100);
  }
}
