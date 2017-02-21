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
    _completionMethods(peer);

    peer.listen();

    _server.onDone.catchError((e) {
      channelLog?.writeln('Server failed: $e');
    }).whenComplete(() {
      channelLog?.writeln('Done');
      channelLog?.close();
    });
  }

  Future<Null> get onDone => _server.onDone;

  bool _isInitialized = false;
  static const _notInitialized = -32002;
  static const _notInitializedMessage = 'The server has not been initialized';

  void _lifecycleMethods(Peer peer) {
    peer
      ..registerMethod('initialize', (params) {
        _isInitialized = true;
        _log.info('Initializing for pid ${params['processId'].value}');
        return {'capabilities': _serverCapabilities.toJson()};
      })
      ..registerMethod('shutdown', _server.shutdown)
      ..registerMethod('exit', _server.exit);
  }

  void _fileHandlingMethods(Peer peer) {
    peer
      ..registerMethod('textDocument/didOpen', (params) async {
        if (!_isInitialized) return;
        var document =
            new TextDocumentItem.fromJson(params['textDocument'].value);
        await _server.textDocumentDidOpen(document);
      })
      ..registerMethod('textDocument/didChange', (params) async {
        if (!_isInitialized) return;
        var documentId = new VersionedTextDocumentIdentifier.fromJson(
            params['textDocument'].value);
        var changes = params['contentChanges'].value.map(
            (change) => new TextDocumentContentChangeEvent.fromJson(change));
        await _server.textDocumentDidChange(documentId, changes);
      })
      ..registerMethod('textDocument/didClose', (params) async {
        if (!_isInitialized) return;
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

  void _completionMethods(Peer peer) {
    peer
      ..registerMethod('textDocument/completion', (params) async {
        if (!_isInitialized) {
          throw new RpcException(_notInitialized, _notInitializedMessage);
        }
        var documentId =
            new TextDocumentIdentifier.fromJson(params['textDocument'].value);
        var position = new Position.fromJson(params['position'].value);
        return (await _server.textDocumentCompletion(documentId, position))
            .toJson();
      })
      ..registerMethod('textDocument/definition', (params) async {
        if (!_isInitialized) {
          throw new RpcException(_notInitialized, _notInitializedMessage);
        }
        var documentId =
            new TextDocumentIdentifier.fromJson(params['textDocument'].value);
        var position = new Position.fromJson(params['position'].value);
        return (await _server.textDocumentDefinition(documentId, position))
            .toJson();
      });
  }
}

final _serverCapabilities = new ServerCapabilities((b) => b
  ..textDocumentSync = new TextDocumentSyncOptions((b) => b
    ..openClose = true
    ..change = TextDocumentSyncKind.full
    ..willSave = false
    ..willSaveWaitUntil = false
    ..save = false)
  ..hoverProvider = false
  ..completionProvider = new CompletionOptions((b) => b
    ..resolveProvider = false
    ..triggerCharacters = const ['.'])
  ..definitionProvider = true
  ..referencesProvider = false
  ..documentHighlightsProvider = false
  ..documentSymbolProvider = false
  ..workspaceSymbolProvider = false
  ..codeActionProvider = false
  ..codeLensProvider = false
  ..documentFormattingProvider = false
  ..documentRangeFormattingProvider = false
  ..documentOnTypeFormattingProvider = false
  ..renameProvider = false);
