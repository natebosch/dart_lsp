import 'dart:async';
import 'dart:io';

import 'package:logging/logging.dart';
import 'package:stream_channel/stream_channel.dart';

import 'wirelog.dart';

final _analyzerWireLog = new WireLog();
final _lspWireLog = new WireLog();
StreamChannelTransformer<String, String> analyzerChannel =
    _analyzerWireLog.transformer;
StreamChannelTransformer<String, String> lspChannel = _lspWireLog.transformer;

final _logs = <IOSink>[];

void startLogging(String clientName, bool enableTrace) {
  var logSink = new File('/tmp/dart-lang-server-$clientName.log').openWrite();
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    logSink.write('${record.level.name}: ${record.time}: ${record.message}\n');
  });
  if (enableTrace) {
    var analyzerLog =
        new File('/tmp/analyzer-wirelog-$clientName.log').openWrite();
    _analyzerWireLog.attach(analyzerLog);
    _logs.add(analyzerLog);
    var lspLog = new File('/tmp/lsp-wirelog-$clientName.log').openWrite();
    _lspWireLog.attach(lspLog);
    _logs.add(lspLog);
  }
}

Future<Null> closeLogs() => Future.wait(_logs.map(_close));

Future _close(IOSink sink) async {
  await sink?.flush();
  await sink?.close();
}
