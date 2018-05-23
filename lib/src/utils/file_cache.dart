import 'dart:io';

/// Caches file line lengths by file path, useful for translating between
/// differing representations of location.
///
/// When a file is requested that is not already cached it will be read from
/// disk. Any file that has been opened in the editor should already be cached
/// and that version is considered canonical since it might be newer than the
/// version on disk.
class FileCache {
  /// The line lengths of files open in the editor.
  final _activeFiles = <String, List<int>>{};

  List<int> operator [](Object filePath) {
    assert(filePath is String);
    if (_activeFiles.containsKey(filePath)) return _activeFiles[filePath];
    // Don't use readAsLines() or we'll lose track of the different line endings (\r\n).
    return splitIntoLines(new File(filePath).readAsStringSync());
  }

  void operator []=(String filePath, List<int> lines) {
    _activeFiles[filePath] = lines;
  }
}

// TODO: Where should this live?
List<int> splitIntoLines(String contents) {
  // To avoid confusion, we add the \n back on to the length, so the lengths
  // include line endings.
  final lineLengths = contents.split("\n").map((l) => l.length + 1).toList();
  // Remove the +1 we added on to the last one that didn't really exist.
  lineLengths[lineLengths.length - 1]--;

  return lineLengths;
}
