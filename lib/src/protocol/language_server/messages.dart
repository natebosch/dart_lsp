class ApplyWorkspaceEditParams {
  ApplyWorkspaceEditParams._(this.edit, this.label);

  factory ApplyWorkspaceEditParams(
      void init(ApplyWorkspaceEditParams$Builder)) {
    final b = new ApplyWorkspaceEditParams$Builder._();
    init(b);
    return new ApplyWorkspaceEditParams._(b.edit, b.label);
  }

  factory ApplyWorkspaceEditParams.fromJson(Map params) =>
      new ApplyWorkspaceEditParams._(
          params.containsKey('edit')
              ? new WorkspaceEdit.fromJson(params['edit'])
              : null,
          params.containsKey('label') ? params['label'] : null);

  final WorkspaceEdit edit;

  final String label;

  Map toJson() => {'edit': edit?.toJson(), 'label': label};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(edit));
    hash = _hashCombine(hash, _deepHashCode(label));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! ApplyWorkspaceEditParams) return false;
    var o = other as ApplyWorkspaceEditParams;
    if (edit != o.edit) return false;
    if (label != o.label) return false;
    return true;
  }
}

class ApplyWorkspaceEditParams$Builder {
  ApplyWorkspaceEditParams$Builder._();

  WorkspaceEdit edit;

  String label;
}

class ClientCapabilities {
  ClientCapabilities._(this.textDocument, this.workspace);

  factory ClientCapabilities(void init(ClientCapabilities$Builder)) {
    final b = new ClientCapabilities$Builder._();
    init(b);
    return new ClientCapabilities._(b.textDocument, b.workspace);
  }

  factory ClientCapabilities.fromJson(Map params) => new ClientCapabilities._(
      params.containsKey('textDocument')
          ? new TextDocumentClientCapabilities.fromJson(params['textDocument'])
          : null,
      params.containsKey('workspace')
          ? new WorkspaceClientCapabilities.fromJson(params['workspace'])
          : null);

  final TextDocumentClientCapabilities textDocument;

  final WorkspaceClientCapabilities workspace;

  Map toJson() => {
        'textDocument': textDocument?.toJson(),
        'workspace': workspace?.toJson()
      };
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(textDocument));
    hash = _hashCombine(hash, _deepHashCode(workspace));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! ClientCapabilities) return false;
    var o = other as ClientCapabilities;
    if (textDocument != o.textDocument) return false;
    if (workspace != o.workspace) return false;
    return true;
  }
}

class ClientCapabilities$Builder {
  ClientCapabilities$Builder._();

  TextDocumentClientCapabilities textDocument;

  WorkspaceClientCapabilities workspace;
}

class CodeActionContext {
  CodeActionContext._(this.diagnostics);

  factory CodeActionContext(void init(CodeActionContext$Builder)) {
    final b = new CodeActionContext$Builder._();
    init(b);
    return new CodeActionContext._(b.diagnostics);
  }

  factory CodeActionContext.fromJson(Map params) =>
      new CodeActionContext._(params.containsKey('diagnostics')
          ? params['diagnostics']
              .map((v) => new Diagnostic.fromJson(v))
              .toList()
          : null);

  final List<Diagnostic> diagnostics;

  Map toJson() =>
      {'diagnostics': diagnostics?.map((v) => v?.toJson())?.toList()};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(diagnostics));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! CodeActionContext) return false;
    var o = other as CodeActionContext;
    if (!_deepEquals(diagnostics, o.diagnostics)) return false;
    return true;
  }
}

class CodeActionContext$Builder {
  CodeActionContext$Builder._();

  List<Diagnostic> diagnostics;
}

class CodeLensOptions {
  CodeLensOptions._(this.resolveProvider);

  factory CodeLensOptions(void init(CodeLensOptions$Builder)) {
    final b = new CodeLensOptions$Builder._();
    init(b);
    return new CodeLensOptions._(b.resolveProvider);
  }

  factory CodeLensOptions.fromJson(Map params) => new CodeLensOptions._(
      params.containsKey('resolveProvider') ? params['resolveProvider'] : null);

  final bool resolveProvider;

  Map toJson() => {'resolveProvider': resolveProvider};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(resolveProvider));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! CodeLensOptions) return false;
    var o = other as CodeLensOptions;
    if (resolveProvider != o.resolveProvider) return false;
    return true;
  }
}

class CodeLensOptions$Builder {
  CodeLensOptions$Builder._();

  bool resolveProvider;
}

class Command {
  Command._(this.arguments, this.command, this.title);

  factory Command(void init(Command$Builder)) {
    final b = new Command$Builder._();
    init(b);
    return new Command._(b.arguments, b.command, b.title);
  }

  factory Command.fromJson(Map params) => new Command._(
      params.containsKey('arguments') ? params['arguments'] : null,
      params.containsKey('command') ? params['command'] : null,
      params.containsKey('title') ? params['title'] : null);

  final List<dynamic> arguments;

  final String command;

  final String title;

  Map toJson() => {'arguments': arguments, 'command': command, 'title': title};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(arguments));
    hash = _hashCombine(hash, _deepHashCode(command));
    hash = _hashCombine(hash, _deepHashCode(title));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! Command) return false;
    var o = other as Command;
    if (!_deepEquals(arguments, o.arguments)) return false;
    if (command != o.command) return false;
    if (title != o.title) return false;
    return true;
  }
}

class Command$Builder {
  Command$Builder._();

  List<dynamic> arguments;

  String command;

  String title;
}

class CompletionCapabilities {
  CompletionCapabilities._(this.completionItem, this.dynamicRegistration);

  factory CompletionCapabilities(void init(CompletionCapabilities$Builder)) {
    final b = new CompletionCapabilities$Builder._();
    init(b);
    return new CompletionCapabilities._(
        b.completionItem, b.dynamicRegistration);
  }

  factory CompletionCapabilities.fromJson(Map params) =>
      new CompletionCapabilities._(
          params.containsKey('completionItem')
              ? new CompletionItemCapabilities.fromJson(
                  params['completionItem'])
              : null,
          params.containsKey('dynamicRegistration')
              ? params['dynamicRegistration']
              : null);

  final CompletionItemCapabilities completionItem;

  final bool dynamicRegistration;

  Map toJson() => {
        'completionItem': completionItem?.toJson(),
        'dynamicRegistration': dynamicRegistration
      };
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(completionItem));
    hash = _hashCombine(hash, _deepHashCode(dynamicRegistration));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! CompletionCapabilities) return false;
    var o = other as CompletionCapabilities;
    if (completionItem != o.completionItem) return false;
    if (dynamicRegistration != o.dynamicRegistration) return false;
    return true;
  }
}

class CompletionCapabilities$Builder {
  CompletionCapabilities$Builder._();

  CompletionItemCapabilities completionItem;

  bool dynamicRegistration;
}

class CompletionItem {
  CompletionItem._(
      this.additionalTextEdits,
      this.command,
      this.data,
      this.detail,
      this.documentation,
      this.filterText,
      this.insertText,
      this.insertTextFormat,
      this.kind,
      this.label,
      this.sortText,
      this.textEdit);

  factory CompletionItem(void init(CompletionItem$Builder)) {
    final b = new CompletionItem$Builder._();
    init(b);
    return new CompletionItem._(
        b.additionalTextEdits,
        b.command,
        b.data,
        b.detail,
        b.documentation,
        b.filterText,
        b.insertText,
        b.insertTextFormat,
        b.kind,
        b.label,
        b.sortText,
        b.textEdit);
  }

