import 'dart:async';

import 'package:json_rpc_2/json_rpc_2.dart';

import '../../logging/logs.dart';
import 'interface.dart';
import 'messages.dart';
import 'wireformat.dart';

class StdIOLanguageServer {
  final LanguageServer _server;
  Future<Null> onDone;

  StdIOLanguageServer.start(this._server) {
    var channel = new StdIOStreamChannel();
    channel = lspChannel.bind(channel);
    var peer = new Peer(channel);

    _lifecycleMethods(peer);
    _fileHandlingMethods(peer);
    _diagnosticNotifications(peer);
    _completionMethods(peer);

    peer.listen();

    onDone = _server.onDone.then((_) => peer.close()).then((_) => null);
  }

  bool _isInitialized = false;
  static const _notInitialized = -32002;
  static const _notInitializedMessage = 'The server has not been initialized';

  void _lifecycleMethods(Peer peer) {
    peer
      ..registerMethod('initialize', (params) async {
        var serverCapabilities = await _server.initialize(
            params['processId'].valueOr(0),
            params['rootUri'].valueOr(''),
            new ClientCapabilities.fromJson(params['capabilities'].value),
            params['trace'].valueOr('off'));
        _isInitialized = true;
        return {'capabilities': serverCapabilities.toJson()};
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
            ?.toJson();
      })
      ..registerMethod('textDocument/hover', (params) async {
        if (!_isInitialized) {
          throw new RpcException(_notInitialized, _notInitializedMessage);
        }
        var documentId =
            new TextDocumentIdentifier.fromJson(params['textDocument'].value);
        var position = new Position.fromJson(params['position'].value);
        return (await _server.textDocumentHover(documentId, position))
            ?.toJson();
      })
      ..registerMethod('textDocument/references', (params) async {
        if (!_isInitialized) {
          throw new RpcException(_notInitialized, _notInitializedMessage);
        }
        var documentId =
            new TextDocumentIdentifier.fromJson(params['textDocument'].value);
        var position = new Position.fromJson(params['position'].value);
        var context = new ReferenceContext.fromJson(params['context'].value);
        return (await _server.textDocumentReferences(
                documentId, position, context))
            ?.map((r) => r.toJson())
            ?.toList();
      })
      ..registerMethod('textDocument/codeAction', (params) async {
        if (!_isInitialized) {
          throw new RpcException(_notInitialized, _notInitializedMessage);
        }
        var documentId =
            new TextDocumentIdentifier.fromJson(params['textDocument'].value);
        var range = new Range.fromJson(params['range'].value);
        var context = new CodeActionContext.fromJson(params['context'].value);
        return (await _server.textDocumentCodeAction(
                documentId, range, context))
            .map((r) => r.toJson())
            ?.toList();
      });
  }
}
