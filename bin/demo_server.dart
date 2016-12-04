import 'package:json_rpc_2/json_rpc_2.dart';

import 'package:dart_language_server/dart_language_server.dart';

void main() {
  var channel = new StdIOStreamChannel();
  var server = new Peer(channel);
  server.registerMethod('foo', (params) {
    return params.asList;
  });
  server.registerFallback(([params]) async {
    return 'fallback';
  });
  server.listen();
}