  factory CompletionItem.fromJson(Map params) => new CompletionItem._(
      params.containsKey('additionalTextEdits')
          ? params['additionalTextEdits']
              .map((v) => new TextEdit.fromJson(v))
              .toList()
          : null,
      params.containsKey('command')
          ? new Command.fromJson(params['command'])
          : null,
      params.containsKey('data') ? params['data'] : null,
      params.containsKey('detail') ? params['detail'] : null,
      params.containsKey('documentation') ? params['documentation'] : null,
      params.containsKey('filterText') ? params['filterText'] : null,
      params.containsKey('insertText') ? params['insertText'] : null,
      params.containsKey('insertTextFormat')
          ? new InsertTextFormat.fromJson(params['insertTextFormat'])
          : null,
      params.containsKey('kind')
          ? new CompletionItemKind.fromJson(params['kind'])
          : null,
      params.containsKey('label') ? params['label'] : null,
      params.containsKey('sortText') ? params['sortText'] : null,
      params.containsKey('textEdit')
          ? new TextEdit.fromJson(params['textEdit'])
          : null);

  final List<TextEdit> additionalTextEdits;

  final Command command;

  final dynamic data;

  final String detail;

  final String documentation;

  final String filterText;

  final String insertText;

  final InsertTextFormat insertTextFormat;

  final CompletionItemKind kind;

  final String label;

  final String sortText;

  final TextEdit textEdit;

  Map toJson() => {
        'additionalTextEdits':
            additionalTextEdits?.map((v) => v?.toJson())?.toList(),
        'command': command?.toJson(),
        'data': data,
        'detail': detail,
        'documentation': documentation,
        'filterText': filterText,
        'insertText': insertText,
        'insertTextFormat': insertTextFormat?.toJson(),
        'kind': kind?.toJson(),
        'label': label,
        'sortText': sortText,
        'textEdit': textEdit?.toJson()
      };
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(additionalTextEdits));
    hash = _hashCombine(hash, _deepHashCode(command));
    hash = _hashCombine(hash, _deepHashCode(data));
    hash = _hashCombine(hash, _deepHashCode(detail));
    hash = _hashCombine(hash, _deepHashCode(documentation));
    hash = _hashCombine(hash, _deepHashCode(filterText));
    hash = _hashCombine(hash, _deepHashCode(insertText));
    hash = _hashCombine(hash, _deepHashCode(insertTextFormat));
    hash = _hashCombine(hash, _deepHashCode(kind));
    hash = _hashCombine(hash, _deepHashCode(label));
    hash = _hashCombine(hash, _deepHashCode(sortText));
    hash = _hashCombine(hash, _deepHashCode(textEdit));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! CompletionItem) return false;
    var o = other as CompletionItem;
    if (!_deepEquals(additionalTextEdits, o.additionalTextEdits)) return false;
    if (command != o.command) return false;
    if (data != o.data) return false;
    if (detail != o.detail) return false;
    if (documentation != o.documentation) return false;
    if (filterText != o.filterText) return false;
    if (insertText != o.insertText) return false;
    if (insertTextFormat != o.insertTextFormat) return false;
    if (kind != o.kind) return false;
    if (label != o.label) return false;
    if (sortText != o.sortText) return false;
    if (textEdit != o.textEdit) return false;
    return true;
  }
}

class CompletionItem$Builder {
  CompletionItem$Builder._();

  List<TextEdit> additionalTextEdits;

  Command command;

  dynamic data;

  String detail;

  String documentation;

  String filterText;

  String insertText;

  InsertTextFormat insertTextFormat;

  CompletionItemKind kind;

  String label;

  String sortText;

  TextEdit textEdit;
}

class CompletionItemCapabilities {
  CompletionItemCapabilities._(this.snippetSupport);

  factory CompletionItemCapabilities(
      void init(CompletionItemCapabilities$Builder)) {
    final b = new CompletionItemCapabilities$Builder._();
    init(b);
    return new CompletionItemCapabilities._(b.snippetSupport);
  }

  factory CompletionItemCapabilities.fromJson(Map params) =>
      new CompletionItemCapabilities._(params.containsKey('snippetSupport')
          ? params['snippetSupport']
          : null);

  final bool snippetSupport;

  Map toJson() => {'snippetSupport': snippetSupport};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(snippetSupport));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! CompletionItemCapabilities) return false;
    var o = other as CompletionItemCapabilities;
    if (snippetSupport != o.snippetSupport) return false;
    return true;
  }
}

class CompletionItemCapabilities$Builder {
  CompletionItemCapabilities$Builder._();

  bool snippetSupport;
}

class CompletionItemKind {
  factory CompletionItemKind.fromJson(int value) {
    const values = const {
      7: CompletionItemKind.classKind,
      16: CompletionItemKind.color,
      4: CompletionItemKind.constructor,
      13: CompletionItemKind.enumKind,
      5: CompletionItemKind.field,
      17: CompletionItemKind.file,
      3: CompletionItemKind.function,
      8: CompletionItemKind.interface,
      14: CompletionItemKind.keyword,
      2: CompletionItemKind.method,
      9: CompletionItemKind.module,
      10: CompletionItemKind.property,
      18: CompletionItemKind.reference,
      15: CompletionItemKind.snippet,
      1: CompletionItemKind.text,
      11: CompletionItemKind.unit,
      12: CompletionItemKind.value,
      6: CompletionItemKind.variable
    };
    return values[value];
  }

  const CompletionItemKind._(this._value);

  static const classKind = const CompletionItemKind._(7);

  static const color = const CompletionItemKind._(16);

  static const constructor = const CompletionItemKind._(4);

  static const enumKind = const CompletionItemKind._(13);

  static const field = const CompletionItemKind._(5);

  static const file = const CompletionItemKind._(17);

  static const function = const CompletionItemKind._(3);

  static const interface = const CompletionItemKind._(8);

  static const keyword = const CompletionItemKind._(14);

  static const method = const CompletionItemKind._(2);

  static const module = const CompletionItemKind._(9);

  static const property = const CompletionItemKind._(10);

  static const reference = const CompletionItemKind._(18);

  static const snippet = const CompletionItemKind._(15);

  static const text = const CompletionItemKind._(1);

  static const unit = const CompletionItemKind._(11);

  static const value = const CompletionItemKind._(12);

  static const variable = const CompletionItemKind._(6);

  final int _value;

  int toJson() => _value;
}

class CompletionList {
  CompletionList._(this.isIncomplete, this.items);

  factory CompletionList(void init(CompletionList$Builder)) {
    final b = new CompletionList$Builder._();
    init(b);
    return new CompletionList._(b.isIncomplete, b.items);
  }

  factory CompletionList.fromJson(Map params) => new CompletionList._(
      params.containsKey('isIncomplete') ? params['isIncomplete'] : null,
      params.containsKey('items')
          ? params['items'].map((v) => new CompletionItem.fromJson(v)).toList()
          : null);

  final bool isIncomplete;

  final List<CompletionItem> items;

  Map toJson() => {
        'isIncomplete': isIncomplete,
        'items': items?.map((v) => v?.toJson())?.toList()
      };
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(isIncomplete));
    hash = _hashCombine(hash, _deepHashCode(items));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! CompletionList) return false;
    var o = other as CompletionList;
    if (isIncomplete != o.isIncomplete) return false;
    if (!_deepEquals(items, o.items)) return false;
    return true;
  }
}

