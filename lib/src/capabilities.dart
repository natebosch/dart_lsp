import 'protocol/language_server/messages.dart';

final serverCapabilities = new ServerCapabilities((b) => b
  ..textDocumentSync = new TextDocumentSyncOptions((b) => b
    ..openClose = true
    ..change = TextDocumentSyncKind.incremental
    ..willSave = false
    ..willSaveWaitUntil = false
    ..save = false)
  ..completionProvider = new CompletionOptions((b) => b
    ..resolveProvider = false
    ..triggerCharacters = const ['.'])
  ..codeActionProvider = true
  ..definitionProvider = true
  ..documentHighlightsProvider = true
  ..hoverProvider = true
  ..referencesProvider = true
  ..renameProvider = true
  ..documentSymbolProvider = false
  ..workspaceSymbolProvider = false
  ..codeLensProvider = false
  ..documentFormattingProvider = false
  ..documentRangeFormattingProvider = false
  ..documentOnTypeFormattingProvider = false);
