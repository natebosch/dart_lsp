class ApplyWorkspaceEditParams {
  ApplyWorkspaceEditParams._(this.edit, this.label);

  factory ApplyWorkspaceEditParams(
      void Function(ApplyWorkspaceEditParams$Builder) init) {
    final b = ApplyWorkspaceEditParams$Builder._();
    init(b);
    return ApplyWorkspaceEditParams._(b.edit, b.label);
  }

  factory ApplyWorkspaceEditParams.fromJson(Map params) =>
      ApplyWorkspaceEditParams._(
          params.containsKey('edit') && params['edit'] != null
              ? WorkspaceEdit.fromJson(params['edit'])
              : null,
          params.containsKey('label') && params['label'] != null
              ? params['label']
              : null);

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

  factory ClientCapabilities(void Function(ClientCapabilities$Builder) init) {
    final b = ClientCapabilities$Builder._();
    init(b);
    return ClientCapabilities._(b.textDocument, b.workspace);
  }

  factory ClientCapabilities.fromJson(Map params) => ClientCapabilities._(
      params.containsKey('textDocument') && params['textDocument'] != null
          ? TextDocumentClientCapabilities.fromJson(params['textDocument'])
          : null,
      params.containsKey('workspace') && params['workspace'] != null
          ? WorkspaceClientCapabilities.fromJson(params['workspace'])
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

class CodeAction {
  CodeAction._(
      this.command, this.diagnostics, this.edit, this.kind, this.title);

  factory CodeAction(void Function(CodeAction$Builder) init) {
    final b = CodeAction$Builder._();
    init(b);
    return CodeAction._(b.command, b.diagnostics, b.edit, b.kind, b.title);
  }

  factory CodeAction.fromJson(Map params) => CodeAction._(
      params.containsKey('command') && params['command'] != null
          ? Command.fromJson(params['command'])
          : null,
      params.containsKey('diagnostics') && params['diagnostics'] != null
          ? (params['diagnostics'] as List)
              .map((v) => Diagnostic.fromJson(v))
              .toList()
          : null,
      params.containsKey('edit') && params['edit'] != null
          ? WorkspaceEdit.fromJson(params['edit'])
          : null,
      params.containsKey('kind') && params['kind'] != null
          ? params['kind']
          : null,
      params.containsKey('title') && params['title'] != null
          ? params['title']
          : null);

  final Command command;

  final List<Diagnostic> diagnostics;

  final WorkspaceEdit edit;

  final String kind;

  final String title;

  Map toJson() => {
        'command': command?.toJson(),
        'diagnostics': diagnostics?.map((v) => v?.toJson())?.toList(),
        'edit': edit?.toJson(),
        'kind': kind,
        'title': title
      };
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(command));
    hash = _hashCombine(hash, _deepHashCode(diagnostics));
    hash = _hashCombine(hash, _deepHashCode(edit));
    hash = _hashCombine(hash, _deepHashCode(kind));
    hash = _hashCombine(hash, _deepHashCode(title));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! CodeAction) return false;
    var o = other as CodeAction;
    if (command != o.command) return false;
    if (!_deepEquals(diagnostics, o.diagnostics)) return false;
    if (edit != o.edit) return false;
    if (kind != o.kind) return false;
    if (title != o.title) return false;
    return true;
  }
}

class CodeAction$Builder {
  CodeAction$Builder._();

  Command command;

  List<Diagnostic> diagnostics;

  WorkspaceEdit edit;

  String kind;

  String title;
}

class CodeActionCapabilities {
  CodeActionCapabilities._(
      this.codeActionLiteralSupport, this.dynamicRegistration);

  factory CodeActionCapabilities(
      void Function(CodeActionCapabilities$Builder) init) {
    final b = CodeActionCapabilities$Builder._();
    init(b);
    return CodeActionCapabilities._(
        b.codeActionLiteralSupport, b.dynamicRegistration);
  }

  factory CodeActionCapabilities.fromJson(Map params) =>
      CodeActionCapabilities._(
          params.containsKey('codeActionLiteralSupport') &&
                  params['codeActionLiteralSupport'] != null
              ? CodeActionLiteralSupport.fromJson(
                  params['codeActionLiteralSupport'])
              : null,
          params.containsKey('dynamicRegistration') &&
                  params['dynamicRegistration'] != null
              ? params['dynamicRegistration']
              : null);

  final CodeActionLiteralSupport codeActionLiteralSupport;

  final bool dynamicRegistration;

  Map toJson() => {
        'codeActionLiteralSupport': codeActionLiteralSupport?.toJson(),
        'dynamicRegistration': dynamicRegistration
      };
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(codeActionLiteralSupport));
    hash = _hashCombine(hash, _deepHashCode(dynamicRegistration));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! CodeActionCapabilities) return false;
    var o = other as CodeActionCapabilities;
    if (codeActionLiteralSupport != o.codeActionLiteralSupport) return false;
    if (dynamicRegistration != o.dynamicRegistration) return false;
    return true;
  }
}

class CodeActionCapabilities$Builder {
  CodeActionCapabilities$Builder._();

  CodeActionLiteralSupport codeActionLiteralSupport;

  bool dynamicRegistration;
}

class CodeActionContext {
  CodeActionContext._(this.diagnostics);

  factory CodeActionContext(void Function(CodeActionContext$Builder) init) {
    final b = CodeActionContext$Builder._();
    init(b);
    return CodeActionContext._(b.diagnostics);
  }

  factory CodeActionContext.fromJson(Map params) => CodeActionContext._(
      params.containsKey('diagnostics') && params['diagnostics'] != null
          ? (params['diagnostics'] as List)
              .map((v) => Diagnostic.fromJson(v))
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

class CodeActionKinds {
  CodeActionKinds._(this.valueSet);

  factory CodeActionKinds(void Function(CodeActionKinds$Builder) init) {
    final b = CodeActionKinds$Builder._();
    init(b);
    return CodeActionKinds._(b.valueSet);
  }

  factory CodeActionKinds.fromJson(Map params) => CodeActionKinds._(
      params.containsKey('valueSet') && params['valueSet'] != null
          ? (params['valueSet'] as List).cast<String>()
          : null);

  final List<String> valueSet;

  Map toJson() => {'valueSet': valueSet};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(valueSet));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! CodeActionKinds) return false;
    var o = other as CodeActionKinds;
    if (!_deepEquals(valueSet, o.valueSet)) return false;
    return true;
  }
}

