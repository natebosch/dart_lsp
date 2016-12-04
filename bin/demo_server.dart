import 'dart:io';

import 'package:json_rpc_2/json_rpc_2.dart';

import 'package:dart_language_server/dart_language_server.dart';

void main() {
  var logFile = new File('/tmp/wirelog.txt');
  var channel = new StdIOStreamChannel();
  var logged = wireLog(channel, logFile);
  var server = new Peer(logged);
  server.registerMethod('foo', (params) {
    return params.asList;
  });
  server.registerFallback(([params]) {
    return 'fallback';
  });
  server.listen();
}
