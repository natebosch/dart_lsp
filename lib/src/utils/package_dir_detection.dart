import 'dart:io';

/// Returns a directory at [path] or any parent that looks like a packge
/// directory or null if no parent matches.
///
/// A directory is assumed to be package diectory if it contains one of
/// `.packages`, `pubspec.yaml`, `lib`, `web`, or `bin`.
String findParentPackageDir(String path) =>
    _findParentPackageDir(new Directory(path))?.path;

Directory _findParentPackageDir(Directory dir) {
  if (_isPackageRoot(dir)) return dir;
  final path = dir.path;
  if (path.endsWith('/lib') || path.endsWith('/web') || path.endsWith('/bin')) {
    return dir.parent;
  }
  final parent = dir.parent;
  if (parent.path == path) return null;
  return _findParentPackageDir(parent);
}

bool _isPackageRoot(Directory dir) {
  final files = dir.listSync();
  return files.any((f) {
    final path = f.path;
    return path.endsWith('/.packages') || path.endsWith('/pubspec.yaml');
  });
}
