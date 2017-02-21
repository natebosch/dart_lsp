class SignatureHelpOptions {
  final List<String> triggerCharacters;

  SignatureHelpOptions._(this.triggerCharacters);
  factory SignatureHelpOptions(void init(SignatureHelpOptions$Builder b)) {
    var b = new SignatureHelpOptions$Builder._();
    init(b);
    return new SignatureHelpOptions._(b.triggerCharacters);
  }

  factory SignatureHelpOptions.fromJson(Map params) =>
      new SignatureHelpOptions._(params.containsKey("triggerCharacters")
          ? params["triggerCharacters"]
          : null);

  Map toJson() => {"triggerCharacters": triggerCharacters};

  @override
  bool operator ==(Object other) {
    if (other is! SignatureHelpOptions) return false;
    var o = other as SignatureHelpOptions;
    if (!_deepEquals(triggerCharacters, o.triggerCharacters)) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [triggerCharacters]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class SignatureHelpOptions$Builder {
  List<String> triggerCharacters;

  SignatureHelpOptions$Builder._();
}

class VersionedTextDocumentIdentifier {
  final int version;
  final String uri;

  VersionedTextDocumentIdentifier._(this.version, this.uri);
  factory VersionedTextDocumentIdentifier(
      void init(VersionedTextDocumentIdentifier$Builder b)) {
    var b = new VersionedTextDocumentIdentifier$Builder._();
    init(b);
    return new VersionedTextDocumentIdentifier._(b.version, b.uri);
  }

  factory VersionedTextDocumentIdentifier.fromJson(Map params) =>
      new VersionedTextDocumentIdentifier._(
          params.containsKey("version") ? params["version"] : null,
          params.containsKey("uri") ? params["uri"] : null);

  Map toJson() => {"version": version, "uri": uri};

  @override
  bool operator ==(Object other) {
    if (other is! VersionedTextDocumentIdentifier) return false;
    var o = other as VersionedTextDocumentIdentifier;
    if (version != o.version) return false;
    if (uri != o.uri) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [version, uri]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class VersionedTextDocumentIdentifier$Builder {
  int version;
  String uri;

  VersionedTextDocumentIdentifier$Builder._();
}

class TextDocumentSyncKind {
  static const none = const TextDocumentSyncKind._(0);
  static const full = const TextDocumentSyncKind._(1);
  static const incremental = const TextDocumentSyncKind._(2);
  final int _value;
  const TextDocumentSyncKind._(this._value);
  factory TextDocumentSyncKind.fromJson(int value) {
    const values = const {
      0: TextDocumentSyncKind.none,
      1: TextDocumentSyncKind.full,
      2: TextDocumentSyncKind.incremental
    };
    return values[value];
  }
  int toJson() => _value;
}

class CompletionOptions {
  final List<String> triggerCharacters;
  final bool resolveProvider;

  CompletionOptions._(this.triggerCharacters, this.resolveProvider);
  factory CompletionOptions(void init(CompletionOptions$Builder b)) {
    var b = new CompletionOptions$Builder._();
    init(b);
    return new CompletionOptions._(b.triggerCharacters, b.resolveProvider);
  }

  factory CompletionOptions.fromJson(Map params) => new CompletionOptions._(
      params.containsKey("triggerCharacters")
          ? params["triggerCharacters"]
          : null,
      params.containsKey("resolveProvider") ? params["resolveProvider"] : null);

  Map toJson() => {
        "triggerCharacters": triggerCharacters,
        "resolveProvider": resolveProvider
      };

  @override
  bool operator ==(Object other) {
    if (other is! CompletionOptions) return false;
    var o = other as CompletionOptions;
    if (!_deepEquals(triggerCharacters, o.triggerCharacters)) return false;
    if (resolveProvider != o.resolveProvider) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [triggerCharacters, resolveProvider]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class CompletionOptions$Builder {
  List<String> triggerCharacters;
  bool resolveProvider;

  CompletionOptions$Builder._();
}

class TextDocumentSyncOptions {
  final bool save;
  final bool willSaveWaitUntil;
  final TextDocumentSyncKind change;
  final bool willSave;
  final bool openClose;

  TextDocumentSyncOptions._(this.save, this.willSaveWaitUntil, this.change,
      this.willSave, this.openClose);
  factory TextDocumentSyncOptions(
      void init(TextDocumentSyncOptions$Builder b)) {
    var b = new TextDocumentSyncOptions$Builder._();
    init(b);
    return new TextDocumentSyncOptions._(
        b.save, b.willSaveWaitUntil, b.change, b.willSave, b.openClose);
  }

  factory TextDocumentSyncOptions.fromJson(
          Map params) =>
      new TextDocumentSyncOptions._(
          params.containsKey("save") ? params["save"] : null,
          params.containsKey("willSaveWaitUntil")
              ? params["willSaveWaitUntil"]
              : null,
          params.containsKey("change")
              ? new TextDocumentSyncKind.fromJson(params["change"])
              : null,
          params.containsKey("willSave") ? params["willSave"] : null,
          params.containsKey("openClose") ? params["openClose"] : null);

  Map toJson() => {
        "save": save,
        "willSaveWaitUntil": willSaveWaitUntil,
        "change": change?.toJson(),
        "willSave": willSave,
        "openClose": openClose
      };

  @override
  bool operator ==(Object other) {
    if (other is! TextDocumentSyncOptions) return false;
    var o = other as TextDocumentSyncOptions;
    if (save != o.save) return false;
    if (willSaveWaitUntil != o.willSaveWaitUntil) return false;
    if (change != o.change) return false;
    if (willSave != o.willSave) return false;
    if (openClose != o.openClose) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [save, willSaveWaitUntil, change, willSave, openClose]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class TextDocumentSyncOptions$Builder {
  bool save;
  bool willSaveWaitUntil;
  TextDocumentSyncKind change;
  bool willSave;
  bool openClose;

  TextDocumentSyncOptions$Builder._();
}

class ServerCapabilities {
  final bool documentOnTypeFormattingProvider;
  final bool codeActionProvider;
  final bool referencesProvider;
  final bool documentSymbolProvider;
  final bool documentHighlightsProvider;
  final bool workspaceSymbolProvider;
  final ExecuteCommandOptions executeCommandProvider;
  final bool documentFormattingProvider;
  final bool renameProvider;
  final SignatureHelpOptions signatureHelpProvider;
  final bool codeLensProvider;
  final DocumentLinkOptions documentLinkProvider;
  final TextDocumentSyncOptions textDocumentSync;
  final bool definitionProvider;
  final bool hoverProvider;
  final bool documentRangeFormattingProvider;
  final CompletionOptions completionProvider;

  ServerCapabilities._(
      this.documentOnTypeFormattingProvider,
      this.codeActionProvider,
      this.referencesProvider,
      this.documentSymbolProvider,
      this.documentHighlightsProvider,
      this.workspaceSymbolProvider,
      this.executeCommandProvider,
      this.documentFormattingProvider,
      this.renameProvider,
      this.signatureHelpProvider,
      this.codeLensProvider,
      this.documentLinkProvider,
      this.textDocumentSync,
      this.definitionProvider,
      this.hoverProvider,
      this.documentRangeFormattingProvider,
      this.completionProvider);
  factory ServerCapabilities(void init(ServerCapabilities$Builder b)) {
    var b = new ServerCapabilities$Builder._();
    init(b);
    return new ServerCapabilities._(
        b.documentOnTypeFormattingProvider,
        b.codeActionProvider,
        b.referencesProvider,
        b.documentSymbolProvider,
        b.documentHighlightsProvider,
        b.workspaceSymbolProvider,
        b.executeCommandProvider,
        b.documentFormattingProvider,
        b.renameProvider,
        b.signatureHelpProvider,
        b.codeLensProvider,
        b.documentLinkProvider,
        b.textDocumentSync,
        b.definitionProvider,
        b.hoverProvider,
        b.documentRangeFormattingProvider,
        b.completionProvider);
  }

  factory ServerCapabilities.fromJson(Map params) => new ServerCapabilities._(
      params.containsKey("documentOnTypeFormattingProvider")
          ? params["documentOnTypeFormattingProvider"]
          : null,
      params.containsKey("codeActionProvider")
          ? params["codeActionProvider"]
          : null,
      params.containsKey("referencesProvider")
          ? params["referencesProvider"]
          : null,
      params.containsKey("documentSymbolProvider")
          ? params["documentSymbolProvider"]
          : null,
      params.containsKey("documentHighlightsProvider")
          ? params["documentHighlightsProvider"]
          : null,
      params.containsKey("workspaceSymbolProvider")
          ? params["workspaceSymbolProvider"]
          : null,
      params.containsKey("executeCommandProvider")
          ? new ExecuteCommandOptions.fromJson(params["executeCommandProvider"])
          : null,
      params.containsKey("documentFormattingProvider")
          ? params["documentFormattingProvider"]
          : null,
      params.containsKey("renameProvider") ? params["renameProvider"] : null,
      params.containsKey("signatureHelpProvider")
          ? new SignatureHelpOptions.fromJson(params["signatureHelpProvider"])
          : null,
      params.containsKey("codeLensProvider")
          ? params["codeLensProvider"]
          : null,
      params.containsKey("documentLinkProvider")
          ? new DocumentLinkOptions.fromJson(params["documentLinkProvider"])
          : null,
      params.containsKey("textDocumentSync")
          ? new TextDocumentSyncOptions.fromJson(params["textDocumentSync"])
          : null,
      params.containsKey("definitionProvider")
          ? params["definitionProvider"]
          : null,
      params.containsKey("hoverProvider") ? params["hoverProvider"] : null,
      params.containsKey("documentRangeFormattingProvider")
          ? params["documentRangeFormattingProvider"]
          : null,
      params.containsKey("completionProvider")
          ? new CompletionOptions.fromJson(params["completionProvider"])
          : null);

  Map toJson() => {
        "documentOnTypeFormattingProvider": documentOnTypeFormattingProvider,
        "codeActionProvider": codeActionProvider,
        "referencesProvider": referencesProvider,
        "documentSymbolProvider": documentSymbolProvider,
        "documentHighlightsProvider": documentHighlightsProvider,
        "workspaceSymbolProvider": workspaceSymbolProvider,
        "executeCommandProvider": executeCommandProvider?.toJson(),
        "documentFormattingProvider": documentFormattingProvider,
        "renameProvider": renameProvider,
        "signatureHelpProvider": signatureHelpProvider?.toJson(),
        "codeLensProvider": codeLensProvider,
        "documentLinkProvider": documentLinkProvider?.toJson(),
        "textDocumentSync": textDocumentSync?.toJson(),
        "definitionProvider": definitionProvider,
        "hoverProvider": hoverProvider,
        "documentRangeFormattingProvider": documentRangeFormattingProvider,
        "completionProvider": completionProvider?.toJson()
      };

  @override
  bool operator ==(Object other) {
    if (other is! ServerCapabilities) return false;
    var o = other as ServerCapabilities;
    if (documentOnTypeFormattingProvider != o.documentOnTypeFormattingProvider)
      return false;
    if (codeActionProvider != o.codeActionProvider) return false;
    if (referencesProvider != o.referencesProvider) return false;
    if (documentSymbolProvider != o.documentSymbolProvider) return false;
    if (documentHighlightsProvider != o.documentHighlightsProvider)
      return false;
    if (workspaceSymbolProvider != o.workspaceSymbolProvider) return false;
    if (executeCommandProvider != o.executeCommandProvider) return false;
    if (documentFormattingProvider != o.documentFormattingProvider)
      return false;
    if (renameProvider != o.renameProvider) return false;
    if (signatureHelpProvider != o.signatureHelpProvider) return false;
    if (codeLensProvider != o.codeLensProvider) return false;
    if (documentLinkProvider != o.documentLinkProvider) return false;
    if (textDocumentSync != o.textDocumentSync) return false;
    if (definitionProvider != o.definitionProvider) return false;
    if (hoverProvider != o.hoverProvider) return false;
    if (documentRangeFormattingProvider != o.documentRangeFormattingProvider)
      return false;
    if (completionProvider != o.completionProvider) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [
      documentOnTypeFormattingProvider,
      codeActionProvider,
      referencesProvider,
      documentSymbolProvider,
      documentHighlightsProvider,
      workspaceSymbolProvider,
      executeCommandProvider,
      documentFormattingProvider,
      renameProvider,
      signatureHelpProvider,
      codeLensProvider,
      documentLinkProvider,
      textDocumentSync,
      definitionProvider,
      hoverProvider,
      documentRangeFormattingProvider,
      completionProvider
    ]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class ServerCapabilities$Builder {
  bool documentOnTypeFormattingProvider;
  bool codeActionProvider;
  bool referencesProvider;
  bool documentSymbolProvider;
  bool documentHighlightsProvider;
  bool workspaceSymbolProvider;
  ExecuteCommandOptions executeCommandProvider;
  bool documentFormattingProvider;
  bool renameProvider;
  SignatureHelpOptions signatureHelpProvider;
  bool codeLensProvider;
  DocumentLinkOptions documentLinkProvider;
  TextDocumentSyncOptions textDocumentSync;
  bool definitionProvider;
  bool hoverProvider;
  bool documentRangeFormattingProvider;
  CompletionOptions completionProvider;

  ServerCapabilities$Builder._();
}

class TextDocumentIdentifier {
  final String uri;

  TextDocumentIdentifier._(this.uri);
  factory TextDocumentIdentifier(void init(TextDocumentIdentifier$Builder b)) {
    var b = new TextDocumentIdentifier$Builder._();
    init(b);
    return new TextDocumentIdentifier._(b.uri);
  }

  factory TextDocumentIdentifier.fromJson(Map params) =>
      new TextDocumentIdentifier._(
          params.containsKey("uri") ? params["uri"] : null);

  Map toJson() => {"uri": uri};

  @override
  bool operator ==(Object other) {
    if (other is! TextDocumentIdentifier) return false;
    var o = other as TextDocumentIdentifier;
    if (uri != o.uri) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [uri]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class TextDocumentIdentifier$Builder {
  String uri;

  TextDocumentIdentifier$Builder._();
}

class Diagnostic {
  final String source;
  final Range range;
  final int severity;
  final String message;
  final dynamic code;

  Diagnostic._(this.source, this.range, this.severity, this.message, this.code);
  factory Diagnostic(void init(Diagnostic$Builder b)) {
    var b = new Diagnostic$Builder._();
    init(b);
    return new Diagnostic._(b.source, b.range, b.severity, b.message, b.code);
  }

  factory Diagnostic.fromJson(Map params) => new Diagnostic._(
      params.containsKey("source") ? params["source"] : null,
      params.containsKey("range") ? new Range.fromJson(params["range"]) : null,
      params.containsKey("severity") ? params["severity"] : null,
      params.containsKey("message") ? params["message"] : null,
      params.containsKey("code") ? params["code"] : null);

  Map toJson() => {
        "source": source,
        "range": range?.toJson(),
        "severity": severity,
        "message": message,
        "code": code
      };

  @override
  bool operator ==(Object other) {
    if (other is! Diagnostic) return false;
    var o = other as Diagnostic;
    if (source != o.source) return false;
    if (range != o.range) return false;
    if (severity != o.severity) return false;
    if (message != o.message) return false;
    if (code != o.code) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [source, range, severity, message, code]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class Diagnostic$Builder {
  String source;
  Range range;
  int severity;
  String message;
  dynamic code;

  Diagnostic$Builder._();
}

class ExecuteCommandOptions {
  final List<String> commands;

  ExecuteCommandOptions._(this.commands);
  factory ExecuteCommandOptions(void init(ExecuteCommandOptions$Builder b)) {
    var b = new ExecuteCommandOptions$Builder._();
    init(b);
    return new ExecuteCommandOptions._(b.commands);
  }

  factory ExecuteCommandOptions.fromJson(Map params) =>
      new ExecuteCommandOptions._(
          params.containsKey("commands") ? params["commands"] : null);

  Map toJson() => {"commands": commands};

  @override
  bool operator ==(Object other) {
    if (other is! ExecuteCommandOptions) return false;
    var o = other as ExecuteCommandOptions;
    if (!_deepEquals(commands, o.commands)) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [commands]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class ExecuteCommandOptions$Builder {
  List<String> commands;

  ExecuteCommandOptions$Builder._();
}

class WorkspaceClientCapabilities {
  final DynamicRegistrationCapability symbol;
  final DynamicRegistrationCapability didChangeWatchedFiles;
  final DynamicRegistrationCapability didChangeConfiguration;
  final DynamicRegistrationCapability executeCommand;
  final bool applyEdit;

  WorkspaceClientCapabilities._(this.symbol, this.didChangeWatchedFiles,
      this.didChangeConfiguration, this.executeCommand, this.applyEdit);
  factory WorkspaceClientCapabilities(
      void init(WorkspaceClientCapabilities$Builder b)) {
    var b = new WorkspaceClientCapabilities$Builder._();
    init(b);
    return new WorkspaceClientCapabilities._(b.symbol, b.didChangeWatchedFiles,
        b.didChangeConfiguration, b.executeCommand, b.applyEdit);
  }

  factory WorkspaceClientCapabilities.fromJson(
          Map params) =>
      new WorkspaceClientCapabilities._(
          params.containsKey("symbol")
              ? new DynamicRegistrationCapability.fromJson(params["symbol"])
              : null,
          params.containsKey("didChangeWatchedFiles")
              ? new DynamicRegistrationCapability.fromJson(
                  params["didChangeWatchedFiles"])
              : null,
          params.containsKey("didChangeConfiguration")
              ? new DynamicRegistrationCapability.fromJson(
                  params["didChangeConfiguration"])
              : null,
          params.containsKey("executeCommand")
              ? new DynamicRegistrationCapability.fromJson(
                  params["executeCommand"])
              : null,
          params.containsKey("applyEdit") ? params["applyEdit"] : null);

  Map toJson() => {
        "symbol": symbol?.toJson(),
        "didChangeWatchedFiles": didChangeWatchedFiles?.toJson(),
        "didChangeConfiguration": didChangeConfiguration?.toJson(),
        "executeCommand": executeCommand?.toJson(),
        "applyEdit": applyEdit
      };

  @override
  bool operator ==(Object other) {
    if (other is! WorkspaceClientCapabilities) return false;
    var o = other as WorkspaceClientCapabilities;
    if (symbol != o.symbol) return false;
    if (didChangeWatchedFiles != o.didChangeWatchedFiles) return false;
    if (didChangeConfiguration != o.didChangeConfiguration) return false;
    if (executeCommand != o.executeCommand) return false;
    if (applyEdit != o.applyEdit) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [
      symbol,
      didChangeWatchedFiles,
      didChangeConfiguration,
      executeCommand,
      applyEdit
    ]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class WorkspaceClientCapabilities$Builder {
  DynamicRegistrationCapability symbol;
  DynamicRegistrationCapability didChangeWatchedFiles;
  DynamicRegistrationCapability didChangeConfiguration;
  DynamicRegistrationCapability executeCommand;
  bool applyEdit;

  WorkspaceClientCapabilities$Builder._();
}

class CompletionItem {
  final TextEdit textEdit;
  final String sortText;
  final dynamic data;
  final String filterText;
  final String detail;
  final CompletionItemKind kind;
  final List<TextEdit> additionalTextEdits;
  final String documentation;
  final String label;
  final String insertText;
  final Command command;
  final InsertTextFormat insertTextFormat;

  CompletionItem._(
      this.textEdit,
      this.sortText,
      this.data,
      this.filterText,
      this.detail,
      this.kind,
      this.additionalTextEdits,
      this.documentation,
      this.label,
      this.insertText,
      this.command,
      this.insertTextFormat);
  factory CompletionItem(void init(CompletionItem$Builder b)) {
    var b = new CompletionItem$Builder._();
    init(b);
    return new CompletionItem._(
        b.textEdit,
        b.sortText,
        b.data,
        b.filterText,
        b.detail,
        b.kind,
        b.additionalTextEdits,
        b.documentation,
        b.label,
        b.insertText,
        b.command,
        b.insertTextFormat);
  }

  factory CompletionItem.fromJson(Map params) => new CompletionItem._(
      params.containsKey("textEdit")
          ? new TextEdit.fromJson(params["textEdit"])
          : null,
      params.containsKey("sortText") ? params["sortText"] : null,
      params.containsKey("data") ? params["data"] : null,
      params.containsKey("filterText") ? params["filterText"] : null,
      params.containsKey("detail") ? params["detail"] : null,
      params.containsKey("kind")
          ? new CompletionItemKind.fromJson(params["kind"])
          : null,
      params.containsKey("additionalTextEdits")
          ? params["additionalTextEdits"]
              .map((v) => new TextEdit.fromJson(v))
              .toList()
          : null,
      params.containsKey("documentation") ? params["documentation"] : null,
      params.containsKey("label") ? params["label"] : null,
      params.containsKey("insertText") ? params["insertText"] : null,
      params.containsKey("command")
          ? new Command.fromJson(params["command"])
          : null,
      params.containsKey("insertTextFormat")
          ? new InsertTextFormat.fromJson(params["insertTextFormat"])
          : null);

  Map toJson() => {
        "textEdit": textEdit?.toJson(),
        "sortText": sortText,
        "data": data,
        "filterText": filterText,
        "detail": detail,
        "kind": kind?.toJson(),
        "additionalTextEdits":
            additionalTextEdits?.map((v) => v?.toJson())?.toList(),
        "documentation": documentation,
        "label": label,
        "insertText": insertText,
        "command": command?.toJson(),
        "insertTextFormat": insertTextFormat?.toJson()
      };

  @override
  bool operator ==(Object other) {
    if (other is! CompletionItem) return false;
    var o = other as CompletionItem;
    if (textEdit != o.textEdit) return false;
    if (sortText != o.sortText) return false;
    if (data != o.data) return false;
    if (filterText != o.filterText) return false;
    if (detail != o.detail) return false;
    if (kind != o.kind) return false;
    if (!_deepEquals(additionalTextEdits, o.additionalTextEdits)) return false;
    if (documentation != o.documentation) return false;
    if (label != o.label) return false;
    if (insertText != o.insertText) return false;
    if (command != o.command) return false;
    if (insertTextFormat != o.insertTextFormat) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [
      textEdit,
      sortText,
      data,
      filterText,
      detail,
      kind,
      additionalTextEdits,
      documentation,
      label,
      insertText,
      command,
      insertTextFormat
    ]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class CompletionItem$Builder {
  TextEdit textEdit;
  String sortText;
  dynamic data;
  String filterText;
  String detail;
  CompletionItemKind kind;
  List<TextEdit> additionalTextEdits;
  String documentation;
  String label;
  String insertText;
  Command command;
  InsertTextFormat insertTextFormat;

  CompletionItem$Builder._();
}

class Position {
  final int character;
  final int line;

  Position._(this.character, this.line);
  factory Position(void init(Position$Builder b)) {
    var b = new Position$Builder._();
    init(b);
    return new Position._(b.character, b.line);
  }

  factory Position.fromJson(Map params) => new Position._(
      params.containsKey("character") ? params["character"] : null,
      params.containsKey("line") ? params["line"] : null);

  Map toJson() => {"character": character, "line": line};

  @override
  bool operator ==(Object other) {
    if (other is! Position) return false;
    var o = other as Position;
    if (character != o.character) return false;
    if (line != o.line) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [character, line]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class Position$Builder {
  int character;
  int line;

  Position$Builder._();
}

class CompletionItemKind {
  static const keyword = const CompletionItemKind._(14);
  static const variable = const CompletionItemKind._(6);
  static const function = const CompletionItemKind._(3);
  static const file = const CompletionItemKind._(17);
  static const classKind = const CompletionItemKind._(7);
  static const color = const CompletionItemKind._(16);
  static const reference = const CompletionItemKind._(18);
  static const text = const CompletionItemKind._(1);
  static const interface = const CompletionItemKind._(8);
  static const method = const CompletionItemKind._(2);
  static const field = const CompletionItemKind._(5);
  static const module = const CompletionItemKind._(9);
  static const property = const CompletionItemKind._(10);
  static const snippet = const CompletionItemKind._(15);
  static const constructor = const CompletionItemKind._(4);
  static const value = const CompletionItemKind._(12);
  static const enumKind = const CompletionItemKind._(13);
  static const unit = const CompletionItemKind._(11);
  final int _value;
  const CompletionItemKind._(this._value);
  factory CompletionItemKind.fromJson(int value) {
    const values = const {
      14: CompletionItemKind.keyword,
      6: CompletionItemKind.variable,
      3: CompletionItemKind.function,
      17: CompletionItemKind.file,
      7: CompletionItemKind.classKind,
      16: CompletionItemKind.color,
      18: CompletionItemKind.reference,
      1: CompletionItemKind.text,
      8: CompletionItemKind.interface,
      2: CompletionItemKind.method,
      5: CompletionItemKind.field,
      9: CompletionItemKind.module,
      10: CompletionItemKind.property,
      15: CompletionItemKind.snippet,
      4: CompletionItemKind.constructor,
      12: CompletionItemKind.value,
      13: CompletionItemKind.enumKind,
      11: CompletionItemKind.unit
    };
    return values[value];
  }
  int toJson() => _value;
}

class SynchronizationCapabilities {
  final bool didSave;
  final bool willSaveWaitUntil;
  final bool willSave;
  final bool dynamicRegistration;

  SynchronizationCapabilities._(this.didSave, this.willSaveWaitUntil,
      this.willSave, this.dynamicRegistration);
  factory SynchronizationCapabilities(
      void init(SynchronizationCapabilities$Builder b)) {
    var b = new SynchronizationCapabilities$Builder._();
    init(b);
    return new SynchronizationCapabilities._(
        b.didSave, b.willSaveWaitUntil, b.willSave, b.dynamicRegistration);
  }

  factory SynchronizationCapabilities.fromJson(Map params) =>
      new SynchronizationCapabilities._(
          params.containsKey("didSave") ? params["didSave"] : null,
          params.containsKey("willSaveWaitUntil")
              ? params["willSaveWaitUntil"]
              : null,
          params.containsKey("willSave") ? params["willSave"] : null,
          params.containsKey("dynamicRegistration")
              ? params["dynamicRegistration"]
              : null);

  Map toJson() => {
        "didSave": didSave,
        "willSaveWaitUntil": willSaveWaitUntil,
        "willSave": willSave,
        "dynamicRegistration": dynamicRegistration
      };

  @override
  bool operator ==(Object other) {
    if (other is! SynchronizationCapabilities) return false;
    var o = other as SynchronizationCapabilities;
    if (didSave != o.didSave) return false;
    if (willSaveWaitUntil != o.willSaveWaitUntil) return false;
    if (willSave != o.willSave) return false;
    if (dynamicRegistration != o.dynamicRegistration) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [
      didSave,
      willSaveWaitUntil,
      willSave,
      dynamicRegistration
    ]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class SynchronizationCapabilities$Builder {
  bool didSave;
  bool willSaveWaitUntil;
  bool willSave;
  bool dynamicRegistration;

  SynchronizationCapabilities$Builder._();
}

class Command {
  final List<dynamic> arguments;
  final String title;
  final String command;

  Command._(this.arguments, this.title, this.command);
  factory Command(void init(Command$Builder b)) {
    var b = new Command$Builder._();
    init(b);
    return new Command._(b.arguments, b.title, b.command);
  }

  factory Command.fromJson(Map params) => new Command._(
      params.containsKey("arguments") ? params["arguments"] : null,
      params.containsKey("title") ? params["title"] : null,
      params.containsKey("command") ? params["command"] : null);

  Map toJson() => {"arguments": arguments, "title": title, "command": command};

  @override
  bool operator ==(Object other) {
    if (other is! Command) return false;
    var o = other as Command;
    if (!_deepEquals(arguments, o.arguments)) return false;
    if (title != o.title) return false;
    if (command != o.command) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [arguments, title, command]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class Command$Builder {
  List<dynamic> arguments;
  String title;
  String command;

  Command$Builder._();
}

class CodeLensOptions {
  final bool resolveProvider;

  CodeLensOptions._(this.resolveProvider);
  factory CodeLensOptions(void init(CodeLensOptions$Builder b)) {
    var b = new CodeLensOptions$Builder._();
    init(b);
    return new CodeLensOptions._(b.resolveProvider);
  }

  factory CodeLensOptions.fromJson(Map params) => new CodeLensOptions._(
      params.containsKey("resolveProvider") ? params["resolveProvider"] : null);

  Map toJson() => {"resolveProvider": resolveProvider};

  @override
  bool operator ==(Object other) {
    if (other is! CodeLensOptions) return false;
    var o = other as CodeLensOptions;
    if (resolveProvider != o.resolveProvider) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [resolveProvider]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class CodeLensOptions$Builder {
  bool resolveProvider;

  CodeLensOptions$Builder._();
}

class Range {
  final Position end;
  final Position start;

  Range._(this.end, this.start);
  factory Range(void init(Range$Builder b)) {
    var b = new Range$Builder._();
    init(b);
    return new Range._(b.end, b.start);
  }

  factory Range.fromJson(Map params) => new Range._(
      params.containsKey("end") ? new Position.fromJson(params["end"]) : null,
      params.containsKey("start")
          ? new Position.fromJson(params["start"])
          : null);

  Map toJson() => {"end": end?.toJson(), "start": start?.toJson()};

  @override
  bool operator ==(Object other) {
    if (other is! Range) return false;
    var o = other as Range;
    if (end != o.end) return false;
    if (start != o.start) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [end, start]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class Range$Builder {
  Position end;
  Position start;

  Range$Builder._();
}

class TextDocumentClientCapabilities {
  final DynamicRegistrationCapability codeLens;
  final DynamicRegistrationCapability formatting;
  final DynamicRegistrationCapability definition;
  final DynamicRegistrationCapability documentHighlight;
  final DynamicRegistrationCapability rename;
  final DynamicRegistrationCapability references;
  final DynamicRegistrationCapability documentLink;
  final DynamicRegistrationCapability codeAction;
  final DynamicRegistrationCapability documentSymbol;
  final CompletionCapabilities completion;
  final SynchronizationCapabilities synchronization;
  final DynamicRegistrationCapability hover;
  final DynamicRegistrationCapability onTypeFormatting;

  TextDocumentClientCapabilities._(
      this.codeLens,
      this.formatting,
      this.definition,
      this.documentHighlight,
      this.rename,
      this.references,
      this.documentLink,
      this.codeAction,
      this.documentSymbol,
      this.completion,
      this.synchronization,
      this.hover,
      this.onTypeFormatting);
  factory TextDocumentClientCapabilities(
      void init(TextDocumentClientCapabilities$Builder b)) {
    var b = new TextDocumentClientCapabilities$Builder._();
    init(b);
    return new TextDocumentClientCapabilities._(
        b.codeLens,
        b.formatting,
        b.definition,
        b.documentHighlight,
        b.rename,
        b.references,
        b.documentLink,
        b.codeAction,
        b.documentSymbol,
        b.completion,
        b.synchronization,
        b.hover,
        b.onTypeFormatting);
  }

  factory TextDocumentClientCapabilities.fromJson(Map params) =>
      new TextDocumentClientCapabilities._(
          params.containsKey("codeLens")
              ? new DynamicRegistrationCapability.fromJson(params["codeLens"])
              : null,
          params.containsKey("formatting")
              ? new DynamicRegistrationCapability.fromJson(params["formatting"])
              : null,
          params.containsKey("definition")
              ? new DynamicRegistrationCapability.fromJson(params["definition"])
              : null,
          params.containsKey("documentHighlight")
              ? new DynamicRegistrationCapability.fromJson(
                  params["documentHighlight"])
              : null,
          params.containsKey("rename")
              ? new DynamicRegistrationCapability.fromJson(params["rename"])
              : null,
          params.containsKey("references")
              ? new DynamicRegistrationCapability.fromJson(params["references"])
              : null,
          params.containsKey("documentLink")
              ? new DynamicRegistrationCapability.fromJson(
                  params["documentLink"])
              : null,
          params.containsKey("codeAction")
              ? new DynamicRegistrationCapability.fromJson(params["codeAction"])
              : null,
          params.containsKey("documentSymbol")
              ? new DynamicRegistrationCapability.fromJson(
                  params["documentSymbol"])
              : null,
          params.containsKey("completion")
              ? new CompletionCapabilities.fromJson(params["completion"])
              : null,
          params.containsKey("synchronization")
              ? new SynchronizationCapabilities.fromJson(
                  params["synchronization"])
              : null,
          params.containsKey("hover")
              ? new DynamicRegistrationCapability.fromJson(params["hover"])
              : null,
          params.containsKey("onTypeFormatting")
              ? new DynamicRegistrationCapability.fromJson(
                  params["onTypeFormatting"])
              : null);

  Map toJson() => {
        "codeLens": codeLens?.toJson(),
        "formatting": formatting?.toJson(),
        "definition": definition?.toJson(),
        "documentHighlight": documentHighlight?.toJson(),
        "rename": rename?.toJson(),
        "references": references?.toJson(),
        "documentLink": documentLink?.toJson(),
        "codeAction": codeAction?.toJson(),
        "documentSymbol": documentSymbol?.toJson(),
        "completion": completion?.toJson(),
        "synchronization": synchronization?.toJson(),
        "hover": hover?.toJson(),
        "onTypeFormatting": onTypeFormatting?.toJson()
      };

  @override
  bool operator ==(Object other) {
    if (other is! TextDocumentClientCapabilities) return false;
    var o = other as TextDocumentClientCapabilities;
    if (codeLens != o.codeLens) return false;
    if (formatting != o.formatting) return false;
    if (definition != o.definition) return false;
    if (documentHighlight != o.documentHighlight) return false;
    if (rename != o.rename) return false;
    if (references != o.references) return false;
    if (documentLink != o.documentLink) return false;
    if (codeAction != o.codeAction) return false;
    if (documentSymbol != o.documentSymbol) return false;
    if (completion != o.completion) return false;
    if (synchronization != o.synchronization) return false;
    if (hover != o.hover) return false;
    if (onTypeFormatting != o.onTypeFormatting) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [
      codeLens,
      formatting,
      definition,
      documentHighlight,
      rename,
      references,
      documentLink,
      codeAction,
      documentSymbol,
      completion,
      synchronization,
      hover,
      onTypeFormatting
    ]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class TextDocumentClientCapabilities$Builder {
  DynamicRegistrationCapability codeLens;
  DynamicRegistrationCapability formatting;
  DynamicRegistrationCapability definition;
  DynamicRegistrationCapability documentHighlight;
  DynamicRegistrationCapability rename;
  DynamicRegistrationCapability references;
  DynamicRegistrationCapability documentLink;
  DynamicRegistrationCapability codeAction;
  DynamicRegistrationCapability documentSymbol;
  CompletionCapabilities completion;
  SynchronizationCapabilities synchronization;
  DynamicRegistrationCapability hover;
  DynamicRegistrationCapability onTypeFormatting;

  TextDocumentClientCapabilities$Builder._();
}

class CompletionItemCapabilities {
  final bool snippetSupport;

  CompletionItemCapabilities._(this.snippetSupport);
  factory CompletionItemCapabilities(
      void init(CompletionItemCapabilities$Builder b)) {
    var b = new CompletionItemCapabilities$Builder._();
    init(b);
    return new CompletionItemCapabilities._(b.snippetSupport);
  }

  factory CompletionItemCapabilities.fromJson(Map params) =>
      new CompletionItemCapabilities._(params.containsKey("snippetSupport")
          ? params["snippetSupport"]
          : null);

  Map toJson() => {"snippetSupport": snippetSupport};

  @override
  bool operator ==(Object other) {
    if (other is! CompletionItemCapabilities) return false;
    var o = other as CompletionItemCapabilities;
    if (snippetSupport != o.snippetSupport) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [snippetSupport]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class CompletionItemCapabilities$Builder {
  bool snippetSupport;

  CompletionItemCapabilities$Builder._();
}

class TextEdit {
  final String newText;
  final Range range;

  TextEdit._(this.newText, this.range);
  factory TextEdit(void init(TextEdit$Builder b)) {
    var b = new TextEdit$Builder._();
    init(b);
    return new TextEdit._(b.newText, b.range);
  }

  factory TextEdit.fromJson(Map params) => new TextEdit._(
      params.containsKey("newText") ? params["newText"] : null,
      params.containsKey("range") ? new Range.fromJson(params["range"]) : null);

  Map toJson() => {"newText": newText, "range": range?.toJson()};

  @override
  bool operator ==(Object other) {
    if (other is! TextEdit) return false;
    var o = other as TextEdit;
    if (newText != o.newText) return false;
    if (range != o.range) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [newText, range]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class TextEdit$Builder {
  String newText;
  Range range;

  TextEdit$Builder._();
}

class CompletionList {
  final List<CompletionItem> items;
  final bool isIncomplete;

  CompletionList._(this.items, this.isIncomplete);
  factory CompletionList(void init(CompletionList$Builder b)) {
    var b = new CompletionList$Builder._();
    init(b);
    return new CompletionList._(b.items, b.isIncomplete);
  }

  factory CompletionList.fromJson(Map params) => new CompletionList._(
      params.containsKey("items")
          ? params["items"].map((v) => new CompletionItem.fromJson(v)).toList()
          : null,
      params.containsKey("isIncomplete") ? params["isIncomplete"] : null);

  Map toJson() => {
        "items": items?.map((v) => v?.toJson())?.toList(),
        "isIncomplete": isIncomplete
      };

  @override
  bool operator ==(Object other) {
    if (other is! CompletionList) return false;
    var o = other as CompletionList;
    if (!_deepEquals(items, o.items)) return false;
    if (isIncomplete != o.isIncomplete) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [items, isIncomplete]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class CompletionList$Builder {
  List<CompletionItem> items;
  bool isIncomplete;

  CompletionList$Builder._();
}

class SaveOptions {
  final bool includeText;

  SaveOptions._(this.includeText);
  factory SaveOptions(void init(SaveOptions$Builder b)) {
    var b = new SaveOptions$Builder._();
    init(b);
    return new SaveOptions._(b.includeText);
  }

  factory SaveOptions.fromJson(Map params) => new SaveOptions._(
      params.containsKey("includeText") ? params["includeText"] : null);

  Map toJson() => {"includeText": includeText};

  @override
  bool operator ==(Object other) {
    if (other is! SaveOptions) return false;
    var o = other as SaveOptions;
    if (includeText != o.includeText) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [includeText]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class SaveOptions$Builder {
  bool includeText;

  SaveOptions$Builder._();
}

class DocumentLinkOptions {
  final bool resolveProvider;

  DocumentLinkOptions._(this.resolveProvider);
  factory DocumentLinkOptions(void init(DocumentLinkOptions$Builder b)) {
    var b = new DocumentLinkOptions$Builder._();
    init(b);
    return new DocumentLinkOptions._(b.resolveProvider);
  }

  factory DocumentLinkOptions.fromJson(Map params) => new DocumentLinkOptions._(
      params.containsKey("resolveProvider") ? params["resolveProvider"] : null);

  Map toJson() => {"resolveProvider": resolveProvider};

  @override
  bool operator ==(Object other) {
    if (other is! DocumentLinkOptions) return false;
    var o = other as DocumentLinkOptions;
    if (resolveProvider != o.resolveProvider) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [resolveProvider]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class DocumentLinkOptions$Builder {
  bool resolveProvider;

  DocumentLinkOptions$Builder._();
}

class TextDocumentItem {
  final int version;
  final String text;
  final String languageId;
  final String uri;

  TextDocumentItem._(this.version, this.text, this.languageId, this.uri);
  factory TextDocumentItem(void init(TextDocumentItem$Builder b)) {
    var b = new TextDocumentItem$Builder._();
    init(b);
    return new TextDocumentItem._(b.version, b.text, b.languageId, b.uri);
  }

  factory TextDocumentItem.fromJson(Map params) => new TextDocumentItem._(
      params.containsKey("version") ? params["version"] : null,
      params.containsKey("text") ? params["text"] : null,
      params.containsKey("languageId") ? params["languageId"] : null,
      params.containsKey("uri") ? params["uri"] : null);

  Map toJson() =>
      {"version": version, "text": text, "languageId": languageId, "uri": uri};

  @override
  bool operator ==(Object other) {
    if (other is! TextDocumentItem) return false;
    var o = other as TextDocumentItem;
    if (version != o.version) return false;
    if (text != o.text) return false;
    if (languageId != o.languageId) return false;
    if (uri != o.uri) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [version, text, languageId, uri]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class TextDocumentItem$Builder {
  int version;
  String text;
  String languageId;
  String uri;

  TextDocumentItem$Builder._();
}

class Location {
  final Range range;
  final String uri;

  Location._(this.range, this.uri);
  factory Location(void init(Location$Builder b)) {
    var b = new Location$Builder._();
    init(b);
    return new Location._(b.range, b.uri);
  }

  factory Location.fromJson(Map params) => new Location._(
      params.containsKey("range") ? new Range.fromJson(params["range"]) : null,
      params.containsKey("uri") ? params["uri"] : null);

  Map toJson() => {"range": range?.toJson(), "uri": uri};

  @override
  bool operator ==(Object other) {
    if (other is! Location) return false;
    var o = other as Location;
    if (range != o.range) return false;
    if (uri != o.uri) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [range, uri]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class Location$Builder {
  Range range;
  String uri;

  Location$Builder._();
}

class DynamicRegistrationCapability {
  final bool dynamicRegistration;

  DynamicRegistrationCapability._(this.dynamicRegistration);
  factory DynamicRegistrationCapability(
      void init(DynamicRegistrationCapability$Builder b)) {
    var b = new DynamicRegistrationCapability$Builder._();
    init(b);
    return new DynamicRegistrationCapability._(b.dynamicRegistration);
  }

  factory DynamicRegistrationCapability.fromJson(Map params) =>
      new DynamicRegistrationCapability._(
          params.containsKey("dynamicRegistration")
              ? params["dynamicRegistration"]
              : null);

  Map toJson() => {"dynamicRegistration": dynamicRegistration};

  @override
  bool operator ==(Object other) {
    if (other is! DynamicRegistrationCapability) return false;
    var o = other as DynamicRegistrationCapability;
    if (dynamicRegistration != o.dynamicRegistration) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [dynamicRegistration]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class DynamicRegistrationCapability$Builder {
  bool dynamicRegistration;

  DynamicRegistrationCapability$Builder._();
}

class TextDocumentContentChangeEvent {
  final int rangeLength;
  final String text;
  final Range range;

  TextDocumentContentChangeEvent._(this.rangeLength, this.text, this.range);
  factory TextDocumentContentChangeEvent(
      void init(TextDocumentContentChangeEvent$Builder b)) {
    var b = new TextDocumentContentChangeEvent$Builder._();
    init(b);
    return new TextDocumentContentChangeEvent._(b.rangeLength, b.text, b.range);
  }

  factory TextDocumentContentChangeEvent.fromJson(Map params) =>
      new TextDocumentContentChangeEvent._(
          params.containsKey("rangeLength") ? params["rangeLength"] : null,
          params.containsKey("text") ? params["text"] : null,
          params.containsKey("range")
              ? new Range.fromJson(params["range"])
              : null);

  Map toJson() =>
      {"rangeLength": rangeLength, "text": text, "range": range?.toJson()};

  @override
  bool operator ==(Object other) {
    if (other is! TextDocumentContentChangeEvent) return false;
    var o = other as TextDocumentContentChangeEvent;
    if (rangeLength != o.rangeLength) return false;
    if (text != o.text) return false;
    if (range != o.range) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [rangeLength, text, range]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class TextDocumentContentChangeEvent$Builder {
  int rangeLength;
  String text;
  Range range;

  TextDocumentContentChangeEvent$Builder._();
}

class DocumentOnTypeFormattingOptions {
  final List<String> moreTriggerCharacter;
  final String firstTriggerCharacter;

  DocumentOnTypeFormattingOptions._(
      this.moreTriggerCharacter, this.firstTriggerCharacter);
  factory DocumentOnTypeFormattingOptions(
      void init(DocumentOnTypeFormattingOptions$Builder b)) {
    var b = new DocumentOnTypeFormattingOptions$Builder._();
    init(b);
    return new DocumentOnTypeFormattingOptions._(
        b.moreTriggerCharacter, b.firstTriggerCharacter);
  }

  factory DocumentOnTypeFormattingOptions.fromJson(Map params) =>
      new DocumentOnTypeFormattingOptions._(
          params.containsKey("moreTriggerCharacter")
              ? params["moreTriggerCharacter"]
              : null,
          params.containsKey("firstTriggerCharacter")
              ? params["firstTriggerCharacter"]
              : null);

  Map toJson() => {
        "moreTriggerCharacter": moreTriggerCharacter,
        "firstTriggerCharacter": firstTriggerCharacter
      };

  @override
  bool operator ==(Object other) {
    if (other is! DocumentOnTypeFormattingOptions) return false;
    var o = other as DocumentOnTypeFormattingOptions;
    if (!_deepEquals(moreTriggerCharacter, o.moreTriggerCharacter))
      return false;
    if (firstTriggerCharacter != o.firstTriggerCharacter) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [moreTriggerCharacter, firstTriggerCharacter]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class DocumentOnTypeFormattingOptions$Builder {
  List<String> moreTriggerCharacter;
  String firstTriggerCharacter;

  DocumentOnTypeFormattingOptions$Builder._();
}

class InsertTextFormat {
  static const plainText = const InsertTextFormat._(1);
  static const snippet = const InsertTextFormat._(2);
  final int _value;
  const InsertTextFormat._(this._value);
  factory InsertTextFormat.fromJson(int value) {
    const values = const {
      1: InsertTextFormat.plainText,
      2: InsertTextFormat.snippet
    };
    return values[value];
  }
  int toJson() => _value;
}

class Diagnostics {
  final List<Diagnostic> diagnostics;
  final String uri;

  Diagnostics._(this.diagnostics, this.uri);
  factory Diagnostics(void init(Diagnostics$Builder b)) {
    var b = new Diagnostics$Builder._();
    init(b);
    return new Diagnostics._(b.diagnostics, b.uri);
  }

  factory Diagnostics.fromJson(Map params) => new Diagnostics._(
      params.containsKey("diagnostics")
          ? params["diagnostics"]
              .map((v) => new Diagnostic.fromJson(v))
              .toList()
          : null,
      params.containsKey("uri") ? params["uri"] : null);

  Map toJson() => {
        "diagnostics": diagnostics?.map((v) => v?.toJson())?.toList(),
        "uri": uri
      };

  @override
  bool operator ==(Object other) {
    if (other is! Diagnostics) return false;
    var o = other as Diagnostics;
    if (!_deepEquals(diagnostics, o.diagnostics)) return false;
    if (uri != o.uri) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [diagnostics, uri]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class Diagnostics$Builder {
  List<Diagnostic> diagnostics;
  String uri;

  Diagnostics$Builder._();
}

class ClientCapabilities {
  final WorkspaceClientCapabilities workspace;
  final TextDocumentClientCapabilities textDocument;

  ClientCapabilities._(this.workspace, this.textDocument);
  factory ClientCapabilities(void init(ClientCapabilities$Builder b)) {
    var b = new ClientCapabilities$Builder._();
    init(b);
    return new ClientCapabilities._(b.workspace, b.textDocument);
  }

  factory ClientCapabilities.fromJson(Map params) => new ClientCapabilities._(
      params.containsKey("workspace")
          ? new WorkspaceClientCapabilities.fromJson(params["workspace"])
          : null,
      params.containsKey("textDocument")
          ? new TextDocumentClientCapabilities.fromJson(params["textDocument"])
          : null);

  Map toJson() => {
        "workspace": workspace?.toJson(),
        "textDocument": textDocument?.toJson()
      };

  @override
  bool operator ==(Object other) {
    if (other is! ClientCapabilities) return false;
    var o = other as ClientCapabilities;
    if (workspace != o.workspace) return false;
    if (textDocument != o.textDocument) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [workspace, textDocument]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class ClientCapabilities$Builder {
  WorkspaceClientCapabilities workspace;
  TextDocumentClientCapabilities textDocument;

  ClientCapabilities$Builder._();
}

class CompletionCapabilities {
  final bool dynamicRegistration;
  final CompletionItemCapabilities completionItem;

  CompletionCapabilities._(this.dynamicRegistration, this.completionItem);
  factory CompletionCapabilities(void init(CompletionCapabilities$Builder b)) {
    var b = new CompletionCapabilities$Builder._();
    init(b);
    return new CompletionCapabilities._(
        b.dynamicRegistration, b.completionItem);
  }

  factory CompletionCapabilities.fromJson(Map params) =>
      new CompletionCapabilities._(
          params.containsKey("dynamicRegistration")
              ? params["dynamicRegistration"]
              : null,
          params.containsKey("completionItem")
              ? new CompletionItemCapabilities.fromJson(
                  params["completionItem"])
              : null);

  Map toJson() => {
        "dynamicRegistration": dynamicRegistration,
        "completionItem": completionItem?.toJson()
      };

  @override
  bool operator ==(Object other) {
    if (other is! CompletionCapabilities) return false;
    var o = other as CompletionCapabilities;
    if (dynamicRegistration != o.dynamicRegistration) return false;
    if (completionItem != o.completionItem) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [dynamicRegistration, completionItem]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class CompletionCapabilities$Builder {
  bool dynamicRegistration;
  CompletionItemCapabilities completionItem;

  CompletionCapabilities$Builder._();
}

_deepEquals(dynamic left, dynamic right) {
  if (left is List && right is List) {
    var leftLength = left.length;
    var rightLength = right.length;
    if (leftLength != rightLength) return false;
    for (int i = 0; i < leftLength; i++) {
      if (!_deepEquals(left[i], right[i])) return false;
    }
    return true;
  }
  return left == right;
}
