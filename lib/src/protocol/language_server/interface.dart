import 'dart:async';

import 'messages.dart';

abstract class LanguageServer {
  Future<Null> get onDone;

  Future<Null> shutdown() async {}
  void exit() {}

  void textDocumentDidOpen(TextDocumentItem document) {}
  void textDocumentDidChange(VersionedTextDocumentIdentifier documentId,
      List<TextDocumentContentChangeEvent> changes) {}
  void textDocumentDidClose(TextDocumentIdentifier documentId) {}
  Future<CompletionList> textDocumentCompletion(
      TextDocumentIdentifier documentId, Position position);
  Future<Location> textDocumentDefinition(
      TextDocumentIdentifier documentId, Position position);
  Stream<Diagnostics> get diagnostics;
}
