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
