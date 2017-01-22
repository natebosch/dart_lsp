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

  Map toJson() => {"newText": newText, "range": range.toJson()};

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
        "items": items.map((v) => v.toJson()).toList(),
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
        "range": range.toJson(),
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
        "textEdit": textEdit.toJson(),
        "sortText": sortText,
        "data": data,
        "filterText": filterText,
        "detail": detail,
        "kind": kind.toJson(),
        "additionalTextEdits":
            additionalTextEdits.map((v) => v.toJson()).toList(),
        "documentation": documentation,
        "label": label,
        "insertText": insertText,
        "command": command.toJson(),
        "insertTextFormat": insertTextFormat.toJson()
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
      {"rangeLength": rangeLength, "text": text, "range": range.toJson()};

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

  Map toJson() =>
      {"diagnostics": diagnostics.map((v) => v.toJson()).toList(), "uri": uri};

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

  Map toJson() => {"end": end.toJson(), "start": start.toJson()};

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

class TextDocumentPositionParams {
  final Position position;
  final TextDocumentIdentifier textDocument;

  TextDocumentPositionParams._(this.position, this.textDocument);
  factory TextDocumentPositionParams(
      void init(TextDocumentPositionParams$Builder b)) {
    var b = new TextDocumentPositionParams$Builder._();
    init(b);
    return new TextDocumentPositionParams._(b.position, b.textDocument);
  }

  factory TextDocumentPositionParams.fromJson(Map params) =>
      new TextDocumentPositionParams._(
          params.containsKey("position")
              ? new Position.fromJson(params["position"])
              : null,
          params.containsKey("textDocument")
              ? new TextDocumentIdentifier.fromJson(params["textDocument"])
              : null);

  Map toJson() =>
      {"position": position.toJson(), "textDocument": textDocument.toJson()};

  @override
  bool operator ==(Object other) {
    if (other is! TextDocumentPositionParams) return false;
    var o = other as TextDocumentPositionParams;
    if (position != o.position) return false;
    if (textDocument != o.textDocument) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [position, textDocument]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class TextDocumentPositionParams$Builder {
  Position position;
  TextDocumentIdentifier textDocument;

  TextDocumentPositionParams$Builder._();
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
