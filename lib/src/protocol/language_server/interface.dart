import 'dart:async';

import 'package:json_rpc_2/json_rpc_2.dart';

import 'messages.dart';

abstract class LanguageServer {
  Future<Null> get onDone;

  Future<Null> shutdown() async {}
  void exit() {}

  Future<ServerCapabilities> initialize(int clientPid, String rootUri,
      ClientCapabilities clientCapabilities, String trace);
  void textDocumentDidOpen(TextDocumentItem document) {}
  void textDocumentDidChange(VersionedTextDocumentIdentifier documentId,
      List<TextDocumentContentChangeEvent> changes) {}
  void textDocumentDidClose(TextDocumentIdentifier documentId) {}
  Future<CompletionList> textDocumentCompletion(
      TextDocumentIdentifier documentId, Position position);
  Future<Location> textDocumentDefinition(
      TextDocumentIdentifier documentId, Position position);
  Future<List<Location>> textDocumentReferences(
      TextDocumentIdentifier documentId,
      Position position,
      ReferenceContext context);
  Future<Hover> textDocumentHover(
      TextDocumentIdentifier documentId, Position position);
  Future<List<Command>> textDocumentCodeAction(
      TextDocumentIdentifier documentId,
      Range range,
      CodeActionContext context);
  Future<Null> workspaceExecuteCommand(String command);
  Future<WorkspaceEdit> textDocumentRename(
      TextDocumentIdentifier documentId, Position position, String newName);
  Stream<Diagnostics> get diagnostics;
  Stream<ApplyWorkspaceEditParams> get workspaceEdits;

  void setupExtraMethods(Peer peer) {}
}
