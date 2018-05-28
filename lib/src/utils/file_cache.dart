import 'dart:io';

import 'package:dart_language_server/src/position_convert.dart';

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
    return findLineLengths(new File(filePath).readAsStringSync());
  }

  void operator []=(String filePath, List<int> lines) {
    _activeFiles[filePath] = lines;
  }
}
