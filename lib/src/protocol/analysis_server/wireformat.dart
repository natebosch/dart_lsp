import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:logging/logging.dart';
import 'package:stream_channel/stream_channel.dart';

import '../../utils/split_marker.dart';

typedef void EventHandler(dynamic /*json serializable*/ params);

/// A client communicating with an RPC server [Process] over std io streams.
///
/// This is similar to a JsonRPC client but does not include the "jsonrpc" key
/// and ids are forced to be Strings.
class RpcClient {
  final StreamChannel<String> _channel;
  final Logger _log;
  final _outstandingRequests = <String, Completer>{};
  final _eventHandlers = <String, EventHandler>{};

  int _requestId = 0;

  factory RpcClient(String name, Process process,
      [StreamChannelTransformer<String, String> wirelog]) {
    final utf8Transformer = new StreamSinkTransformer.fromHandlers(
        handleData: (String data, EventSink<List<int>> sink) {
      sink.add(UTF8.encode(data));
    });
    var inStrings = utf8Transformer.bind(process.stdin);
    var outStrings = process.stdout.map(UTF8.decode).transform(splitMarker());
    var channel = new StreamChannel(outStrings, inStrings);

    if (wirelog != null) {
      channel = wirelog.bind(channel);
    }
    return new RpcClient._(channel, new Logger('$name-rpc'));
  }

  RpcClient._(this._channel, this._log) {
    _channel.stream.listen(_handleResponse);
  }

  void registerEventHandler(String eventName, EventHandler handler) {
    _eventHandlers[eventName] = handler;
  }

  Future sendRequest(String method, [dynamic /*json serializable*/ params]) {
    var id = '${_requestId++}';
    var request = {'id': id, 'method': method};
    if (params != null) {
      request['params'] = params;
    }
    _channel.sink.add('${JSON.encode(request)}\n');
    var completer = new Completer();
    _outstandingRequests[id] = completer;
    return completer.future;
  }

  void _handleResponse(String response) {
    response = response.trim();
    if (response.isEmpty) {
      _log.fine('Got empty response');
      return;
    }
    dynamic message;
    try {
      message = JSON.decode(response);
    } catch (e) {
      _log.severe('Error while decoding: $e');
      return;
    }
    if (message.containsKey('id')) {
      var id = message['id'];
      _log.fine('Completing request: $id');
      _outstandingRequests[id].complete(message['result']);
      _outstandingRequests.remove(id);
    } else {
      var event = message['event'];
      _log.fine('Handling event: $event');
      if (!_eventHandlers.containsKey(event)) {
        _log.info('Ignoring event $event');
        return;
      }
      _eventHandlers[event](message['params']);
    }
  }
}
