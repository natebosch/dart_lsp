import 'dart:async';

StreamTransformer<String, String> splitMarker([marker = '\n']) {
  String buffer;
  return StreamTransformer.fromHandlers(
      handleData: (String input, EventSink<String> sink) {
    var split = input.split(marker);
    if (buffer != null) split[0] = buffer + split[0];
    var complete = split.take(split.length - 1);
    buffer = split.last.isEmpty ? null : split.last;
    for (var value in complete) {
      sink.add(value);
    }
  });
}
