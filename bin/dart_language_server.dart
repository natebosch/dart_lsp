import 'dart:async';
import 'dart:io';

import 'package:dart_language_server/dart_language_server.dart';
import 'package:logging/logging.dart';

Future main() async {
  var errorLog = new File('/tmp/errors.log').openWrite();
  await runZoned(() async {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      errorLog
          .write('${record.level.name}: ${record.time}: ${record.message}\n');
    });
    var log = new Logger('main');
    log.info('Starting');
    var shim = await startShimmedServer();
    await new StdIOLanguageServer.start(shim, '/tmp/lsp_wirelog.txt').onDone;
  }, onError: (e) {
    errorLog.write('Error direct! $e\n');
  });
  errorLog.write('Done!\n');
  await new Future(() {});
  errorLog.close();
}
