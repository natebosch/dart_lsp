import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:json_rpc_2/json_rpc_2.dart';

import 'package:dart_language_server/dart_language_server.dart';

final random = new Random();

Future main() async {
  var log = new File('/tmp/wirelog.txt').openWrite();
  var channel = new StdIOStreamChannel();
  var logged = wireLog(channel, log);
  Timer timer;
  var server = new Peer(logged);
  server
    ..registerMethod('random_ints', (params) {
      return _randomInts(params['count'].value).toList();
    })
    ..registerMethod('start_notifications', () {
      timer ??= new Timer.periodic(const Duration(seconds: 3), (_) {
        server.sendNotification('some_notification', _randomInts(2));
      });
    })
    ..registerMethod('stop_notifications', () {
      timer?.cancel();
      timer = null;
    })
    ..registerFallback(([params]) {
      return 'fallback for "${params.method}" with params ${params.value}';
    });
  await server.listen();
  timer?.cancel();
  log.write('Done\n');
  log.close();
}

Iterable<int> _randomInts(int count) sync* {
  for (var i = 0; i < count; i++) {
    yield random.nextInt(100);
  }
}