class CompletionList$Builder {
  CompletionList$Builder._();

  bool isIncomplete;

  List<CompletionItem> items;
}

class CompletionOptions {
  CompletionOptions._(this.resolveProvider, this.triggerCharacters);

  factory CompletionOptions(void init(CompletionOptions$Builder)) {
    final b = new CompletionOptions$Builder._();
    init(b);
    return new CompletionOptions._(b.resolveProvider, b.triggerCharacters);
  }

  factory CompletionOptions.fromJson(Map params) => new CompletionOptions._(
      params.containsKey('resolveProvider') ? params['resolveProvider'] : null,
      params.containsKey('triggerCharacters')
          ? params['triggerCharacters']
          : null);

  final bool resolveProvider;

  final List<String> triggerCharacters;

  Map toJson() => {
        'resolveProvider': resolveProvider,
        'triggerCharacters': triggerCharacters
      };
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(resolveProvider));
    hash = _hashCombine(hash, _deepHashCode(triggerCharacters));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! CompletionOptions) return false;
    var o = other as CompletionOptions;
    if (resolveProvider != o.resolveProvider) return false;
    if (!_deepEquals(triggerCharacters, o.triggerCharacters)) return false;
    return true;
  }
}

class CompletionOptions$Builder {
  CompletionOptions$Builder._();

  bool resolveProvider;

  List<String> triggerCharacters;
}

class Diagnostic {
  Diagnostic._(this.code, this.message, this.range, this.severity, this.source);

  factory Diagnostic(void init(Diagnostic$Builder)) {
    final b = new Diagnostic$Builder._();
    init(b);
    return new Diagnostic._(b.code, b.message, b.range, b.severity, b.source);
  }

  factory Diagnostic.fromJson(Map params) => new Diagnostic._(
      params.containsKey('code') ? params['code'] : null,
      params.containsKey('message') ? params['message'] : null,
      params.containsKey('range') ? new Range.fromJson(params['range']) : null,
      params.containsKey('severity') ? params['severity'] : null,
      params.containsKey('source') ? params['source'] : null);

  final dynamic code;

  final String message;

  final Range range;

  final int severity;

  final String source;

  Map toJson() => {
        'code': code,
        'message': message,
        'range': range?.toJson(),
        'severity': severity,
        'source': source
      };
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(code));
    hash = _hashCombine(hash, _deepHashCode(message));
    hash = _hashCombine(hash, _deepHashCode(range));
    hash = _hashCombine(hash, _deepHashCode(severity));
    hash = _hashCombine(hash, _deepHashCode(source));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! Diagnostic) return false;
    var o = other as Diagnostic;
    if (code != o.code) return false;
    if (message != o.message) return false;
    if (range != o.range) return false;
    if (severity != o.severity) return false;
    if (source != o.source) return false;
    return true;
  }
}

class Diagnostic$Builder {
  Diagnostic$Builder._();

  dynamic code;

  String message;

  Range range;

  int severity;

  String source;
}

class Diagnostics {
  Diagnostics._(this.diagnostics, this.uri);

  factory Diagnostics(void init(Diagnostics$Builder)) {
    final b = new Diagnostics$Builder._();
    init(b);
    return new Diagnostics._(b.diagnostics, b.uri);
  }

  factory Diagnostics.fromJson(Map params) => new Diagnostics._(
      params.containsKey('diagnostics')
          ? params['diagnostics']
              .map((v) => new Diagnostic.fromJson(v))
              .toList()
          : null,
      params.containsKey('uri') ? params['uri'] : null);

  final List<Diagnostic> diagnostics;

  final String uri;

  Map toJson() => {
        'diagnostics': diagnostics?.map((v) => v?.toJson())?.toList(),
        'uri': uri
      };
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(diagnostics));
    hash = _hashCombine(hash, _deepHashCode(uri));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! Diagnostics) return false;
    var o = other as Diagnostics;
    if (!_deepEquals(diagnostics, o.diagnostics)) return false;
    if (uri != o.uri) return false;
    return true;
  }
}

class Diagnostics$Builder {
  Diagnostics$Builder._();

  List<Diagnostic> diagnostics;

  String uri;
}

class DocumentLinkOptions {
  DocumentLinkOptions._(this.resolveProvider);

  factory DocumentLinkOptions(void init(DocumentLinkOptions$Builder)) {
    final b = new DocumentLinkOptions$Builder._();
    init(b);
    return new DocumentLinkOptions._(b.resolveProvider);
  }

  factory DocumentLinkOptions.fromJson(Map params) => new DocumentLinkOptions._(
      params.containsKey('resolveProvider') ? params['resolveProvider'] : null);

  final bool resolveProvider;

  Map toJson() => {'resolveProvider': resolveProvider};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(resolveProvider));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! DocumentLinkOptions) return false;
    var o = other as DocumentLinkOptions;
    if (resolveProvider != o.resolveProvider) return false;
    return true;
  }
}

class DocumentLinkOptions$Builder {
  DocumentLinkOptions$Builder._();

  bool resolveProvider;
}

class DocumentOnTypeFormattingOptions {
  DocumentOnTypeFormattingOptions._(
      this.firstTriggerCharacter, this.moreTriggerCharacter);

  factory DocumentOnTypeFormattingOptions(
      void init(DocumentOnTypeFormattingOptions$Builder)) {
    final b = new DocumentOnTypeFormattingOptions$Builder._();
    init(b);
    return new DocumentOnTypeFormattingOptions._(
        b.firstTriggerCharacter, b.moreTriggerCharacter);
  }

  factory DocumentOnTypeFormattingOptions.fromJson(Map params) =>
      new DocumentOnTypeFormattingOptions._(
          params.containsKey('firstTriggerCharacter')
              ? params['firstTriggerCharacter']
              : null,
          params.containsKey('moreTriggerCharacter')
              ? params['moreTriggerCharacter']
              : null);

  final String firstTriggerCharacter;

  final List<String> moreTriggerCharacter;

  Map toJson() => {
        'firstTriggerCharacter': firstTriggerCharacter,
        'moreTriggerCharacter': moreTriggerCharacter
      };
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(firstTriggerCharacter));
    hash = _hashCombine(hash, _deepHashCode(moreTriggerCharacter));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! DocumentOnTypeFormattingOptions) return false;
    var o = other as DocumentOnTypeFormattingOptions;
    if (firstTriggerCharacter != o.firstTriggerCharacter) return false;
    if (!_deepEquals(moreTriggerCharacter, o.moreTriggerCharacter))
      return false;
    return true;
  }
}

class DocumentOnTypeFormattingOptions$Builder {
  DocumentOnTypeFormattingOptions$Builder._();

  String firstTriggerCharacter;

  List<String> moreTriggerCharacter;
}

class DynamicRegistrationCapability {
  DynamicRegistrationCapability._(this.dynamicRegistration);

  factory DynamicRegistrationCapability(
      void init(DynamicRegistrationCapability$Builder)) {
    final b = new DynamicRegistrationCapability$Builder._();
    init(b);
    return new DynamicRegistrationCapability._(b.dynamicRegistration);
  }

  factory DynamicRegistrationCapability.fromJson(Map params) =>
      new DynamicRegistrationCapability._(
          params.containsKey('dynamicRegistration')
              ? params['dynamicRegistration']
              : null);

  final bool dynamicRegistration;