class CodeActionKinds$Builder {
  CodeActionKinds$Builder._();

  List<String> valueSet;
}

class CodeActionLiteralSupport {
  CodeActionLiteralSupport._(this.codeActionKind);

  factory CodeActionLiteralSupport(
      void Function(CodeActionLiteralSupport$Builder) init) {
    final b = CodeActionLiteralSupport$Builder._();
    init(b);
    return CodeActionLiteralSupport._(b.codeActionKind);
  }

  factory CodeActionLiteralSupport.fromJson(Map params) =>
      CodeActionLiteralSupport._(params.containsKey('codeActionKind') &&
              params['codeActionKind'] != null
          ? CodeActionKinds.fromJson(params['codeActionKind'])
          : null);

  final CodeActionKinds codeActionKind;

  Map toJson() => {'codeActionKind': codeActionKind?.toJson()};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(codeActionKind));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! CodeActionLiteralSupport) return false;
    var o = other as CodeActionLiteralSupport;
    if (codeActionKind != o.codeActionKind) return false;
    return true;
  }
}

class CodeActionLiteralSupport$Builder {
  CodeActionLiteralSupport$Builder._();

  CodeActionKinds codeActionKind;
}

class CodeLensOptions {
  CodeLensOptions._(this.resolveProvider);

  factory CodeLensOptions(void Function(CodeLensOptions$Builder) init) {
    final b = CodeLensOptions$Builder._();
    init(b);
    return CodeLensOptions._(b.resolveProvider);
  }

  factory CodeLensOptions.fromJson(Map params) => CodeLensOptions._(
      params.containsKey('resolveProvider') && params['resolveProvider'] != null
          ? params['resolveProvider']
          : null);

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

  factory Command(void Function(Command$Builder) init) {
    final b = Command$Builder._();
    init(b);
    return Command._(b.arguments, b.command, b.title);
  }

  factory Command.fromJson(Map params) => Command._(
      params.containsKey('arguments') && params['arguments'] != null
          ? (params['arguments'] as List).cast<dynamic>()
          : null,
      params.containsKey('command') && params['command'] != null
          ? params['command']
          : null,
      params.containsKey('title') && params['title'] != null
          ? params['title']
          : null);

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

  factory CompletionCapabilities(
      void Function(CompletionCapabilities$Builder) init) {
    final b = CompletionCapabilities$Builder._();
    init(b);
    return CompletionCapabilities._(b.completionItem, b.dynamicRegistration);
  }

