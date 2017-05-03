import 'dart:io';
import 'dart:async';

import 'package:dart_language_server/dart_language_server.dart';

Future main() async {
  await runZoned(() async {
    try {
      var shim = await startShimmedServer();
      await new StdIOLanguageServer.start(shim).onDone;
    } catch (e, st) {
      await new File('/tmp/lsp-error.log').writeAsString('Caught $e\n$st');
    } finally {
      await closeLogs();
    }
  }, onError: (e, st) {
    new File('/tmp/lsp-error.log').writeAsString('UnCaught $e\n$st');
  });
}
