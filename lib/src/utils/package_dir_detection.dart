import 'dart:io';

/// Returns a directory at [path] or any parent that looks like a packge
/// directory or null if no parent matches.
///
/// A directory is assumed to be package diectory if it contains one of
/// `.packages`, `pubspec.yaml`, `lib`, `web`, or `bin`.
String findParentPackageDir(String path) {
  for (final dir in _crawlUp(new Directory(path))) {
    if (_isPackageDir(dir)) return dir.path;
  }
  return null;
}

Iterable<Directory> _crawlUp(Directory dir) sync* {
  var parentDir = dir.parent;
  while (parentDir.path != dir.path) {
    yield dir;
    dir = parentDir;
    parentDir = dir.parent;
  }
}

bool _isPackageDir(Directory dir) {
  final files = dir.listSync();
  return files.any((f) {
    final path = f.path;
    return path.endsWith('/.packages') ||
        path.endsWith('/pubspec.yaml') ||
        path.endsWith('/lib') ||
        path.endsWith('/bin') ||
        path.endsWith('/web');
  });
}
