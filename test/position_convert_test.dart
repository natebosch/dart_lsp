import 'package:test/test.dart';

import 'package:dart_language_server/src/position_convert.dart';
import 'package:dart_language_server/src/protocol/language_server/messages.dart';

void main() {
  const file = 'line 1\n'
      'longer line 2\n'
      '\n'
      'line following blank\n';
  final lines = file.split('\n');
  group('offsetFromPosition', () {
    test('start of file', () async {
      var start = new Position((b) => b
        ..line = 0
        ..character = 0);
      expect(offsetFromPosition(lines, start), 0);
    });
    test('start of line', () async {
      var startOfLine = new Position((b) => b
        ..line = 1
        ..character = 0);
      expect(offsetFromPosition(lines, startOfLine), 7);
    });
    test('end of line', () async {
      var endOfLine = new Position((b) => b
        ..line = 1
        ..character = 12);
      expect(offsetFromPosition(lines, endOfLine), 19);
    });
    test('line after blank', () async {
      var lineAfterBlank = new Position((b) => b
        ..line = 3
        ..character = 0);
      expect(offsetFromPosition(lines, lineAfterBlank), 22);
    });
  });

  group('positionFromOffset', () {
    test('start of file', () async {
      expect(
          positionFromOffset(lines, 0).toJson(),
          new Position((b) => b
            ..line = 0
            ..character = 0).toJson());
    });

    test('start of line', () async {
      expect(
          positionFromOffset(lines, 7).toJson(),
          new Position(((b) => b
                ..line = 1
                ..character = 0))
              .toJson());
    });

    test('end of line', () async {
      expect(
          positionFromOffset(lines, 19).toJson(),
          new Position((b) => b
            ..line = 1
            ..character = 12).toJson());
    });
    test('after blank line', () async {
      expect(
          positionFromOffset(lines, 22).toJson(),
          new Position((b) => b
            ..line = 3
            ..character = 0).toJson());
    });
  });

  group('rangeFromOffset', () {
    test('start of file', () async {
      expect(
          rangeFromOffset(lines, 0, 3).toJson(),
          new Range((b) => b
            ..start = new Position((b) => b
              ..line = 0
              ..character = 0)
            ..end = new Position((b) => b
              ..line = 0
              ..character = 3)).toJson());
    });

    test('start of line', () async {
      expect(
          rangeFromOffset(lines, 7, 5).toJson(),
          new Range((b) => b
            ..start = new Position((b) => b
              ..line = 1
              ..character = 0)
            ..end = new Position((b) => b
              ..line = 1
              ..character = 5)).toJson());
    });

    test('across lines', () async {
      expect(
          rangeFromOffset(lines, 14, 11).toJson(),
          new Range((b) => b
            ..start = new Position((b) => b
              ..line = 1
              ..character = 7)
            ..end = new Position((b) => b
              ..line = 3
              ..character = 3)).toJson());
    });
  });
}
