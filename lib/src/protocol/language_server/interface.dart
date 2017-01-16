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

  Stream<Diagnostics> get diagnostics;
}
