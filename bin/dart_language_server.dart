import 'dart:io';

import 'package:path/path.dart' as p;

void main(List<String> args) async {
  final sdkBin = p.dirname(Platform.executable);
  final snapshot = p.join(sdkBin, 'snapshots', 'analysis_server.dart.snapshot');
  final process = await Process.start(
      Platform.executable, [snapshot, '--lsp', ...args],
      mode: ProcessStartMode.inheritStdio);
  exitCode = await process.exitCode;
}
