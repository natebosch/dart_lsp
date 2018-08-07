import 'package:async/async.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:stream_transform/stream_transform.dart';

class WireLog {
  StringSink _log;

  void attach(StringSink log) {
    _log = log;
  }

  StreamChannelTransformer<String, String> _transformer;
  StreamChannelTransformer<String, String> get transformer =>
      _transformer ??
      StreamChannelTransformer(_tapLog('In'),
          StreamSinkTransformer.fromStreamTransformer(_tapLog('Out')));

  _tapLog(String prefix) =>
      tap<String>((data) => _log?.writeln('$prefix: $data'),
          onDone: () => _log?.writeln('$prefix: Closed'));
}