  factory CompletionCapabilities.fromJson(Map params) =>
      CompletionCapabilities._(
          params.containsKey('completionItem') &&
                  params['completionItem'] != null
              ? CompletionItemCapabilities.fromJson(params['completionItem'])
              : null,
          params.containsKey('dynamicRegistration') &&
                  params['dynamicRegistration'] != null
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

  factory CompletionItem(void Function(CompletionItem$Builder) init) {
    final b = CompletionItem$Builder._();
    init(b);
    return CompletionItem._(
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

  factory CompletionItem.fromJson(Map params) => CompletionItem._(
      params.containsKey('additionalTextEdits') &&
              params['additionalTextEdits'] != null
          ? (params['additionalTextEdits'] as List)
              .map((v) => TextEdit.fromJson(v))
              .toList()
          : null,
      params.containsKey('command') && params['command'] != null
          ? Command.fromJson(params['command'])
          : null,
      params.containsKey('data') && params['data'] != null
          ? params['data']
          : null,
      params.containsKey('detail') && params['detail'] != null
          ? params['detail']
          : null,
      params.containsKey('documentation') && params['documentation'] != null
          ? params['documentation']
          : null,
      params.containsKey('filterText') && params['filterText'] != null
          ? params['filterText']
          : null,
      params.containsKey('insertText') && params['insertText'] != null
          ? params['insertText']
          : null,
      params.containsKey('insertTextFormat') &&
              params['insertTextFormat'] != null
          ? InsertTextFormat.fromJson(params['insertTextFormat'])
          : null,
      params.containsKey('kind') && params['kind'] != null
          ? CompletionItemKind.fromJson(params['kind'])
          : null,
      params.containsKey('label') && params['label'] != null
          ? params['label']
          : null,
      params.containsKey('sortText') && params['sortText'] != null
          ? params['sortText']
          : null,
      params.containsKey('textEdit') && params['textEdit'] != null
          ? TextEdit.fromJson(params['textEdit'])
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
      void Function(CompletionItemCapabilities$Builder) init) {
    final b = CompletionItemCapabilities$Builder._();
    init(b);
    return CompletionItemCapabilities._(b.snippetSupport);
  }

  factory CompletionItemCapabilities.fromJson(Map params) =>
      CompletionItemCapabilities._(params.containsKey('snippetSupport') &&
              params['snippetSupport'] != null
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
    const values = {
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

  static const classKind = CompletionItemKind._(7);

  static const color = CompletionItemKind._(16);

  static const constructor = CompletionItemKind._(4);

  static const enumKind = CompletionItemKind._(13);

  static const field = CompletionItemKind._(5);

  static const file = CompletionItemKind._(17);

  static const function = CompletionItemKind._(3);

  static const interface = CompletionItemKind._(8);

  static const keyword = CompletionItemKind._(14);

  static const method = CompletionItemKind._(2);

  static const module = CompletionItemKind._(9);

  static const property = CompletionItemKind._(10);

  static const reference = CompletionItemKind._(18);

  static const snippet = CompletionItemKind._(15);

  static const text = CompletionItemKind._(1);

  static const unit = CompletionItemKind._(11);

  static const value = CompletionItemKind._(12);

  static const variable = CompletionItemKind._(6);

  final int _value;

  int toJson() => _value;
}

class CompletionList {
  CompletionList._(this.isIncomplete, this.items);

  factory CompletionList(void Function(CompletionList$Builder) init) {
    final b = CompletionList$Builder._();
    init(b);
    return CompletionList._(b.isIncomplete, b.items);
  }

  factory CompletionList.fromJson(Map params) => CompletionList._(
      params.containsKey('isIncomplete') && params['isIncomplete'] != null
          ? params['isIncomplete']
          : null,
      params.containsKey('items') && params['items'] != null
          ? (params['items'] as List)
              .map((v) => CompletionItem.fromJson(v))
              .toList()
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

  factory CompletionOptions(void Function(CompletionOptions$Builder) init) {
    final b = CompletionOptions$Builder._();
    init(b);
    return CompletionOptions._(b.resolveProvider, b.triggerCharacters);
  }

  factory CompletionOptions.fromJson(Map params) => CompletionOptions._(
      params.containsKey('resolveProvider') && params['resolveProvider'] != null
          ? params['resolveProvider']
          : null,
      params.containsKey('triggerCharacters') &&
              params['triggerCharacters'] != null
          ? (params['triggerCharacters'] as List).cast<String>()
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

  factory Diagnostic(void Function(Diagnostic$Builder) init) {
    final b = Diagnostic$Builder._();
    init(b);
    return Diagnostic._(b.code, b.message, b.range, b.severity, b.source);
  }

  factory Diagnostic.fromJson(Map params) => Diagnostic._(
      params.containsKey('code') && params['code'] != null
          ? params['code']
          : null,
      params.containsKey('message') && params['message'] != null
          ? params['message']
          : null,
      params.containsKey('range') && params['range'] != null
          ? Range.fromJson(params['range'])
          : null,
      params.containsKey('severity') && params['severity'] != null
          ? params['severity']
          : null,
      params.containsKey('source') && params['source'] != null
          ? params['source']
          : null);

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

  factory Diagnostics(void Function(Diagnostics$Builder) init) {
    final b = Diagnostics$Builder._();
    init(b);
    return Diagnostics._(b.diagnostics, b.uri);
  }

  factory Diagnostics.fromJson(Map params) => Diagnostics._(
      params.containsKey('diagnostics') && params['diagnostics'] != null
          ? (params['diagnostics'] as List)
              .map((v) => Diagnostic.fromJson(v))
              .toList()
          : null,
      params.containsKey('uri') && params['uri'] != null
          ? params['uri']
          : null);

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

class DocumentHighlight {
  DocumentHighlight._(this.kind, this.range);

  factory DocumentHighlight(void Function(DocumentHighlight$Builder) init) {
    final b = DocumentHighlight$Builder._();
    init(b);
    return DocumentHighlight._(b.kind, b.range);
  }

  factory DocumentHighlight.fromJson(Map params) => DocumentHighlight._(
      params.containsKey('kind') && params['kind'] != null
          ? DocumentHighlightKind.fromJson(params['kind'])
          : null,
      params.containsKey('range') && params['range'] != null
          ? Range.fromJson(params['range'])
          : null);

  final DocumentHighlightKind kind;

  final Range range;

  Map toJson() => {'kind': kind?.toJson(), 'range': range?.toJson()};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(kind));
    hash = _hashCombine(hash, _deepHashCode(range));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! DocumentHighlight) return false;
    var o = other as DocumentHighlight;
    if (kind != o.kind) return false;
    if (range != o.range) return false;
    return true;
  }
}

class DocumentHighlight$Builder {
  DocumentHighlight$Builder._();

  DocumentHighlightKind kind;

  Range range;
}

class DocumentHighlightKind {
  factory DocumentHighlightKind.fromJson(int value) {
    const values = {
      2: DocumentHighlightKind.read,
      1: DocumentHighlightKind.text,
      3: DocumentHighlightKind.write
    };
    return values[value];
  }

  const DocumentHighlightKind._(this._value);

  static const read = DocumentHighlightKind._(2);

  static const text = DocumentHighlightKind._(1);

  static const write = DocumentHighlightKind._(3);

  final int _value;

  int toJson() => _value;
}

class DocumentLinkOptions {
  DocumentLinkOptions._(this.resolveProvider);

  factory DocumentLinkOptions(void Function(DocumentLinkOptions$Builder) init) {
    final b = DocumentLinkOptions$Builder._();
    init(b);
    return DocumentLinkOptions._(b.resolveProvider);
  }

  factory DocumentLinkOptions.fromJson(Map params) => DocumentLinkOptions._(
      params.containsKey('resolveProvider') && params['resolveProvider'] != null
          ? params['resolveProvider']
          : null);

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
      void Function(DocumentOnTypeFormattingOptions$Builder) init) {
    final b = DocumentOnTypeFormattingOptions$Builder._();
    init(b);
    return DocumentOnTypeFormattingOptions._(
        b.firstTriggerCharacter, b.moreTriggerCharacter);
  }

  factory DocumentOnTypeFormattingOptions.fromJson(Map params) =>
      DocumentOnTypeFormattingOptions._(
          params.containsKey('firstTriggerCharacter') &&
                  params['firstTriggerCharacter'] != null
              ? params['firstTriggerCharacter']
              : null,
          params.containsKey('moreTriggerCharacter') &&
                  params['moreTriggerCharacter'] != null
              ? (params['moreTriggerCharacter'] as List).cast<String>()
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
      void Function(DynamicRegistrationCapability$Builder) init) {
    final b = DynamicRegistrationCapability$Builder._();
    init(b);
    return DynamicRegistrationCapability._(b.dynamicRegistration);
  }

  factory DynamicRegistrationCapability.fromJson(Map params) =>
      DynamicRegistrationCapability._(
          params.containsKey('dynamicRegistration') &&
                  params['dynamicRegistration'] != null
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

  factory ExecuteCommandOptions(
      void Function(ExecuteCommandOptions$Builder) init) {
    final b = ExecuteCommandOptions$Builder._();
    init(b);
    return ExecuteCommandOptions._(b.commands);
  }

  factory ExecuteCommandOptions.fromJson(Map params) => ExecuteCommandOptions._(
      params.containsKey('commands') && params['commands'] != null
          ? (params['commands'] as List).cast<String>()
          : null);

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

  factory Hover(void Function(Hover$Builder) init) {
    final b = Hover$Builder._();
    init(b);
    return Hover._(b.contents, b.range);
  }

  factory Hover.fromJson(Map params) => Hover._(
      params.containsKey('contents') && params['contents'] != null
          ? params['contents']
          : null,
      params.containsKey('range') && params['range'] != null
          ? Range.fromJson(params['range'])
          : null);

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

class HoverCapabilities {
  HoverCapabilities._(this.contentFormat, this.dynamicRegistration);

  factory HoverCapabilities(void Function(HoverCapabilities$Builder) init) {
    final b = HoverCapabilities$Builder._();
    init(b);
    return HoverCapabilities._(b.contentFormat, b.dynamicRegistration);
  }

  factory HoverCapabilities.fromJson(Map params) => HoverCapabilities._(
      params.containsKey('contentFormat') && params['contentFormat'] != null
          ? (params['contentFormat'] as List).cast<String>()
          : null,
      params.containsKey('dynamicRegistration') &&
              params['dynamicRegistration'] != null
          ? params['dynamicRegistration']
          : null);

  final List<String> contentFormat;

  final bool dynamicRegistration;

  Map toJson() => {
        'contentFormat': contentFormat,
        'dynamicRegistration': dynamicRegistration
      };
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(contentFormat));
    hash = _hashCombine(hash, _deepHashCode(dynamicRegistration));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! HoverCapabilities) return false;
    var o = other as HoverCapabilities;
    if (!_deepEquals(contentFormat, o.contentFormat)) return false;
    if (dynamicRegistration != o.dynamicRegistration) return false;
    return true;
  }
}

class HoverCapabilities$Builder {
  HoverCapabilities$Builder._();

  List<String> contentFormat;

  bool dynamicRegistration;
}

class HoverMarkup {
  HoverMarkup._(this.contents, this.range);

  factory HoverMarkup(void Function(HoverMarkup$Builder) init) {
    final b = HoverMarkup$Builder._();
    init(b);
    return HoverMarkup._(b.contents, b.range);
  }

  factory HoverMarkup.fromJson(Map params) => HoverMarkup._(
      params.containsKey('contents') && params['contents'] != null
          ? MarkupContent.fromJson(params['contents'])
          : null,
      params.containsKey('range') && params['range'] != null
          ? Range.fromJson(params['range'])
          : null);

  final MarkupContent contents;

  final Range range;

  Map toJson() => {'contents': contents?.toJson(), 'range': range?.toJson()};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(contents));
    hash = _hashCombine(hash, _deepHashCode(range));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! HoverMarkup) return false;
    var o = other as HoverMarkup;
    if (contents != o.contents) return false;
    if (range != o.range) return false;
    return true;
  }
}

