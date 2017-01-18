import 'dart:async';

import 'package:test/test.dart';

import 'package:dart_language_server/src/utils/async.dart';

void main() {
  group('distinctUntilChanged', () {

    test('with default equals', () async {
      var withDuplicates = new Stream.fromIterable([1, 1, 2, 2, 3, 3, 3]);
      var unique = withDuplicates.transform(distinctUntilChanged());
      expect(await unique.toList(), [1, 2, 3]);
    });

    test('with custom equals', () async {
      var withDuplicates =
          new Stream.fromIterable(['foo', 'FOO', 'bar', 'Bar']);
      var unique = withDuplicates.transform(distinctUntilChanged(
          (left, right) => left.toLowerCase() == right.toLowerCase()));
      expect(await unique.toList(), ['foo', 'bar']);
    });
  });
}
