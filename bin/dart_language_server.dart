import 'dart:io';
import 'dart:async';

import 'package:dart_language_server/dart_language_server.dart';
import 'package:dart_language_server/src/args.dart';

Future main(List<String> args) async {
  stderr.writeln(
      'This server is deprecated. Use the Dart Analysis Server with `--lsp`\n'
      'https://github.com/dart-lang/sdk/blob/master/'
      'pkg/analysis_server/tool/lsp_spec/README.md');
  StartupArgs startupArgs;
  try {
    startupArgs = StartupArgs(args);
  } on UsageException catch (e) {
    print(e.usage);
    return;
  }
  await runZoned(() async {
    try {
      // ignore: deprecated_member_use_from_same_package
      var shim = await startShimmedServer(startupArgs);
      await StdIOLanguageServer.start(shim).onDone;
    } catch (e, st) {
      stderr.writeln('Uncaught Exception: $e\n$st');
    } finally {
      // ignore: deprecated_member_use_from_same_package
      await closeLogs();
    }
  }, onError: (e, st) {
    stderr.writeln('Uncaught Exception: $e\n$st');
  });
}