class HoverMarkup$Builder {
  HoverMarkup$Builder._();

  MarkupContent contents;

  Range range;
}

class InsertTextFormat {
  factory InsertTextFormat.fromJson(int value) {
    const values = {1: InsertTextFormat.plainText, 2: InsertTextFormat.snippet};
    return values[value];
  }

  const InsertTextFormat._(this._value);

  static const plainText = InsertTextFormat._(1);

  static const snippet = InsertTextFormat._(2);

  final int _value;

  int toJson() => _value;
}

class Location {
  Location._(this.range, this.uri);

  factory Location(void Function(Location$Builder) init) {
    final b = Location$Builder._();
    init(b);
    return Location._(b.range, b.uri);
  }

  factory Location.fromJson(Map params) => Location._(
      params.containsKey('range') && params['range'] != null
          ? Range.fromJson(params['range'])
          : null,
      params.containsKey('uri') && params['uri'] != null
          ? params['uri']
          : null);

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

class MarkupContent {
  MarkupContent._(this.kind, this.value);

  factory MarkupContent(void Function(MarkupContent$Builder) init) {
    final b = MarkupContent$Builder._();
    init(b);
    return MarkupContent._(b.kind, b.value);
  }

  factory MarkupContent.fromJson(Map params) => MarkupContent._(
      params.containsKey('kind') && params['kind'] != null
          ? MarkupContentKind.fromJson(params['kind'])
          : null,
      params.containsKey('value') && params['value'] != null
          ? params['value']
          : null);

  final MarkupContentKind kind;

  final String value;

  Map toJson() => {'kind': kind?.toJson(), 'value': value};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(kind));
    hash = _hashCombine(hash, _deepHashCode(value));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! MarkupContent) return false;
    var o = other as MarkupContent;
    if (kind != o.kind) return false;
    if (value != o.value) return false;
    return true;
  }
}

class MarkupContent$Builder {
  MarkupContent$Builder._();

  MarkupContentKind kind;

  String value;
}

class MarkupContentKind {
  factory MarkupContentKind.fromJson(String value) {
    const values = {
      'markdown': MarkupContentKind.markdown,
      'plaintext': MarkupContentKind.plaintext
    };
    return values[value];
  }

  const MarkupContentKind._(this._value);

  static const markdown = MarkupContentKind._('markdown');

  static const plaintext = MarkupContentKind._('plaintext');

  final String _value;

  String toJson() => _value;
}

class MessageType {
  factory MessageType.fromJson(int value) {
    const values = {
      1: MessageType.error,
      3: MessageType.info,
      4: MessageType.log,
      2: MessageType.warning
    };
    return values[value];
  }

  const MessageType._(this._value);

  static const error = MessageType._(1);

  static const info = MessageType._(3);

  static const log = MessageType._(4);

  static const warning = MessageType._(2);

  final int _value;

  int toJson() => _value;
}

class Position {
  Position._(this.character, this.line);

  factory Position(void Function(Position$Builder) init) {
    final b = Position$Builder._();
    init(b);
    return Position._(b.character, b.line);
  }

  factory Position.fromJson(Map params) => Position._(
      params.containsKey('character') && params['character'] != null
          ? params['character']
          : null,
      params.containsKey('line') && params['line'] != null
          ? params['line']
          : null);

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

  factory Range(void Function(Range$Builder) init) {
    final b = Range$Builder._();
    init(b);
    return Range._(b.end, b.start);
  }

