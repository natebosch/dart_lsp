import 'protocol/analysis_server/messages.dart';
import 'protocol/language_server/messages.dart';

int offsetFromPosition(List<String> lines, Position position) =>
    _offset(lines, position.line, position.character);

int _offset(List<String> lines, int line, int character) {
  var fullLines =
      lines.take(line).fold(0, (sum, line) => sum + line.length + 1);
  return fullLines + character;
}

Range rangeFromOffset(List<String> lines, int offset, int length) =>
    new Range((b) => b
      ..start = positionFromOffset(lines, offset)
      ..end = positionFromOffset(lines, offset + length));

Range rangeFromLocation(List<String> lines, Location location) =>
    rangeFromOffset(
        lines, offsetFromLocation(lines, location), location.length);

int offsetFromLocation(List<String> lines, Location location) =>
    _offset(lines, location.startLine - 1, location.startColumn - 1);

Position positionFromOffset(List<String> lines, int offset) {
  var consumedCharacters = 0;
  var consumedLines = 0;
  for (var line in lines) {
    if (consumedCharacters + line.length + 1 > offset) break;
    consumedLines += 1;
    consumedCharacters += line.length + 1;
  }
  return new Position((b) => b
    ..line = consumedLines
    ..character = offset - consumedCharacters);
}