  Map toJson() => {'dynamicRegistration': dynamicRegistration};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(dynamicRegistration));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! DynamicRegistrationCapability) return false;
    var o = other as DynamicRegistrationCapability;
    if (dynamicRegistration != o.dynamicRegistration) return false;
    return true;
  }
}

class DynamicRegistrationCapability$Builder {
  DynamicRegistrationCapability$Builder._();

  bool dynamicRegistration;
}

class ExecuteCommandOptions {
  ExecuteCommandOptions._(this.commands);

  factory ExecuteCommandOptions(void init(ExecuteCommandOptions$Builder)) {
    final b = new ExecuteCommandOptions$Builder._();
    init(b);
    return new ExecuteCommandOptions._(b.commands);
  }

  factory ExecuteCommandOptions.fromJson(Map params) =>
      new ExecuteCommandOptions._(
          params.containsKey('commands') ? params['commands'] : null);

  final List<String> commands;

  Map toJson() => {'commands': commands};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(commands));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! ExecuteCommandOptions) return false;
    var o = other as ExecuteCommandOptions;
    if (!_deepEquals(commands, o.commands)) return false;
    return true;
  }
}

class ExecuteCommandOptions$Builder {
  ExecuteCommandOptions$Builder._();

  List<String> commands;
}

class Hover {
  Hover._(this.contents, this.range);

  factory Hover(void init(Hover$Builder)) {
    final b = new Hover$Builder._();
    init(b);
    return new Hover._(b.contents, b.range);
  }

  factory Hover.fromJson(Map params) => new Hover._(
      params.containsKey('contents') ? params['contents'] : null,
      params.containsKey('range') ? new Range.fromJson(params['range']) : null);

  final String contents;

  final Range range;

  Map toJson() => {'contents': contents, 'range': range?.toJson()};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(contents));
    hash = _hashCombine(hash, _deepHashCode(range));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! Hover) return false;
    var o = other as Hover;
    if (contents != o.contents) return false;
    if (range != o.range) return false;
    return true;
  }
}

class Hover$Builder {
  Hover$Builder._();

  String contents;

  Range range;
}

class InsertTextFormat {
  factory InsertTextFormat.fromJson(int value) {
    const values = const {
      1: InsertTextFormat.plainText,
      2: InsertTextFormat.snippet
    };
    return values[value];
  }

  const InsertTextFormat._(this._value);

  static const plainText = const InsertTextFormat._(1);

  static const snippet = const InsertTextFormat._(2);

  final int _value;

  int toJson() => _value;
}

class Location {
  Location._(this.range, this.uri);

  factory Location(void init(Location$Builder)) {
    final b = new Location$Builder._();
    init(b);
    return new Location._(b.range, b.uri);
  }

  factory Location.fromJson(Map params) => new Location._(
      params.containsKey('range') ? new Range.fromJson(params['range']) : null,
      params.containsKey('uri') ? params['uri'] : null);

  final Range range;

  final String uri;

  Map toJson() => {'range': range?.toJson(), 'uri': uri};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(range));
    hash = _hashCombine(hash, _deepHashCode(uri));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! Location) return false;
    var o = other as Location;
    if (range != o.range) return false;
    if (uri != o.uri) return false;
    return true;
  }
}

class Location$Builder {
  Location$Builder._();

  Range range;

  String uri;
}

class Position {
  Position._(this.character, this.line);

  factory Position(void init(Position$Builder)) {
    final b = new Position$Builder._();
    init(b);
    return new Position._(b.character, b.line);
  }

  factory Position.fromJson(Map params) => new Position._(
      params.containsKey('character') ? params['character'] : null,
      params.containsKey('line') ? params['line'] : null);

  final int character;

  final int line;

  Map toJson() => {'character': character, 'line': line};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(character));
    hash = _hashCombine(hash, _deepHashCode(line));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! Position) return false;
    var o = other as Position;
    if (character != o.character) return false;
    if (line != o.line) return false;
    return true;
  }
}

class Position$Builder {
  Position$Builder._();

  int character;

  int line;
}

class Range {
  Range._(this.end, this.start);

  factory Range(void init(Range$Builder)) {
    final b = new Range$Builder._();
    init(b);
    return new Range._(b.end, b.start);
  }

  factory Range.fromJson(Map params) => new Range._(
      params.containsKey('end') ? new Position.fromJson(params['end']) : null,
      params.containsKey('start')
          ? new Position.fromJson(params['start'])
          : null);

  final Position end;

  final Position start;

  Map toJson() => {'end': end?.toJson(), 'start': start?.toJson()};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(end));
    hash = _hashCombine(hash, _deepHashCode(start));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! Range) return false;
    var o = other as Range;
    if (end != o.end) return false;
    if (start != o.start) return false;
    return true;
  }
}

class Range$Builder {
  Range$Builder._();

  Position end;

  Position start;
}

class ReferenceContext {
  ReferenceContext._(this.includeDeclaration);

  factory ReferenceContext(void init(ReferenceContext$Builder)) {
    final b = new ReferenceContext$Builder._();
    init(b);
    return new ReferenceContext._(b.includeDeclaration);
  }

  factory ReferenceContext.fromJson(Map params) =>
      new ReferenceContext._(params.containsKey('includeDeclaration')
          ? params['includeDeclaration']
          : null);

  final bool includeDeclaration;

  Map toJson() => {'includeDeclaration': includeDeclaration};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(includeDeclaration));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! ReferenceContext) return false;
    var o = other as ReferenceContext;
    if (includeDeclaration != o.includeDeclaration) return false;
    return true;
  }
}

class ReferenceContext$Builder {
  ReferenceContext$Builder._();

  bool includeDeclaration;
}

class SaveOptions {
  SaveOptions._(this.includeText);

  factory SaveOptions(void init(SaveOptions$Builder)) {
    final b = new SaveOptions$Builder._();
    init(b);
    return new SaveOptions._(b.includeText);
  }

  factory SaveOptions.fromJson(Map params) => new SaveOptions._(
      params.containsKey('includeText') ? params['includeText'] : null);

  final bool includeText;

  Map toJson() => {'includeText': includeText};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(includeText));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! SaveOptions) return false;
    var o = other as SaveOptions;
    if (includeText != o.includeText) return false;
    return true;
  }
}

class SaveOptions$Builder {
  SaveOptions$Builder._();

  bool includeText;
}

class ServerCapabilities {
  ServerCapabilities._(
      this.codeActionProvider,
      this.codeLensProvider,
      this.completionProvider,
      this.definitionProvider,
      this.documentFormattingProvider,
      this.documentHighlightsProvider,
      this.documentLinkProvider,
      this.documentOnTypeFormattingProvider,
      this.documentRangeFormattingProvider,
      this.documentSymbolProvider,
      this.executeCommandProvider,
      this.hoverProvider,
      this.referencesProvider,
      this.renameProvider,
      this.signatureHelpProvider,
      this.textDocumentSync,
      this.workspaceSymbolProvider);

  factory ServerCapabilities(void init(ServerCapabilities$Builder)) {
    final b = new ServerCapabilities$Builder._();
    init(b);
    return new ServerCapabilities._(
        b.codeActionProvider,
        b.codeLensProvider,
        b.completionProvider,
        b.definitionProvider,
        b.documentFormattingProvider,
        b.documentHighlightsProvider,
        b.documentLinkProvider,
        b.documentOnTypeFormattingProvider,
        b.documentRangeFormattingProvider,
        b.documentSymbolProvider,
        b.executeCommandProvider,
        b.hoverProvider,
        b.referencesProvider,
        b.renameProvider,
        b.signatureHelpProvider,
        b.textDocumentSync,
        b.workspaceSymbolProvider);
  }

