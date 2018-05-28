import 'package:analysis_server_lib/analysis_server_lib.dart' show Location;
import 'protocol/language_server/messages.dart' hide Location;

int offsetFromPosition(Iterable<int> lineLengths, Position position) =>
    _offset(lineLengths, position.line, position.character);

int _offset(Iterable<int> lineLengths, int line, int character) {
  var fullLines = lineLengths.take(line).fold(0, (sum, length) => sum + length);
  return fullLines + character;
}

Range rangeFromOffset(Iterable<int> lineLengths, int offset, int length) =>
    new Range((b) => b
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
    if (consumedCharacters + length > offset) break;
    consumedLines += 1;
    consumedCharacters += length;
  }
  return new Position((b) => b
    ..line = consumedLines
    ..character = offset - consumedCharacters);
}

OffsetLength offsetLengthFromRange(Iterable<int> lineLengths, Range range) {
  var offset = offsetFromPosition(lineLengths, range.start);
  var endOffset = offsetFromPosition(lineLengths, range.end);
  return new OffsetLength(offset, endOffset - offset);
}

List<int> findLineLengths(String contents) {
  // To avoid confusion, we add the \n back on to the length, so the lengths
  // include line endings.
  final lineLengths = contents.split("\n").map((l) => l.length + 1).toList();
  // Remove the +1 we added on to the last one that didn't really exist.
  lineLengths[lineLengths.length - 1]--;

  return lineLengths;
}

class OffsetLength {
  final int offset;
  final int length;
  const OffsetLength(this.offset, this.length);
}
