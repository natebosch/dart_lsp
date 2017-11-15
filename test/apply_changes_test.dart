import 'package:test/test.dart';

import 'package:dart_language_server/src/apply_change.dart';
import 'package:dart_language_server/src/protocol/language_server/messages.dart';

void main() {
  void testApplyChange(
      String oldText,
      String newText,
      int startLine,
      int startCharacter,
      int endLine,
      int endCharacter,
      int rangeLength,
      String text) {
    var original = oldText.split('\n').map((l) => l.length).toList();
    var expected = newText.split('\n').map((l) => l.length).toList();
    expect(
        applyChange(
            original,
            _change(startLine, startCharacter, endLine, endCharacter,
                rangeLength, text)),
        expected);
  }

  test('first and last line swapped', () {
    testApplyChange(
        'foo\nbar\nbaz', 'baz\nbar\nfoo', 0, 0, 2, 3, 11, 'baz\nbar\nfoo');
  });
  test('Middle line changed', () {
    testApplyChange('foo\nbar\nbaz', 'foo\nmore\nbaz', 1, 0, 1, 3, 3, 'more');
  });

  test('Middle characters changed', () {
    testApplyChange('foo\nbar\nbaz', 'foo\nbxr\nbaz', 1, 1, 1, 2, 1, 'x');
  });

  test('End of line changed', () {
    testApplyChange('foo\nbar\nbaz', 'foo\nby\nbaz', 1, 1, 1, 3, 2, 'y');
  });

  test('End of file changed', () {
    testApplyChange('foo\nbar\nbaz', 'foo\nbar\nby', 2, 1, 2, 3, 2, 'y');
  });
  test('Characters inserted', () {
    testApplyChange('foo\nbar\nbaz', 'foo\nbear\nbaz', 1, 1, 1, 1, 0, 'e');
  });

  test('Characters inserted at beginning', () {
    testApplyChange('foo\nbar\nbaz', 'afoo\nbar\nbaz', 0, 0, 0, 0, 0, 'a');
  });

  test('Line inserted', () {
    testApplyChange(
        'foo\nbar\nbaz', 'foo\nmore\nbar\nbaz', 1, 0, 1, 0, 0, 'more\n');
  });

  test('Line inserted at end', () {
    testApplyChange(
        'foo\nbar\nbaz', 'foo\nbar\nbaz\nanother', 2, 3, 2, 3, 0, '\nanother');
  });

  test('Change spanning lines', () {
    testApplyChange('foo\nbar\nbaz', 'for\nmany\nlines\nspaz', 0, 2, 2, 1, 7,
        'r\nmany\nlines\nsp');
  });

  test('Delete within a line', () {
    testApplyChange('foo\nbar\nbaz', 'foo\nbr\nbaz', 1, 1, 1, 2, 1, '');
  });

  test('Delete across a line', () {
    testApplyChange('foo\nbar\nqux', 'foo\nbux', 1, 1, 2, 1, 4, '');
  });

  test('Delete entire line', () {
    testApplyChange('foo\nbar\nqux', 'foo\nqux', 1, 0, 2, 0, 4, '');
  });

  test('Delete multiple lines', () {
    testApplyChange('foo\nbar\nbaz\nqux', 'foo\nqux', 1, 0, 3, 0, 8, '');
  });

  test('Delete with repeated substring', () {
    testApplyChange('ABABAB', 'ABAB', 0, 4, 0, 6, 2, '');
  });
  test('Delete at beginning', () {
    testApplyChange('foo\nbar\nbaz', 'oo\nbar\nbaz', 0, 0, 0, 1, 1, '');
  });
  test('Delete at end', () {
    testApplyChange('foo\nbar\nbaz', 'foo\nbar\nba', 2, 2, 2, 3, 1, '');
  });
}

TextDocumentContentChangeEvent _change(int startLine, int startCharacter,
        int endLine, int endCharacter, int rangeLength, String text) =>
    new TextDocumentContentChangeEvent((b) => b
      ..range = new Range((b) => b
        ..start = new Position((b) => b
          ..line = startLine
          ..character = startCharacter)
        ..end = new Position((b) => b
          ..line = endLine
          ..character = endCharacter))
      ..rangeLength = rangeLength
      ..text = text);