  factory Range.fromJson(Map params) => Range._(
      params.containsKey('end') && params['end'] != null
          ? Position.fromJson(params['end'])
          : null,
      params.containsKey('start') && params['start'] != null
          ? Position.fromJson(params['start'])
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

  factory ReferenceContext(void Function(ReferenceContext$Builder) init) {
    final b = ReferenceContext$Builder._();
    init(b);
    return ReferenceContext._(b.includeDeclaration);
  }

  factory ReferenceContext.fromJson(Map params) =>
      ReferenceContext._(params.containsKey('includeDeclaration') &&
              params['includeDeclaration'] != null
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

  factory SaveOptions(void Function(SaveOptions$Builder) init) {
    final b = SaveOptions$Builder._();
    init(b);
    return SaveOptions._(b.includeText);
  }

  factory SaveOptions.fromJson(Map params) => SaveOptions._(
      params.containsKey('includeText') && params['includeText'] != null
          ? params['includeText']
          : null);

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
      this.documentHighlightProvider,
      this.documentLinkProvider,
      this.documentOnTypeFormattingProvider,
      this.documentRangeFormattingProvider,
      this.documentSymbolProvider,
      this.executeCommandProvider,
      this.hoverProvider,
      this.implementationProvider,
      this.referencesProvider,
      this.renameProvider,
      this.signatureHelpProvider,
      this.textDocumentSync,
      this.workspaceSymbolProvider);

  factory ServerCapabilities(void Function(ServerCapabilities$Builder) init) {
    final b = ServerCapabilities$Builder._();
    init(b);
    return ServerCapabilities._(
        b.codeActionProvider,
        b.codeLensProvider,
        b.completionProvider,
        b.definitionProvider,
        b.documentFormattingProvider,
        b.documentHighlightProvider,
        b.documentLinkProvider,
        b.documentOnTypeFormattingProvider,
        b.documentRangeFormattingProvider,
        b.documentSymbolProvider,
        b.executeCommandProvider,
        b.hoverProvider,
        b.implementationProvider,
        b.referencesProvider,
        b.renameProvider,
        b.signatureHelpProvider,
        b.textDocumentSync,
        b.workspaceSymbolProvider);
  }

  factory ServerCapabilities.fromJson(Map params) => ServerCapabilities._(
      params.containsKey('codeActionProvider') && params['codeActionProvider'] != null
          ? params['codeActionProvider']
          : null,
      params.containsKey('codeLensProvider') && params['codeLensProvider'] != null
          ? CodeLensOptions.fromJson(params['codeLensProvider'])
          : null,
      params.containsKey('completionProvider') && params['completionProvider'] != null
          ? CompletionOptions.fromJson(params['completionProvider'])
          : null,
      params.containsKey('definitionProvider') && params['definitionProvider'] != null
          ? params['definitionProvider']
          : null,
      params.containsKey('documentFormattingProvider') && params['documentFormattingProvider'] != null
          ? params['documentFormattingProvider']
          : null,
      params.containsKey('documentHighlightProvider') && params['documentHighlightProvider'] != null
          ? params['documentHighlightProvider']
          : null,
      params.containsKey('documentLinkProvider') && params['documentLinkProvider'] != null
          ? DocumentLinkOptions.fromJson(params['documentLinkProvider'])
          : null,
      params.containsKey('documentOnTypeFormattingProvider') &&
              params['documentOnTypeFormattingProvider'] != null
          ? DocumentOnTypeFormattingOptions.fromJson(
              params['documentOnTypeFormattingProvider'])
          : null,
      params.containsKey('documentRangeFormattingProvider') && params['documentRangeFormattingProvider'] != null
          ? params['documentRangeFormattingProvider']
          : null,
      params.containsKey('documentSymbolProvider') && params['documentSymbolProvider'] != null
          ? params['documentSymbolProvider']
          : null,
      params.containsKey('executeCommandProvider') && params['executeCommandProvider'] != null
          ? ExecuteCommandOptions.fromJson(params['executeCommandProvider'])
          : null,
      params.containsKey('hoverProvider') && params['hoverProvider'] != null ? params['hoverProvider'] : null,
      params.containsKey('implementationProvider') && params['implementationProvider'] != null ? params['implementationProvider'] : null,
      params.containsKey('referencesProvider') && params['referencesProvider'] != null ? params['referencesProvider'] : null,
      params.containsKey('renameProvider') && params['renameProvider'] != null ? params['renameProvider'] : null,
      params.containsKey('signatureHelpProvider') && params['signatureHelpProvider'] != null ? SignatureHelpOptions.fromJson(params['signatureHelpProvider']) : null,
      params.containsKey('textDocumentSync') && params['textDocumentSync'] != null ? TextDocumentSyncOptions.fromJson(params['textDocumentSync']) : null,
      params.containsKey('workspaceSymbolProvider') && params['workspaceSymbolProvider'] != null ? params['workspaceSymbolProvider'] : null);

  final bool codeActionProvider;

  final CodeLensOptions codeLensProvider;

  final CompletionOptions completionProvider;

  final bool definitionProvider;

  final bool documentFormattingProvider;

  final bool documentHighlightProvider;

  final DocumentLinkOptions documentLinkProvider;

  final DocumentOnTypeFormattingOptions documentOnTypeFormattingProvider;

  final bool documentRangeFormattingProvider;

  final bool documentSymbolProvider;

  final ExecuteCommandOptions executeCommandProvider;

  final bool hoverProvider;

  final bool implementationProvider;

  final bool referencesProvider;

  final bool renameProvider;

  final SignatureHelpOptions signatureHelpProvider;

  final TextDocumentSyncOptions textDocumentSync;

  final bool workspaceSymbolProvider;

  Map toJson() => {
        'codeActionProvider': codeActionProvider,
        'codeLensProvider': codeLensProvider?.toJson(),
        'completionProvider': completionProvider?.toJson(),
        'definitionProvider': definitionProvider,
        'documentFormattingProvider': documentFormattingProvider,
        'documentHighlightProvider': documentHighlightProvider,
        'documentLinkProvider': documentLinkProvider?.toJson(),
        'documentOnTypeFormattingProvider':
            documentOnTypeFormattingProvider?.toJson(),
        'documentRangeFormattingProvider': documentRangeFormattingProvider,
        'documentSymbolProvider': documentSymbolProvider,
        'executeCommandProvider': executeCommandProvider?.toJson(),
        'hoverProvider': hoverProvider,
        'implementationProvider': implementationProvider,
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
    hash = _hashCombine(hash, _deepHashCode(documentHighlightProvider));
    hash = _hashCombine(hash, _deepHashCode(documentLinkProvider));
    hash = _hashCombine(hash, _deepHashCode(documentOnTypeFormattingProvider));
    hash = _hashCombine(hash, _deepHashCode(documentRangeFormattingProvider));
    hash = _hashCombine(hash, _deepHashCode(documentSymbolProvider));
    hash = _hashCombine(hash, _deepHashCode(executeCommandProvider));
    hash = _hashCombine(hash, _deepHashCode(hoverProvider));
    hash = _hashCombine(hash, _deepHashCode(implementationProvider));
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
    if (documentHighlightProvider != o.documentHighlightProvider) return false;
    if (documentLinkProvider != o.documentLinkProvider) return false;
    if (documentOnTypeFormattingProvider != o.documentOnTypeFormattingProvider)
      return false;
    if (documentRangeFormattingProvider != o.documentRangeFormattingProvider)
      return false;
    if (documentSymbolProvider != o.documentSymbolProvider) return false;
    if (executeCommandProvider != o.executeCommandProvider) return false;
    if (hoverProvider != o.hoverProvider) return false;
    if (implementationProvider != o.implementationProvider) return false;
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

  CodeLensOptions codeLensProvider;

  CompletionOptions completionProvider;

  bool definitionProvider;

  bool documentFormattingProvider;

  bool documentHighlightProvider;

  DocumentLinkOptions documentLinkProvider;

  DocumentOnTypeFormattingOptions documentOnTypeFormattingProvider;

  bool documentRangeFormattingProvider;

  bool documentSymbolProvider;

  ExecuteCommandOptions executeCommandProvider;

  bool hoverProvider;

  bool implementationProvider;

  bool referencesProvider;

  bool renameProvider;

  SignatureHelpOptions signatureHelpProvider;

  TextDocumentSyncOptions textDocumentSync;

  bool workspaceSymbolProvider;
}

class ShowMessageParams {
  ShowMessageParams._(this.message, this.type);

  factory ShowMessageParams(void Function(ShowMessageParams$Builder) init) {
    final b = ShowMessageParams$Builder._();
    init(b);
    return ShowMessageParams._(b.message, b.type);
  }

  factory ShowMessageParams.fromJson(Map params) => ShowMessageParams._(
      params.containsKey('message') && params['message'] != null
          ? params['message']
          : null,
      params.containsKey('type') && params['type'] != null
          ? MessageType.fromJson(params['type'])
          : null);

  final String message;

  final MessageType type;

  Map toJson() => {'message': message, 'type': type?.toJson()};
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(message));
    hash = _hashCombine(hash, _deepHashCode(type));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! ShowMessageParams) return false;
    var o = other as ShowMessageParams;
    if (message != o.message) return false;
    if (type != o.type) return false;
    return true;
  }
}

