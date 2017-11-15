import 'protocol/language_server/messages.dart';

List<int> applyChange(
    List<int> lineLengths, TextDocumentContentChangeEvent change) {
  var result = <int>[];
  var newLineLengths = change.text.isEmpty
      ? <int>[]
      : change.text.split("\n").map((l) => l.length).toList();

  final remainingPrefix = change.range.start.character;
  final remainingPostfix =
      lineLengths[change.range.end.line] - change.range.end.character;

  result.addAll(lineLengths.sublist(0, change.range.start.line));
  if (newLineLengths.isEmpty) {
    result.add(remainingPrefix + remainingPostfix);
  } else if (newLineLengths.length == 1) {
    result.add(remainingPrefix + newLineLengths.first + remainingPostfix);
  } else {
    result.add(remainingPrefix + newLineLengths.first);
    if (newLineLengths.length > 2) {
      result.addAll(newLineLengths.sublist(1, newLineLengths.length - 1));
    }
    result.add(remainingPostfix + newLineLengths[newLineLengths.length - 1]);
  }
  result.addAll(lineLengths.sublist(change.range.end.line + 1));
  return result;
}
