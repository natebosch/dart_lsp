import 'dart:async';
import 'dart:io';

import 'package:async/async.dart';
import 'package:stream_channel/stream_channel.dart';

StreamChannel<String> wireLog(StreamChannel<String> channel, IOSink log) {
  var inLog = new _Log('In', log);
  var inTransformer = new StreamTransformer.fromHandlers(
      handleData: inLog.handleData, handleDone: inLog.handleDone);
  var outLog = new _Log('Out', log);
  var outTransformer = new StreamSinkTransformer.fromHandlers(
      handleData: outLog.handleData, handleDone: outLog.handleDone);
  return new StreamChannelTransformer(inTransformer, outTransformer)
      .bind(channel);
}

class _Log {
  final String prefix;
  final IOSink log;

  _Log(this.prefix, this.log);

  void handleData(String data, EventSink<String> sink) {
    log.write('$prefix: $data\n');
    sink.add(data);
  }

  void handleDone(EventSink<String> sink) {
    log.write('$prefix: Closed\n');
    sink.close();
  }
}
