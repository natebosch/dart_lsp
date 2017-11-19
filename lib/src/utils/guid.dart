import 'dart:convert';
import 'dart:math';

String makeGuid() => BASE64.encode(_bytes.take(6).toList());

final _bytes = _randomBytes();

Iterable<int> _randomBytes() sync* {
  var random = new Random();
  while (true) yield random.nextInt(255);
}
