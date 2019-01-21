import 'dart:async';

import 'package:json_rpc_2/json_rpc_2.dart';

import 'messages.dart';

abstract class LanguageServer {
  Future<void> get onDone;

  Future<void> shutdown() async {}
  void exit() {}

  Future<ServerCapabilities> initialize(int clientPid, String rootUri,
      ClientCapabilities clientCapabilities, String trace);
  void initialized();
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
  Future<List<Location>> textDocumentImplementation(
      TextDocumentIdentifier documentId, Position position);
  Future<List<DocumentHighlight>> textDocumentHighlight(
      TextDocumentIdentifier documentId, Position position);
  Future<List<SymbolInformation>> textDocumentSymbols(
      TextDocumentIdentifier documentId);
  Future<List<SymbolInformation>> workspaceSymbol(String query);
  Future<dynamic> textDocumentHover(
      TextDocumentIdentifier documentId, Position position);
  Future<List<dynamic /*Command|CodeAction*/ >> textDocumentCodeAction(
      TextDocumentIdentifier documentId,
      Range range,
      CodeActionContext context);
  Future<void> workspaceExecuteCommand(String command, List<dynamic> arguments);
  Future<WorkspaceEdit> textDocumentRename(
      TextDocumentIdentifier documentId, Position position, String newName);
  Stream<Diagnostics> get diagnostics;
  Stream<ApplyWorkspaceEditParams> get workspaceEdits;
  Stream<ShowMessageParams> get showMessages;
  Stream<ShowMessageParams> get logMessages;

  void setupExtraMethods(Peer peer) {}
}
