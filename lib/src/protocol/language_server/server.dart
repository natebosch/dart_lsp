import 'dart:async';
import 'dart:io';

import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:logging/logging.dart';

import '../../utils/wirelog.dart';
import 'interface.dart';
import 'messages.dart';
import 'wireformat.dart';

class StdIOLanguageServer {
  final LanguageServer _server;
  final _log = new Logger('StdIOLanguageServer');

  StdIOLanguageServer.start(this._server, [String wirelogPath]) {
    var channel = new StdIOStreamChannel();
    IOSink channelLog;
    if (wirelogPath != null) {
      channelLog = new File(wirelogPath).openWrite();
      channel = wireLog(channel, channelLog);
    }
    var peer = new Peer(channel);

    _lifecycleMethods(peer);
    _fileHandlingMethods(peer);
    _diagnosticNotifications(peer);

    peer.listen();

    _server.onDone.catchError((e) {
      channelLog?.writeln('Server failed: $e');
    }).whenComplete(() {
      channelLog?.writeln('Done');
      channelLog?.close();
    });
  }

  Future<Null> get onDone => _server.onDone;

  void _lifecycleMethods(Peer peer) {
    peer
      ..registerMethod('shutdown', _server.shutdown)
      ..registerMethod('exit', _server.exit);
  }

  void _fileHandlingMethods(Peer peer) {
    peer
      ..registerMethod('textDocument/didOpen', (params) async {
        _log.info('TextDocument did open');
        var document =
            new TextDocumentItem.fromJson(params['textDocument'].value);
        await _server.textDocumentDidOpen(document);
      })
      ..registerMethod('textDocument/didChange', (params) async {
        var documentId = new VersionedTextDocumentIdentifier.fromJson(
            params['textDocument'].value);
        var changes = params['contentChanges'].value.map(
            (change) => new TextDocumentContentChangeEvent.fromJson(change));
        await _server.textDocumentDidChange(documentId, changes);
      })
      ..registerMethod('textDocument/didClose', (params) async {
        var documentId =
            new TextDocumentIdentifier(params['textDocument'].value);
        await _server.textDocumentDidClose(documentId);
      });
  }

  void _diagnosticNotifications(Peer peer) {
    _server.diagnostics.listen((diagnostics) {
      peer.sendNotification(
          'textDocument/publishDiagnostics', diagnostics.toJson());
    });
  }
}