  factory ServerCapabilities.fromJson(Map params) => new ServerCapabilities._(
      params.containsKey('codeActionProvider')
          ? params['codeActionProvider']
          : null,
      params.containsKey('codeLensProvider')
          ? params['codeLensProvider']
          : null,
      params.containsKey('completionProvider')
          ? new CompletionOptions.fromJson(params['completionProvider'])
          : null,
      params.containsKey('definitionProvider')
          ? params['definitionProvider']
          : null,
      params.containsKey('documentFormattingProvider')
          ? params['documentFormattingProvider']
          : null,
      params.containsKey('documentHighlightsProvider')
          ? params['documentHighlightsProvider']
          : null,
      params.containsKey('documentLinkProvider')
          ? new DocumentLinkOptions.fromJson(params['documentLinkProvider'])
          : null,
      params.containsKey('documentOnTypeFormattingProvider')
          ? params['documentOnTypeFormattingProvider']
          : null,
      params.containsKey('documentRangeFormattingProvider')
          ? params['documentRangeFormattingProvider']
          : null,
      params.containsKey('documentSymbolProvider')
          ? params['documentSymbolProvider']
          : null,
      params.containsKey('executeCommandProvider')
          ? new ExecuteCommandOptions.fromJson(params['executeCommandProvider'])
          : null,
      params.containsKey('hoverProvider') ? params['hoverProvider'] : null,
      params.containsKey('referencesProvider')
          ? params['referencesProvider']
          : null,
      params.containsKey('renameProvider') ? params['renameProvider'] : null,
      params.containsKey('signatureHelpProvider')
          ? new SignatureHelpOptions.fromJson(params['signatureHelpProvider'])
          : null,
      params.containsKey('textDocumentSync')
          ? new TextDocumentSyncOptions.fromJson(params['textDocumentSync'])
          : null,
      params.containsKey('workspaceSymbolProvider')
          ? params['workspaceSymbolProvider']
          : null);

  final bool codeActionProvider;

  final bool codeLensProvider;

  final CompletionOptions completionProvider;

  final bool definitionProvider;

  final bool documentFormattingProvider;

  final bool documentHighlightsProvider;

  final DocumentLinkOptions documentLinkProvider;

  final bool documentOnTypeFormattingProvider;

  final bool documentRangeFormattingProvider;

  final bool documentSymbolProvider;

  final ExecuteCommandOptions executeCommandProvider;

  final bool hoverProvider;

  final bool referencesProvider;

  final bool renameProvider;

  final SignatureHelpOptions signatureHelpProvider;

  final TextDocumentSyncOptions textDocumentSync;

  final bool workspaceSymbolProvider;

  Map toJson() => {
        'codeActionProvider': codeActionProvider,
        'codeLensProvider': codeLensProvider,
        'completionProvider': completionProvider?.toJson(),
        'definitionProvider': definitionProvider,
        'documentFormattingProvider': documentFormattingProvider,
        'documentHighlightsProvider': documentHighlightsProvider,
        'documentLinkProvider': documentLinkProvider?.toJson(),
        'documentOnTypeFormattingProvider': documentOnTypeFormattingProvider,
        'documentRangeFormattingProvider': documentRangeFormattingProvider,
        'documentSymbolProvider': documentSymbolProvider,
        'executeCommandProvider': executeCommandProvider?.toJson(),
        'hoverProvider': hoverProvider,
        'referencesProvider': referencesProvider,
        'renameProvider': renameProvider,
        'signatureHelpProvider': signatureHelpProvider?.toJson(),
        'textDocumentSync': textDocumentSync?.toJson(),
        'workspaceSymbolProvider': workspaceSymbolProvider
      };
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(codeActionProvider));
    hash = _hashCombine(hash, _deepHashCode(codeLensProvider));
    hash = _hashCombine(hash, _deepHashCode(completionProvider));
    hash = _hashCombine(hash, _deepHashCode(definitionProvider));
    hash = _hashCombine(hash, _deepHashCode(documentFormattingProvider));
    hash = _hashCombine(hash, _deepHashCode(documentHighlightsProvider));
    hash = _hashCombine(hash, _deepHashCode(documentLinkProvider));
    hash = _hashCombine(hash, _deepHashCode(documentOnTypeFormattingProvider));
    hash = _hashCombine(hash, _deepHashCode(documentRangeFormattingProvider));
    hash = _hashCombine(hash, _deepHashCode(documentSymbolProvider));
    hash = _hashCombine(hash, _deepHashCode(executeCommandProvider));
    hash = _hashCombine(hash, _deepHashCode(hoverProvider));
    hash = _hashCombine(hash, _deepHashCode(referencesProvider));
    hash = _hashCombine(hash, _deepHashCode(renameProvider));
    hash = _hashCombine(hash, _deepHashCode(signatureHelpProvider));
    hash = _hashCombine(hash, _deepHashCode(textDocumentSync));
    hash = _hashCombine(hash, _deepHashCode(workspaceSymbolProvider));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! ServerCapabilities) return false;
    var o = other as ServerCapabilities;
    if (codeActionProvider != o.codeActionProvider) return false;
    if (codeLensProvider != o.codeLensProvider) return false;
    if (completionProvider != o.completionProvider) return false;
    if (definitionProvider != o.definitionProvider) return false;
    if (documentFormattingProvider != o.documentFormattingProvider)
      return false;
    if (documentHighlightsProvider != o.documentHighlightsProvider)
      return false;
    if (documentLinkProvider != o.documentLinkProvider) return false;
    if (documentOnTypeFormattingProvider != o.documentOnTypeFormattingProvider)
      return false;
    if (documentRangeFormattingProvider != o.documentRangeFormattingProvider)
      return false;
    if (documentSymbolProvider != o.documentSymbolProvider) return false;
    if (executeCommandProvider != o.executeCommandProvider) return false;
    if (hoverProvider != o.hoverProvider) return false;
    if (referencesProvider != o.referencesProvider) return false;
    if (renameProvider != o.renameProvider) return false;
    if (signatureHelpProvider != o.signatureHelpProvider) return false;
    if (textDocumentSync != o.textDocumentSync) return false;
    if (workspaceSymbolProvider != o.workspaceSymbolProvider) return false;
    return true;
  }
}

class ServerCapabilities$Builder {
  ServerCapabilities$Builder._();

  bool codeActionProvider;

  bool codeLensProvider;

  CompletionOptions completionProvider;

  bool definitionProvider;

  bool documentFormattingProvider;

  bool documentHighlightsProvider;

  DocumentLinkOptions documentLinkProvider;

  bool documentOnTypeFormattingProvider;

  bool documentRangeFormattingProvider;

  bool documentSymbolProvider;

  ExecuteCommandOptions executeCommandProvider;

  bool hoverProvider;

  bool referencesProvider;

  bool renameProvider;

  SignatureHelpOptions signatureHelpProvider;

  TextDocumentSyncOptions textDocumentSync;

  bool workspaceSymbolProvider;
}

class SignatureHelpOptions {
  SignatureHelpOptions._(this.triggerCharacters);

  factory SignatureHelpOptions(void init(SignatureHelpOptions$Builder)) {
    final b = new SignatureHelpOptions$Builder._();
    init(b);
    return new SignatureHelpOptions._(b.triggerCharacters);
  }

