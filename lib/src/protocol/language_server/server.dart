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
    _referenceMethods(peer);
    _codeActionMethods(peer);

    peer.listen();

    onDone = _server.onDone.then((_) => peer.close()).then((_) => null);
  }

  bool _isInitialized = false;

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

  /// Requests throw if they are made before initialization.
  void _registerRequest(Peer peer, String methodName, Function callback) {
    peer.registerMethod(methodName, (params) {
      if (!_isInitialized) {
        throw new RpcException(-32003, 'The server has not been initialized');
      }
      return callback(params);
    });
  }

  /// Notifications are ignored until after initialization.
  void _registerNotification(Peer peer, String methodName, Function callback) {
    peer.registerMethod(methodName, (params) {
      if (_isInitialized) return callback(params);
    });
  }

  void _fileHandlingMethods(Peer peer) {
    _registerNotification(peer, 'textDocument/didOpen', (params) async {
      await _server.textDocumentDidOpen(_documentItem(params));
    });
    _registerNotification(peer, 'textDocument/didChange', (params) async {
      await _server.textDocumentDidChange(
          _versionedDocument(params), _contentChanges(params));
    });
    _registerNotification(peer, 'textDocument/didClose', (params) async {
      await _server.textDocumentDidClose(_document(params));
    });
  }

  void _diagnosticNotifications(Peer peer) {
    _server.diagnostics.map((d) => d.toJson()).listen((diagnostics) {
      peer.sendNotification('textDocument/publishDiagnostics', diagnostics);
    });
  }

  void _completionMethods(Peer peer) {
    _registerRequest(
        peer,
        'textDocument/completion',
        (params) => _server
            .textDocumentCompletion(_document(params), _position(params))
            .then((r) => r.toJson()));
  }

  void _referenceMethods(Peer peer) {
    _registerRequest(
        peer,
        'textDocument/definition',
        (params) => _server
            .textDocumentDefinition(_document(params), _position(params))
            .then((r) => r?.toJson()));
    _registerRequest(
        peer,
        'textDocument/hover',
        (params) => _server
            .textDocumentHover(_document(params), _position(params))
            .then((r) => r?.toJson()));
    _registerRequest(
        peer,
        'textDocument/references',
        (params) => _server
            .textDocumentReferences(
                _document(params), _position(params), _referenceCOntext(params))
            .then((r) => r?.map((e) => e.toJson())?.toList()));
  }

  void _codeActionMethods(Peer peer) {
    _registerRequest(
        peer,
        'textDocument/codeAction',
        (params) => _server
            .textDocumentCodeAction(
                _document(params), _range(params), _codeActionContext(params))
            .then((r) => r?.map((e) => e.toJson())?.toList()));
  }
}

_documentItem(params) =>
    new TextDocumentItem.fromJson(params['textDocument'].value);

_versionedDocument(params) =>
    new VersionedTextDocumentIdentifier.fromJson(params['textDocument'].value);

_document(params) =>
    new TextDocumentIdentifier.fromJson(params['textDocument'].value);

_range(params) => new Range.fromJson(params['range'].value);

_position(params) => new Range.fromJson(params['position'].value);

_codeActionContext(params) =>
    new CodeActionContext.fromJson(params['context'].value);

_referenceCOntext(params) =>
    new ReferenceContext.fromJson(params['context'].pvalue);

_contentChanges(params) => params['contentChanges']
    .value
    .map((change) => new TextDocumentContentChangeEvent.fromJson(change));
