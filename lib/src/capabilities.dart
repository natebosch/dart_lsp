import 'protocol/language_server/messages.dart';

final serverCapabilities = new ServerCapabilities((b) => b
  ..textDocumentSync = new TextDocumentSyncOptions((b) => b
    ..openClose = true
    ..change = TextDocumentSyncKind.incremental
    ..willSave = false
    ..willSaveWaitUntil = false
    ..save = false)
  ..hoverProvider = true
  ..completionProvider = new CompletionOptions((b) => b
    ..resolveProvider = false
    ..triggerCharacters = const ['.'])
  ..definitionProvider = true
  ..referencesProvider = true
  ..codeActionProvider = true
  ..documentHighlightsProvider = false
  ..documentSymbolProvider = false
  ..workspaceSymbolProvider = false
  ..codeLensProvider = false
  ..documentFormattingProvider = false
  ..documentRangeFormattingProvider = false
  ..documentOnTypeFormattingProvider = false
  ..renameProvider = false);