  factory SignatureHelpOptions.fromJson(Map params) =>
      new SignatureHelpOptions._(params.containsKey('triggerCharacters')
          ? params['triggerCharacters']
          : null);

  final List<String> triggerCharacters;

  Map toJson() => {'triggerCharacters': triggerCharacters};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(triggerCharacters));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! SignatureHelpOptions) return false;
    var o = other as SignatureHelpOptions;
    if (!_deepEquals(triggerCharacters, o.triggerCharacters)) return false;
    return true;
  }
}

class SignatureHelpOptions$Builder {
  SignatureHelpOptions$Builder._();

  List<String> triggerCharacters;
}

class SynchronizationCapabilities {
  SynchronizationCapabilities._(this.didSave, this.dynamicRegistration,
      this.willSave, this.willSaveWaitUntil);

  factory SynchronizationCapabilities(
      void init(SynchronizationCapabilities$Builder)) {
    final b = new SynchronizationCapabilities$Builder._();
    init(b);
    return new SynchronizationCapabilities._(
        b.didSave, b.dynamicRegistration, b.willSave, b.willSaveWaitUntil);
  }

  factory SynchronizationCapabilities.fromJson(Map params) =>
      new SynchronizationCapabilities._(
          params.containsKey('didSave') ? params['didSave'] : null,
          params.containsKey('dynamicRegistration')
              ? params['dynamicRegistration']
              : null,
          params.containsKey('willSave') ? params['willSave'] : null,
          params.containsKey('willSaveWaitUntil')
              ? params['willSaveWaitUntil']
              : null);

  final bool didSave;

  final bool dynamicRegistration;

  final bool willSave;

  final bool willSaveWaitUntil;

  Map toJson() => {
        'didSave': didSave,
        'dynamicRegistration': dynamicRegistration,
        'willSave': willSave,
        'willSaveWaitUntil': willSaveWaitUntil
      };
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(didSave));
    hash = _hashCombine(hash, _deepHashCode(dynamicRegistration));
    hash = _hashCombine(hash, _deepHashCode(willSave));
    hash = _hashCombine(hash, _deepHashCode(willSaveWaitUntil));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! SynchronizationCapabilities) return false;
    var o = other as SynchronizationCapabilities;
    if (didSave != o.didSave) return false;
    if (dynamicRegistration != o.dynamicRegistration) return false;
    if (willSave != o.willSave) return false;
    if (willSaveWaitUntil != o.willSaveWaitUntil) return false;
    return true;
  }
}

class SynchronizationCapabilities$Builder {
  SynchronizationCapabilities$Builder._();

  bool didSave;

  bool dynamicRegistration;

  bool willSave;

  bool willSaveWaitUntil;
}

class TextDocumentClientCapabilities {
  TextDocumentClientCapabilities._(
      this.codeAction,
      this.codeLens,
      this.completion,
      this.definition,
      this.documentHighlight,
      this.documentLink,
      this.documentSymbol,
      this.formatting,
      this.hover,
      this.onTypeFormatting,
      this.references,
      this.rename,
      this.synchronization);

  factory TextDocumentClientCapabilities(
      void init(TextDocumentClientCapabilities$Builder)) {
    final b = new TextDocumentClientCapabilities$Builder._();
    init(b);
    return new TextDocumentClientCapabilities._(
        b.codeAction,
        b.codeLens,
        b.completion,
        b.definition,
        b.documentHighlight,
        b.documentLink,
        b.documentSymbol,
        b.formatting,
        b.hover,
        b.onTypeFormatting,
        b.references,
        b.rename,
        b.synchronization);
  }

  factory TextDocumentClientCapabilities.fromJson(Map params) =>
      new TextDocumentClientCapabilities._(
          params.containsKey('codeAction')
              ? new DynamicRegistrationCapability.fromJson(params['codeAction'])
              : null,
          params.containsKey('codeLens')
              ? new DynamicRegistrationCapability.fromJson(params['codeLens'])
              : null,
          params.containsKey('completion')
              ? new CompletionCapabilities.fromJson(params['completion'])
              : null,
          params.containsKey('definition')
              ? new DynamicRegistrationCapability.fromJson(params['definition'])
              : null,
          params.containsKey('documentHighlight')
              ? new DynamicRegistrationCapability.fromJson(
                  params['documentHighlight'])
              : null,
          params.containsKey('documentLink')
              ? new DynamicRegistrationCapability.fromJson(
                  params['documentLink'])
              : null,
          params.containsKey('documentSymbol')
              ? new DynamicRegistrationCapability.fromJson(
                  params['documentSymbol'])
              : null,
          params.containsKey('formatting')
              ? new DynamicRegistrationCapability.fromJson(params['formatting'])
              : null,
          params.containsKey('hover')
              ? new DynamicRegistrationCapability.fromJson(params['hover'])
              : null,
          params.containsKey('onTypeFormatting')
              ? new DynamicRegistrationCapability.fromJson(
                  params['onTypeFormatting'])
              : null,
          params.containsKey('references')
              ? new DynamicRegistrationCapability.fromJson(params['references'])
              : null,
          params.containsKey('rename')
              ? new DynamicRegistrationCapability.fromJson(params['rename'])
              : null,
          params.containsKey('synchronization')
              ? new SynchronizationCapabilities.fromJson(
                  params['synchronization'])
              : null);

  final DynamicRegistrationCapability codeAction;

  final DynamicRegistrationCapability codeLens;

  final CompletionCapabilities completion;

  final DynamicRegistrationCapability definition;

  final DynamicRegistrationCapability documentHighlight;

  final DynamicRegistrationCapability documentLink;

  final DynamicRegistrationCapability documentSymbol;

  final DynamicRegistrationCapability formatting;

  final DynamicRegistrationCapability hover;

  final DynamicRegistrationCapability onTypeFormatting;

  final DynamicRegistrationCapability references;

  final DynamicRegistrationCapability rename;

  final SynchronizationCapabilities synchronization;

  Map toJson() => {
        'codeAction': codeAction?.toJson(),
        'codeLens': codeLens?.toJson(),
        'completion': completion?.toJson(),
        'definition': definition?.toJson(),
        'documentHighlight': documentHighlight?.toJson(),
        'documentLink': documentLink?.toJson(),
        'documentSymbol': documentSymbol?.toJson(),
        'formatting': formatting?.toJson(),
        'hover': hover?.toJson(),
        'onTypeFormatting': onTypeFormatting?.toJson(),
        'references': references?.toJson(),
        'rename': rename?.toJson(),
        'synchronization': synchronization?.toJson()
      };
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(codeAction));
    hash = _hashCombine(hash, _deepHashCode(codeLens));
    hash = _hashCombine(hash, _deepHashCode(completion));
    hash = _hashCombine(hash, _deepHashCode(definition));
    hash = _hashCombine(hash, _deepHashCode(documentHighlight));
    hash = _hashCombine(hash, _deepHashCode(documentLink));
    hash = _hashCombine(hash, _deepHashCode(documentSymbol));
    hash = _hashCombine(hash, _deepHashCode(formatting));
    hash = _hashCombine(hash, _deepHashCode(hover));
    hash = _hashCombine(hash, _deepHashCode(onTypeFormatting));
    hash = _hashCombine(hash, _deepHashCode(references));
    hash = _hashCombine(hash, _deepHashCode(rename));
    hash = _hashCombine(hash, _deepHashCode(synchronization));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! TextDocumentClientCapabilities) return false;
    var o = other as TextDocumentClientCapabilities;
    if (codeAction != o.codeAction) return false;
    if (codeLens != o.codeLens) return false;
    if (completion != o.completion) return false;
    if (definition != o.definition) return false;
    if (documentHighlight != o.documentHighlight) return false;
    if (documentLink != o.documentLink) return false;
    if (documentSymbol != o.documentSymbol) return false;
    if (formatting != o.formatting) return false;
    if (hover != o.hover) return false;
    if (onTypeFormatting != o.onTypeFormatting) return false;
    if (references != o.references) return false;
    if (rename != o.rename) return false;
    if (synchronization != o.synchronization) return false;
    return true;
  }
}

