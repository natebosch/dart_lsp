import 'dart:async';

import 'package:async/async.dart';
import 'package:stream_channel/stream_channel.dart';

class WireLog {
  StringSink _log;

  void attach(StringSink log) {
    _log = log;
  }

  StreamChannelTransformer<String, String> _transformer;
  StreamChannelTransformer<String, String> get transformer =>
      _transformer ?? _initTransformer();

  StreamChannelTransformer<String, String> _initTransformer() {
    var inTransformer = new StreamTransformer.fromHandlers(
        handleData: _inData, handleDone: _inDone);
    var outTransformer = new StreamSinkTransformer.fromHandlers(
        handleData: _outData, handleDone: _outDone);
    return new StreamChannelTransformer(inTransformer, outTransformer);
  }

  void _inData(String data, EventSink<String> sink) {
    _log?.writeln('In: $data');
    sink.add(data);
  }

  void _outData(String data, EventSink<String> sink) {
    _log?.writeln('Out: $data');
    sink.add(data);
  }

  void _inDone(EventSink<String> sink) {
    _log?.writeln('In: CLosed');
    sink.close();
  }

  void _outDone(EventSink<String> sink) {
    _log?.writeln('Out: CLosed');
    sink.close();
  }
}
