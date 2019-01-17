import 'dart:io';

/// Returns a directory at [path] or any parent that looks like a packge
/// directory or null if no parent matches.
///
/// A directory is assumed to be package diectory if it contains either a
/// `pubspec.yaml` or a `BUILD` file.
String findParentPackageDir(String path) =>
    _findParentPackageDir(Directory(path))?.path;

Directory _findParentPackageDir(Directory dir) {
  if (_isPackageRoot(dir)) return dir;
  final path = dir.path;
  final parent = dir.parent;
  if (parent.path == path) return null;
  return _findParentPackageDir(parent);
}

bool _isPackageRoot(Directory dir) =>
    dir.existsSync() &&
    dir.listSync().any((f) =>
        f.path.endsWith('${Platform.pathSeparator}pubspec.yaml') ||
        f.path.endsWith('${Platform.pathSeparator}BUILD'));
