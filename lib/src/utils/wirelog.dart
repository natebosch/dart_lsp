import 'dart:async';
import 'dart:io';

import 'package:async/async.dart';
import 'package:stream_channel/stream_channel.dart';

StreamChannel<String> wireLog(StreamChannel<String> channel, File logFile) {
  var log = logFile.openWrite();
  var inLog = new _Log('In', log);
  var inTransformer = new StreamTransformer.fromHandlers(
      handleData: inLog.handleData,
      handleError: inLog.handleError,
      handleDone: inLog.handleDone);
  var outLog = new _Log('Out', log);
  var outTransformer = new StreamSinkTransformer.fromHandlers(
      handleData: outLog.handleData,
      handleError: outLog.handleError,
      handleDone: outLog.handleDone);
  Future.wait([inLog.onDone, outLog.onDone]).then((_) {
    log.close();
  });
  return new StreamChannelTransformer(inTransformer, outTransformer)
      .bind(channel);
}

class _Log {
  final String prefix;
  final IOSink log;

  _Log(this.prefix, this.log);

  final _onDone = new Completer();
  Future get onDone => _onDone.future;

  void handleData(String data, EventSink<String> sink) {
    log.write('$prefix: $data\n');
    sink.add(data);
  }

  void handleError(Object error, StackTrace trace, EventSink<String> sink) {
    log.write('$prefix Error: $error\n');
    sink.addError(error, trace);
  }

  void handleDone(EventSink<String> sink) {
    log.write('$prefix Done\n');
    sink.close();
    _onDone.complete(null);
  }
}
