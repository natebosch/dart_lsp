import 'package:analysis_server_lib/analysis_server_lib.dart' show Location;
import 'protocol/language_server/messages.dart' hide Location;

int offsetFromPosition(Iterable<int> lineLengths, Position position) =>
    _offset(lineLengths, position.line, position.character);

int _offset(Iterable<int> lineLengths, int line, int character) {
  var fullLines =
      lineLengths.take(line).fold(0, (sum, length) => sum + length + 1);
  return fullLines + character;
}

Range rangeFromOffset(Iterable<int> lineLengths, int offset, int length) =>
    Range((b) => b
      ..start = positionFromOffset(lineLengths, offset)
      ..end = positionFromOffset(lineLengths, offset + length));

Range rangeFromLocation(Iterable<int> lineLengths, Location location) =>
    rangeFromOffset(lineLengths, offsetFromLocation(lineLengths, location),
        location.length);

int offsetFromLocation(Iterable<int> lineLengths, Location location) =>
    _offset(lineLengths, location.startLine - 1, location.startColumn - 1);

Position positionFromOffset(Iterable<int> lineLengths, int offset) {
  var consumedCharacters = 0;
  var consumedLines = 0;
  for (var length in lineLengths) {
    if (consumedCharacters + length + 1 > offset) break;
    consumedLines += 1;
    consumedCharacters += length + 1;
  }
  return Position((b) => b
    ..line = consumedLines
    ..character = offset - consumedCharacters);
}

OffsetLength offsetLengthFromRange(Iterable<int> lineLengths, Range range) {
  var offset = offsetFromPosition(lineLengths, range.start);
  var endOffset = offsetFromPosition(lineLengths, range.end);
  return OffsetLength(offset, endOffset - offset);
}

List<int> findLineLengths(String file) =>
    file.split('\n').map((l) => l.length).toList();

class OffsetLength {
  final int offset;
  final int length;
  const OffsetLength(this.offset, this.length);
}