class TextDocumentClientCapabilities$Builder {
  TextDocumentClientCapabilities$Builder._();

  DynamicRegistrationCapability codeAction;

  DynamicRegistrationCapability codeLens;

  CompletionCapabilities completion;

  DynamicRegistrationCapability definition;

  DynamicRegistrationCapability documentHighlight;

  DynamicRegistrationCapability documentLink;

  DynamicRegistrationCapability documentSymbol;

  DynamicRegistrationCapability formatting;

  DynamicRegistrationCapability hover;

  DynamicRegistrationCapability onTypeFormatting;

  DynamicRegistrationCapability references;

  DynamicRegistrationCapability rename;

  SynchronizationCapabilities synchronization;
}

class TextDocumentContentChangeEvent {
  TextDocumentContentChangeEvent._(this.range, this.rangeLength, this.text);

  factory TextDocumentContentChangeEvent(
      void init(TextDocumentContentChangeEvent$Builder)) {
    final b = new TextDocumentContentChangeEvent$Builder._();
    init(b);
    return new TextDocumentContentChangeEvent._(b.range, b.rangeLength, b.text);
  }

  factory TextDocumentContentChangeEvent.fromJson(Map params) =>
      new TextDocumentContentChangeEvent._(
          params.containsKey('range')
              ? new Range.fromJson(params['range'])
              : null,
          params.containsKey('rangeLength') ? params['rangeLength'] : null,
          params.containsKey('text') ? params['text'] : null);

  final Range range;

  final int rangeLength;

  final String text;

  Map toJson() =>
      {'range': range?.toJson(), 'rangeLength': rangeLength, 'text': text};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(range));
    hash = _hashCombine(hash, _deepHashCode(rangeLength));
    hash = _hashCombine(hash, _deepHashCode(text));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! TextDocumentContentChangeEvent) return false;
    var o = other as TextDocumentContentChangeEvent;
    if (range != o.range) return false;
    if (rangeLength != o.rangeLength) return false;
    if (text != o.text) return false;
    return true;
  }
}

class TextDocumentContentChangeEvent$Builder {
  TextDocumentContentChangeEvent$Builder._();

  Range range;

  int rangeLength;

  String text;
}

class TextDocumentIdentifier {
  TextDocumentIdentifier._(this.uri);

  factory TextDocumentIdentifier(void init(TextDocumentIdentifier$Builder)) {
    final b = new TextDocumentIdentifier$Builder._();
    init(b);
    return new TextDocumentIdentifier._(b.uri);
  }

  factory TextDocumentIdentifier.fromJson(Map params) =>
      new TextDocumentIdentifier._(
          params.containsKey('uri') ? params['uri'] : null);

  final String uri;

  Map toJson() => {'uri': uri};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(uri));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! TextDocumentIdentifier) return false;
    var o = other as TextDocumentIdentifier;
    if (uri != o.uri) return false;
    return true;
  }
}

class TextDocumentIdentifier$Builder {
  TextDocumentIdentifier$Builder._();

  String uri;
}

class TextDocumentItem {
  TextDocumentItem._(this.languageId, this.text, this.uri, this.version);

  factory TextDocumentItem(void init(TextDocumentItem$Builder)) {
    final b = new TextDocumentItem$Builder._();
    init(b);
    return new TextDocumentItem._(b.languageId, b.text, b.uri, b.version);
  }

  factory TextDocumentItem.fromJson(Map params) => new TextDocumentItem._(
      params.containsKey('languageId') ? params['languageId'] : null,
      params.containsKey('text') ? params['text'] : null,
      params.containsKey('uri') ? params['uri'] : null,
      params.containsKey('version') ? params['version'] : null);

  final String languageId;

  final String text;

  final String uri;

  final int version;

  Map toJson() =>
      {'languageId': languageId, 'text': text, 'uri': uri, 'version': version};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(languageId));
    hash = _hashCombine(hash, _deepHashCode(text));
    hash = _hashCombine(hash, _deepHashCode(uri));
    hash = _hashCombine(hash, _deepHashCode(version));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! TextDocumentItem) return false;
    var o = other as TextDocumentItem;
    if (languageId != o.languageId) return false;
    if (text != o.text) return false;
    if (uri != o.uri) return false;
    if (version != o.version) return false;
    return true;
  }
}

class TextDocumentItem$Builder {
  TextDocumentItem$Builder._();

  String languageId;

  String text;

  String uri;

  int version;
}

class TextDocumentSyncKind {
  factory TextDocumentSyncKind.fromJson(int value) {
    const values = const {
      1: TextDocumentSyncKind.full,
      2: TextDocumentSyncKind.incremental,
      0: TextDocumentSyncKind.none
    };
    return values[value];
  }

  const TextDocumentSyncKind._(this._value);

  static const full = const TextDocumentSyncKind._(1);

  static const incremental = const TextDocumentSyncKind._(2);

  static const none = const TextDocumentSyncKind._(0);

  final int _value;

  int toJson() => _value;
}

class TextDocumentSyncOptions {
  TextDocumentSyncOptions._(this.change, this.openClose, this.save,
      this.willSave, this.willSaveWaitUntil);

  factory TextDocumentSyncOptions(void init(TextDocumentSyncOptions$Builder)) {
    final b = new TextDocumentSyncOptions$Builder._();
    init(b);
    return new TextDocumentSyncOptions._(
        b.change, b.openClose, b.save, b.willSave, b.willSaveWaitUntil);
  }

  factory TextDocumentSyncOptions.fromJson(
          Map params) =>
      new TextDocumentSyncOptions._(
          params.containsKey('change')
              ? new TextDocumentSyncKind.fromJson(params['change'])
              : null,
          params.containsKey('openClose') ? params['openClose'] : null,
          params.containsKey('save') ? params['save'] : null,
          params.containsKey('willSave') ? params['willSave'] : null,
          params.containsKey('willSaveWaitUntil')
              ? params['willSaveWaitUntil']
              : null);

  final TextDocumentSyncKind change;

  final bool openClose;

  final bool save;

  final bool willSave;

  final bool willSaveWaitUntil;

  Map toJson() => {
        'change': change?.toJson(),
        'openClose': openClose,
        'save': save,
        'willSave': willSave,
        'willSaveWaitUntil': willSaveWaitUntil
      };
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(change));
    hash = _hashCombine(hash, _deepHashCode(openClose));
    hash = _hashCombine(hash, _deepHashCode(save));
    hash = _hashCombine(hash, _deepHashCode(willSave));
    hash = _hashCombine(hash, _deepHashCode(willSaveWaitUntil));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! TextDocumentSyncOptions) return false;
    var o = other as TextDocumentSyncOptions;
    if (change != o.change) return false;
    if (openClose != o.openClose) return false;
    if (save != o.save) return false;
    if (willSave != o.willSave) return false;
    if (willSaveWaitUntil != o.willSaveWaitUntil) return false;
    return true;
  }
}

