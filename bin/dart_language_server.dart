import 'dart:io';
import 'dart:async';

import 'package:dart_language_server/dart_language_server.dart';
import 'package:dart_language_server/src/args.dart';

Future main(List<String> args) async {
  StartupArgs startupArgs;
  try {
    startupArgs = StartupArgs(args);
  } on UsageException catch (e) {
    print(e.usage);
    return;
  }
  await runZoned(() async {
    try {
      var shim = await startShimmedServer(startupArgs);
      await StdIOLanguageServer.start(shim).onDone;
    } catch (e, st) {
      stderr.writeln('Uncaught Exception: $e\n$st');
    } finally {
      await closeLogs();
    }
  }, onError: (e, st) {
    stderr.writeln('Uncaught Exception: $e\n$st');
  });
}