class ShowMessageParams$Builder {
  ShowMessageParams$Builder._();

  String message;

  MessageType type;
}

class SignatureHelpOptions {
  SignatureHelpOptions._(this.triggerCharacters);

  factory SignatureHelpOptions(
      void Function(SignatureHelpOptions$Builder) init) {
    final b = SignatureHelpOptions$Builder._();
    init(b);
    return SignatureHelpOptions._(b.triggerCharacters);
  }

  factory SignatureHelpOptions.fromJson(Map params) =>
      SignatureHelpOptions._(params.containsKey('triggerCharacters') &&
              params['triggerCharacters'] != null
          ? (params['triggerCharacters'] as List).cast<String>()
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

class SymbolInformation {
  SymbolInformation._(this.containerName, this.kind, this.location, this.name);

  factory SymbolInformation(void Function(SymbolInformation$Builder) init) {
    final b = SymbolInformation$Builder._();
    init(b);
    return SymbolInformation._(b.containerName, b.kind, b.location, b.name);
  }

  factory SymbolInformation.fromJson(Map params) => SymbolInformation._(
      params.containsKey('containerName') && params['containerName'] != null
          ? params['containerName']
          : null,
      params.containsKey('kind') && params['kind'] != null
          ? SymbolKind.fromJson(params['kind'])
          : null,
      params.containsKey('location') && params['location'] != null
          ? Location.fromJson(params['location'])
          : null,
      params.containsKey('name') && params['name'] != null
          ? params['name']
          : null);

  final String containerName;

  final SymbolKind kind;

  final Location location;

  final String name;

  Map toJson() => {
        'containerName': containerName,
        'kind': kind?.toJson(),
        'location': location?.toJson(),
        'name': name
      };
  @override
  int get hashCode {
    var hash = 0;
    hash = _hashCombine(hash, _deepHashCode(containerName));
    hash = _hashCombine(hash, _deepHashCode(kind));
    hash = _hashCombine(hash, _deepHashCode(location));
    hash = _hashCombine(hash, _deepHashCode(name));
    return _hashComplete(hash);
  }

  @override
  bool operator ==(Object other) {
    if (other is! SymbolInformation) return false;
    var o = other as SymbolInformation;
    if (containerName != o.containerName) return false;
    if (kind != o.kind) return false;
    if (location != o.location) return false;
    if (name != o.name) return false;
    return true;
  }
}

class SymbolInformation$Builder {
  SymbolInformation$Builder._();

  String containerName;

  SymbolKind kind;

  Location location;

  String name;
}

class SymbolKind {
  factory SymbolKind.fromJson(int value) {
    const values = {
      18: SymbolKind.array,
      17: SymbolKind.boolean,
      5: SymbolKind.classSymbol,
      14: SymbolKind.constant,
      9: SymbolKind.constructor,
      22: SymbolKind.enumMember,
      10: SymbolKind.enumSymbol,
      24: SymbolKind.event,
      8: SymbolKind.field,
      1: SymbolKind.file,
      12: SymbolKind.function,
      11: SymbolKind.interface,
      20: SymbolKind.key,
      6: SymbolKind.method,
      2: SymbolKind.module,
      3: SymbolKind.namespace,
      21: SymbolKind.nullSymbol,
      16: SymbolKind.number,
      19: SymbolKind.object,
      25: SymbolKind.operator,
      4: SymbolKind.package,
      7: SymbolKind.property,
      15: SymbolKind.string,
      23: SymbolKind.struct,
      26: SymbolKind.typeParameter,
      13: SymbolKind.variable
    };
    return values[value];
  }

  const SymbolKind._(this._value);

  static const array = SymbolKind._(18);

  static const boolean = SymbolKind._(17);

  static const classSymbol = SymbolKind._(5);

  static const constant = SymbolKind._(14);

  static const constructor = SymbolKind._(9);

  static const enumMember = SymbolKind._(22);

  static const enumSymbol = SymbolKind._(10);

  static const event = SymbolKind._(24);

  static const field = SymbolKind._(8);

  static const file = SymbolKind._(1);

  static const function = SymbolKind._(12);

  static const interface = SymbolKind._(11);

  static const key = SymbolKind._(20);

  static const method = SymbolKind._(6);

  static const module = SymbolKind._(2);

  static const namespace = SymbolKind._(3);

  static const nullSymbol = SymbolKind._(21);

  static const number = SymbolKind._(16);

  static const object = SymbolKind._(19);

  static const operator = SymbolKind._(25);

  static const package = SymbolKind._(4);

  static const property = SymbolKind._(7);

  static const string = SymbolKind._(15);

  static const struct = SymbolKind._(23);

  static const typeParameter = SymbolKind._(26);

  static const variable = SymbolKind._(13);

  final int _value;

  int toJson() => _value;
}

class SynchronizationCapabilities {
  SynchronizationCapabilities._(this.didSave, this.dynamicRegistration,
      this.willSave, this.willSaveWaitUntil);

  factory SynchronizationCapabilities(
      void Function(SynchronizationCapabilities$Builder) init) {
    final b = SynchronizationCapabilities$Builder._();
    init(b);
    return SynchronizationCapabilities._(
        b.didSave, b.dynamicRegistration, b.willSave, b.willSaveWaitUntil);
  }

  factory SynchronizationCapabilities.fromJson(
          Map params) =>
      SynchronizationCapabilities._(
          params.containsKey('didSave') && params['didSave'] != null
              ? params['didSave']
              : null,
          params.containsKey('dynamicRegistration') &&
                  params['dynamicRegistration'] != null
              ? params['dynamicRegistration']
              : null,
          params.containsKey('willSave') && params['willSave'] != null
              ? params['willSave']
              : null,
          params.containsKey('willSaveWaitUntil') &&
                  params['willSaveWaitUntil'] != null
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
      void Function(TextDocumentClientCapabilities$Builder) init) {
    final b = TextDocumentClientCapabilities$Builder._();
    init(b);
    return TextDocumentClientCapabilities._(
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
      TextDocumentClientCapabilities._(
          params.containsKey('codeAction') && params['codeAction'] != null
              ? CodeActionCapabilities.fromJson(params['codeAction'])
              : null,
          params.containsKey('codeLens') && params['codeLens'] != null
              ? DynamicRegistrationCapability.fromJson(params['codeLens'])
              : null,
          params.containsKey('completion') && params['completion'] != null
              ? CompletionCapabilities.fromJson(params['completion'])
              : null,
          params.containsKey('definition') && params['definition'] != null
              ? DynamicRegistrationCapability.fromJson(params['definition'])
              : null,
          params.containsKey('documentHighlight') &&
                  params['documentHighlight'] != null
              ? DynamicRegistrationCapability.fromJson(
                  params['documentHighlight'])
              : null,
          params.containsKey('documentLink') && params['documentLink'] != null
              ? DynamicRegistrationCapability.fromJson(params['documentLink'])
              : null,
          params.containsKey('documentSymbol') &&
                  params['documentSymbol'] != null
              ? DynamicRegistrationCapability.fromJson(params['documentSymbol'])
              : null,
          params.containsKey('formatting') && params['formatting'] != null
              ? DynamicRegistrationCapability.fromJson(params['formatting'])
              : null,
          params.containsKey('hover') && params['hover'] != null
              ? HoverCapabilities.fromJson(params['hover'])
              : null,
          params.containsKey('onTypeFormatting') &&
                  params['onTypeFormatting'] != null
              ? DynamicRegistrationCapability.fromJson(
                  params['onTypeFormatting'])
              : null,
          params.containsKey('references') && params['references'] != null
              ? DynamicRegistrationCapability.fromJson(params['references'])
              : null,
          params.containsKey('rename') && params['rename'] != null
              ? DynamicRegistrationCapability.fromJson(params['rename'])
              : null,
          params.containsKey('synchronization') &&
                  params['synchronization'] != null
              ? SynchronizationCapabilities.fromJson(params['synchronization'])
              : null);

  final CodeActionCapabilities codeAction;

  final DynamicRegistrationCapability codeLens;

  final CompletionCapabilities completion;

  final DynamicRegistrationCapability definition;

  final DynamicRegistrationCapability documentHighlight;

  final DynamicRegistrationCapability documentLink;

  final DynamicRegistrationCapability documentSymbol;

  final DynamicRegistrationCapability formatting;

  final HoverCapabilities hover;

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

  CodeActionCapabilities codeAction;

  DynamicRegistrationCapability codeLens;

  CompletionCapabilities completion;

  DynamicRegistrationCapability definition;

  DynamicRegistrationCapability documentHighlight;

  DynamicRegistrationCapability documentLink;

  DynamicRegistrationCapability documentSymbol;

  DynamicRegistrationCapability formatting;

  HoverCapabilities hover;

  DynamicRegistrationCapability onTypeFormatting;

  DynamicRegistrationCapability references;

  DynamicRegistrationCapability rename;

  SynchronizationCapabilities synchronization;
}

class TextDocumentContentChangeEvent {
  TextDocumentContentChangeEvent._(this.range, this.rangeLength, this.text);

  factory TextDocumentContentChangeEvent(
      void Function(TextDocumentContentChangeEvent$Builder) init) {
    final b = TextDocumentContentChangeEvent$Builder._();
    init(b);
    return TextDocumentContentChangeEvent._(b.range, b.rangeLength, b.text);
  }

  factory TextDocumentContentChangeEvent.fromJson(Map params) =>
      TextDocumentContentChangeEvent._(
          params.containsKey('range') && params['range'] != null
              ? Range.fromJson(params['range'])
              : null,
          params.containsKey('rangeLength') && params['rangeLength'] != null
              ? params['rangeLength']
              : null,
          params.containsKey('text') && params['text'] != null
              ? params['text']
              : null);

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

  factory TextDocumentIdentifier(
      void Function(TextDocumentIdentifier$Builder) init) {
    final b = TextDocumentIdentifier$Builder._();
    init(b);
    return TextDocumentIdentifier._(b.uri);
  }

  factory TextDocumentIdentifier.fromJson(Map params) =>
      TextDocumentIdentifier._(
          params.containsKey('uri') && params['uri'] != null
              ? params['uri']
              : null);

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

  factory TextDocumentItem(void Function(TextDocumentItem$Builder) init) {
    final b = TextDocumentItem$Builder._();
    init(b);
    return TextDocumentItem._(b.languageId, b.text, b.uri, b.version);
  }

  factory TextDocumentItem.fromJson(Map params) => TextDocumentItem._(
      params.containsKey('languageId') && params['languageId'] != null
          ? params['languageId']
          : null,
      params.containsKey('text') && params['text'] != null
          ? params['text']
          : null,
      params.containsKey('uri') && params['uri'] != null ? params['uri'] : null,
      params.containsKey('version') && params['version'] != null
          ? params['version']
          : null);

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
    const values = {
      1: TextDocumentSyncKind.full,
      2: TextDocumentSyncKind.incremental,
      0: TextDocumentSyncKind.none
    };
    return values[value];
  }

  const TextDocumentSyncKind._(this._value);

  static const full = TextDocumentSyncKind._(1);

  static const incremental = TextDocumentSyncKind._(2);

  static const none = TextDocumentSyncKind._(0);

  final int _value;

  int toJson() => _value;
}

class TextDocumentSyncOptions {
  TextDocumentSyncOptions._(this.change, this.openClose, this.save,
      this.willSave, this.willSaveWaitUntil);

  factory TextDocumentSyncOptions(
      void Function(TextDocumentSyncOptions$Builder) init) {
    final b = TextDocumentSyncOptions$Builder._();
    init(b);
    return TextDocumentSyncOptions._(
        b.change, b.openClose, b.save, b.willSave, b.willSaveWaitUntil);
  }

  factory TextDocumentSyncOptions.fromJson(
          Map params) =>
      TextDocumentSyncOptions._(
          params.containsKey('change') && params['change'] != null
              ? TextDocumentSyncKind.fromJson(params['change'])
              : null,
          params.containsKey('openClose') && params['openClose'] != null
              ? params['openClose']
              : null,
          params.containsKey('save') && params['save'] != null
              ? SaveOptions.fromJson(params['save'])
              : null,
          params.containsKey('willSave') && params['willSave'] != null
              ? params['willSave']
              : null,
          params.containsKey('willSaveWaitUntil') &&
                  params['willSaveWaitUntil'] != null
              ? params['willSaveWaitUntil']
              : null);

  final TextDocumentSyncKind change;

  final bool openClose;

  final SaveOptions save;

  final bool willSave;

  final bool willSaveWaitUntil;

  Map toJson() => {
        'change': change?.toJson(),
        'openClose': openClose,
        'save': save?.toJson(),
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

  SaveOptions save;

  bool willSave;

  bool willSaveWaitUntil;
}

class TextEdit {
  TextEdit._(this.newText, this.range);

  factory TextEdit(void Function(TextEdit$Builder) init) {
    final b = TextEdit$Builder._();
    init(b);
    return TextEdit._(b.newText, b.range);
  }

  factory TextEdit.fromJson(Map params) => TextEdit._(
      params.containsKey('newText') && params['newText'] != null
          ? params['newText']
          : null,
      params.containsKey('range') && params['range'] != null
          ? Range.fromJson(params['range'])
          : null);

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
      void Function(VersionedTextDocumentIdentifier$Builder) init) {
    final b = VersionedTextDocumentIdentifier$Builder._();
    init(b);
    return VersionedTextDocumentIdentifier._(b.uri, b.version);
  }

  factory VersionedTextDocumentIdentifier.fromJson(Map params) =>
      VersionedTextDocumentIdentifier._(
          params.containsKey('uri') && params['uri'] != null
              ? params['uri']
              : null,
          params.containsKey('version') && params['version'] != null
              ? params['version']
              : null);

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
      void Function(WorkspaceClientCapabilities$Builder) init) {
    final b = WorkspaceClientCapabilities$Builder._();
    init(b);
    return WorkspaceClientCapabilities._(b.applyEdit, b.didChangeConfiguration,
        b.didChangeWatchedFiles, b.executeCommand, b.symbol);
  }

  factory WorkspaceClientCapabilities.fromJson(
          Map params) =>
      WorkspaceClientCapabilities._(
          params.containsKey('applyEdit') && params['applyEdit'] != null
              ? params['applyEdit']
              : null,
          params.containsKey('didChangeConfiguration') &&
                  params['didChangeConfiguration'] != null
              ? DynamicRegistrationCapability.fromJson(
                  params['didChangeConfiguration'])
              : null,
          params.containsKey('didChangeWatchedFiles') &&
                  params['didChangeWatchedFiles'] != null
              ? DynamicRegistrationCapability.fromJson(
                  params['didChangeWatchedFiles'])
              : null,
          params.containsKey('executeCommand') &&
                  params['executeCommand'] != null
              ? DynamicRegistrationCapability.fromJson(params['executeCommand'])
              : null,
          params.containsKey('symbol') && params['symbol'] != null
              ? DynamicRegistrationCapability.fromJson(params['symbol'])
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

  factory WorkspaceEdit(void Function(WorkspaceEdit$Builder) init) {
    final b = WorkspaceEdit$Builder._();
    init(b);
    return WorkspaceEdit._(b.changes);
  }

  factory WorkspaceEdit.fromJson(Map params) =>
      WorkspaceEdit._(params.containsKey('changes') && params['changes'] != null
          ? (params['changes'] as Map).map((k, v) =>
              MapEntry<String, List<TextEdit>>(
                  k, (v as List).map((v) => TextEdit.fromJson(v)).toList()))
          : null);

  final Map<String, List<TextEdit>> changes;

  Map toJson() => {
        'changes': changes?.map((k, v) =>
            MapEntry<String, dynamic>(k, v?.map((v) => v?.toJson())?.toList()))
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
