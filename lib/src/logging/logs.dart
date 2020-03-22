import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;
import 'package:stream_channel/stream_channel.dart';

import 'wirelog.dart';

final _lspWireLog = WireLog();
final analyzerSink = StreamController<String>.broadcast();
StreamChannelTransformer<String, String> lspChannel = _lspWireLog.transformer;

final _logs = <IOSink>[];

void startLogging(Directory logDirectory, String traceLevel) {
  if (traceLevel == 'verbose') {
    logDirectory.createSync(recursive: true);
    var logSink = File(path.join(logDirectory.path, 'server.log')).openWrite();
    _logs.add(logSink);
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      logSink
          .writeln('${record.level.name}: ${record.time}: ${record.message}');
      if (record.error != null) {
        logSink.writeln('[Exception]: ${record.error}');
      }
      logSink.flush();
    });
  }
  if (traceLevel == 'verbose' || traceLevel == 'messages') {
    logDirectory.createSync(recursive: true);
    var analyzerLog =
        File(path.join(logDirectory.path, 'analyzer-wirelog.log')).openWrite();
    analyzerSink.stream.transform(utf8.encoder).pipe(analyzerLog);
    _logs.add(analyzerLog);
    var lspLog =
        File(path.join(logDirectory.path, 'lsp-wirelog.log')).openWrite();
    _lspWireLog.attach(lspLog);
    _logs.add(lspLog);
  }
}

/// Flush and close all file handles that were opened for logging.
@deprecated
Future<void> closeLogs() => Future.wait(_logs.map(_close));

Future _close(IOSink sink) async {
  await sink?.flush();
  await sink?.close();
}
