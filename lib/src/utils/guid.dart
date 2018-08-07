import 'dart:convert';
import 'dart:math';

String makeGuid() => base64Encode(_bytes.take(6).toList());

final _bytes = _randomBytes();

Iterable<int> _randomBytes() sync* {
  var random = Random();
  while (true) yield random.nextInt(255);
}