class TextDocumentSyncOptions$Builder {
  TextDocumentSyncOptions$Builder._();

  TextDocumentSyncKind change;

  bool openClose;

  bool save;

  bool willSave;

  bool willSaveWaitUntil;
}

class TextEdit {
  TextEdit._(this.newText, this.range);

  factory TextEdit(void init(TextEdit$Builder)) {
    final b = new TextEdit$Builder._();
    init(b);
    return new TextEdit._(b.newText, b.range);
  }

  factory TextEdit.fromJson(Map params) => new TextEdit._(
      params.containsKey('newText') ? params['newText'] : null,
      params.containsKey('range') ? new Range.fromJson(params['range']) : null);

  final String newText;

  final Range range;

  Map toJson() => {'newText': newText, 'range': range?.toJson()};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(newText));
    hash = _hashCombine(hash, _deepHashCode(range));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! TextEdit) return false;
    var o = other as TextEdit;
    if (newText != o.newText) return false;
    if (range != o.range) return false;
    return true;
  }
}

class TextEdit$Builder {
  TextEdit$Builder._();

  String newText;

  Range range;
}

class VersionedTextDocumentIdentifier {
  VersionedTextDocumentIdentifier._(this.uri, this.version);

  factory VersionedTextDocumentIdentifier(
      void init(VersionedTextDocumentIdentifier$Builder)) {
    final b = new VersionedTextDocumentIdentifier$Builder._();
    init(b);
    return new VersionedTextDocumentIdentifier._(b.uri, b.version);
  }

  factory VersionedTextDocumentIdentifier.fromJson(Map params) =>
      new VersionedTextDocumentIdentifier._(
          params.containsKey('uri') ? params['uri'] : null,
          params.containsKey('version') ? params['version'] : null);

  final String uri;

  final int version;

  Map toJson() => {'uri': uri, 'version': version};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(uri));
    hash = _hashCombine(hash, _deepHashCode(version));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! VersionedTextDocumentIdentifier) return false;
    var o = other as VersionedTextDocumentIdentifier;
    if (uri != o.uri) return false;
    if (version != o.version) return false;
    return true;
  }
}

class VersionedTextDocumentIdentifier$Builder {
  VersionedTextDocumentIdentifier$Builder._();

  String uri;

  int version;
}

class WorkspaceClientCapabilities {
  WorkspaceClientCapabilities._(this.applyEdit, this.didChangeConfiguration,
      this.didChangeWatchedFiles, this.executeCommand, this.symbol);

  factory WorkspaceClientCapabilities(
      void init(WorkspaceClientCapabilities$Builder)) {
    final b = new WorkspaceClientCapabilities$Builder._();
    init(b);
    return new WorkspaceClientCapabilities._(
        b.applyEdit,
        b.didChangeConfiguration,
        b.didChangeWatchedFiles,
        b.executeCommand,
        b.symbol);
  }

  factory WorkspaceClientCapabilities.fromJson(
          Map params) =>
      new WorkspaceClientCapabilities._(
          params.containsKey('applyEdit') ? params['applyEdit'] : null,
          params.containsKey('didChangeConfiguration')
              ? new DynamicRegistrationCapability.fromJson(
                  params['didChangeConfiguration'])
              : null,
          params.containsKey('didChangeWatchedFiles')
              ? new DynamicRegistrationCapability.fromJson(
                  params['didChangeWatchedFiles'])
              : null,
          params.containsKey('executeCommand')
              ? new DynamicRegistrationCapability.fromJson(
                  params['executeCommand'])
              : null,
          params.containsKey('symbol')
              ? new DynamicRegistrationCapability.fromJson(params['symbol'])
              : null);

  final bool applyEdit;

  final DynamicRegistrationCapability didChangeConfiguration;

  final DynamicRegistrationCapability didChangeWatchedFiles;

  final DynamicRegistrationCapability executeCommand;

  final DynamicRegistrationCapability symbol;

  Map toJson() => {
        'applyEdit': applyEdit,
        'didChangeConfiguration': didChangeConfiguration?.toJson(),
        'didChangeWatchedFiles': didChangeWatchedFiles?.toJson(),
        'executeCommand': executeCommand?.toJson(),
        'symbol': symbol?.toJson()
      };
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(applyEdit));
    hash = _hashCombine(hash, _deepHashCode(didChangeConfiguration));
    hash = _hashCombine(hash, _deepHashCode(didChangeWatchedFiles));
    hash = _hashCombine(hash, _deepHashCode(executeCommand));
    hash = _hashCombine(hash, _deepHashCode(symbol));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! WorkspaceClientCapabilities) return false;
    var o = other as WorkspaceClientCapabilities;
    if (applyEdit != o.applyEdit) return false;
    if (didChangeConfiguration != o.didChangeConfiguration) return false;
    if (didChangeWatchedFiles != o.didChangeWatchedFiles) return false;
    if (executeCommand != o.executeCommand) return false;
    if (symbol != o.symbol) return false;
    return true;
  }
}

class WorkspaceClientCapabilities$Builder {
  WorkspaceClientCapabilities$Builder._();

  bool applyEdit;

  DynamicRegistrationCapability didChangeConfiguration;

  DynamicRegistrationCapability didChangeWatchedFiles;

  DynamicRegistrationCapability executeCommand;

  DynamicRegistrationCapability symbol;
}

class WorkspaceEdit {
  WorkspaceEdit._(this.changes);

  factory WorkspaceEdit(void init(WorkspaceEdit$Builder)) {
    final b = new WorkspaceEdit$Builder._();
    init(b);
    return new WorkspaceEdit._(b.changes);
  }

  factory WorkspaceEdit.fromJson(Map params) =>
      new WorkspaceEdit._(params.containsKey('changes')
          ? new Map.fromIterable(params['changes'].keys,
              value: (v) => params['changes'][v]
                  .map((v) => new TextEdit.fromJson(v))
                  .toList())
          : null);

  final Map<String, List<TextEdit>> changes;

  Map toJson() => {
        'changes': changes == null
            ? null
            : new Map.fromIterable(changes.keys,
                value: (v) => changes[v]?.map((v) => v?.toJson())?.toList())
      };
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(changes));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! WorkspaceEdit) return false;
    var o = other as WorkspaceEdit;
    if (!_deepEquals(changes, o.changes)) return false;
    return true;
  }
}

class WorkspaceEdit$Builder {
  WorkspaceEdit$Builder._();

  Map<String, List<TextEdit>> changes;
}

int _hashCombine(int hash, int value) {
  hash = 0x1fffffff & (hash + value);
  hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
  return hash ^ (hash >> 6);
}

int _hashComplete(int hash) {
  hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
  hash = hash ^ (hash >> 11);
  return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
}

int _deepHashCode(dynamic value) {
  if (value is List) {
    return value.map(_deepHashCode).reduce(_hashCombine);
  }
  if (value is Map) {
    return (value.keys
            .map((key) => _hashCombine(key.hashCode, _deepHashCode(value[key])))
            .toList(growable: false)
              ..sort())
        .reduce(_hashCombine);
  }
  return value.hashCode;
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
  if (left is Map && right is Map) {
    var leftLength = left.length;
    var rightLength = right.length;
    if (leftLength != rightLength) return false;
    for (final key in left.keys) {
      if (!_deepEquals(left[key], right[key])) return false;
    }
    return true;
  }
  return left == right;
}
