import 'dart:io';

/// Caches file content by file path, useful for translating between differing
/// representations of location.
///
/// When a file is requested that is not already cached it will be read from
/// disk. Any file that has been opened in the editor should already be cached
/// and that version is considered canonical since it might be newer than the
/// version on disk.
class FileCache {
  /// The content of files open in the editor.
  final _activeFiles = <String, List<String>>{};

  /// The content of files read from disk.
  ///
  /// As files are opened in the editor they will be removed from this map.
  /// Note that this will miss files changed on disk from other processes.
  final _inactiveFiles = <String, List<String>>{};

  List<String> operator [](Object filePath) {
    assert(filePath is String);
    if (_activeFiles.containsKey(filePath)) return _activeFiles[filePath];
    return _inactiveFiles.putIfAbsent(
        filePath, () => new File(filePath).readAsLinesSync());
  }

  void operator []=(String filePath, List<String> lines) {
    _activeFiles[filePath] = lines;
    _inactiveFiles.remove(filePath);
  }
}
