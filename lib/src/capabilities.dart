import 'protocol/language_server/messages.dart';

final serverCapabilities = ServerCapabilities((b) => b
  ..textDocumentSync = TextDocumentSyncOptions((b) => b
    ..openClose = true
    ..change = TextDocumentSyncKind.incremental
    ..willSave = false
    ..willSaveWaitUntil = false
    ..save = SaveOptions((b) => b..includeText = false))
  ..completionProvider = CompletionOptions((b) => b
    ..resolveProvider = false
    ..triggerCharacters = const ['.'])
  ..codeActionProvider = true
  ..definitionProvider = true
  ..documentHighlightsProvider = true
  ..documentSymbolProvider = true
  ..hoverProvider = true
  ..implementationProvider = true
  ..referencesProvider = true
  ..renameProvider = true
  ..workspaceSymbolProvider = true
  ..codeLensProvider = null
  ..documentFormattingProvider = false
  ..documentRangeFormattingProvider = false
  ..documentOnTypeFormattingProvider = null);
