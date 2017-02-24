import 'dart:io';
import 'dart:async';

import 'package:dart_language_server/dart_language_server.dart';

Future main() async {
  try {
    var shim = await startShimmedServer();
    await new StdIOLanguageServer.start(shim).onDone;
  } catch (e) {
    await new File('/tmp/lsp-error.log').writeAsString('Caught $e');
  } finally {
    await closeLogs();
  }
}
