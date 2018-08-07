import 'package:dart_language_server/src/position_convert.dart';
import 'package:dart_language_server/src/protocol/language_server/messages.dart';
import 'package:test/test.dart';

void main() {
  const file = 'line 1\n'
      'longer line 2\n'
      '\n'
      'line following blank\n';
  [false, true].forEach((windowsFile) {
    if (windowsFile)
      group('${windowsFile ? "Windows" : "macOS"} line endings', () {
        final lines =
            findLineLengths(windowsFile ? file.replaceAll("\n", "\r\n") : file);
        group('offsetFromPosition', () {
          test('start of file', () async {
            var start = Position((b) => b
              ..line = 0
              ..character = 0);
            expect(offsetFromPosition(lines, start), 0);
          });
          test('start of line', () async {
            var startOfLine = Position((b) => b
              ..line = 1
              ..character = 0);
            expect(offsetFromPosition(lines, startOfLine), windowsFile ? 8 : 7);
          });
          test('end of line', () async {
            var endOfLine = Position((b) => b
              ..line = 1
              ..character = 12);
            expect(offsetFromPosition(lines, endOfLine), windowsFile ? 20 : 19);
          });
          test('line after blank', () async {
            var lineAfterBlank = Position((b) => b
              ..line = 3
              ..character = 0);
            expect(offsetFromPosition(lines, lineAfterBlank),
                windowsFile ? 25 : 22);
          });
        });

        group('positionFromOffset', () {
          test('start of file', () async {
            expect(
                positionFromOffset(lines, 0).toJson(),
                Position((b) => b
                  ..line = 0
                  ..character = 0).toJson());
          });

          test('start of line', () async {
            expect(
                positionFromOffset(lines, windowsFile ? 8 : 7).toJson(),
                Position(((b) => b
                      ..line = 1
                      ..character = 0))
                    .toJson());
          });

          test('end of line', () async {
            expect(
                positionFromOffset(lines, windowsFile ? 20 : 19).toJson(),
                Position((b) => b
                  ..line = 1
                  ..character = 12).toJson());
          });
          test('after blank line', () async {
            expect(
                positionFromOffset(lines, windowsFile ? 25 : 22).toJson(),
                Position((b) => b
                  ..line = 3
                  ..character = 0).toJson());
          });
        });

        group('rangeFromOffset', () {
          test('start of file', () async {
            expect(
                rangeFromOffset(lines, 0, 3).toJson(),
                Range((b) => b
                  ..start = Position((b) => b
                    ..line = 0
                    ..character = 0)
                  ..end = Position((b) => b
                    ..line = 0
                    ..character = 3)).toJson());
          });

          test('start of line', () async {
            expect(
                rangeFromOffset(lines, windowsFile ? 8 : 7, 5).toJson(),
                Range((b) => b
                  ..start = Position((b) => b
                    ..line = 1
                    ..character = 0)
                  ..end = Position((b) => b
                    ..line = 1
                    ..character = 5)).toJson());
          });

          test('across lines', () async {
            expect(
                rangeFromOffset(
                        lines, windowsFile ? 15 : 14, windowsFile ? 13 : 11)
                    .toJson(),
                Range((b) => b
                  ..start = Position((b) => b
                    ..line = 1
                    ..character = 7)
                  ..end = Position((b) => b
                    ..line = 3
                    ..character = 3)).toJson());
          });
        });
      });
  });
}
