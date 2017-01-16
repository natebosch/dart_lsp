class AnalysisErrors {
  final List<AnalysisError> errors;
  final String file;

  AnalysisErrors._(this.errors, this.file);
  factory AnalysisErrors(void init(AnalysisErrors$Builder b)) {
    var b = new AnalysisErrors$Builder._();
    init(b);
    return new AnalysisErrors._(b.errors, b.file);
  }

  factory AnalysisErrors.fromJson(Map params) => new AnalysisErrors._(
      params.containsKey("errors")
          ? params["errors"].map((v) => new AnalysisError.fromJson(v)).toList()
          : null,
      params.containsKey("file") ? params["file"] : null);

  Map toJson() =>
      {"errors": errors.map((v) => v.toJson()).toList(), "file": file};

  @override
  bool operator ==(Object other) {
    if (other is! AnalysisErrors) return false;
    var o = other as AnalysisErrors;
    if (errors != o.errors) return false;
    if (file != o.file) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [errors, file]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class AnalysisErrors$Builder {
  List<AnalysisError> errors;
  String file;

  AnalysisErrors$Builder._();
}

class SourceEdit {
  final int length;
  final String id;
  final String replacement;
  final int offset;

  SourceEdit._(this.length, this.id, this.replacement, this.offset);
  factory SourceEdit(void init(SourceEdit$Builder b)) {
    var b = new SourceEdit$Builder._();
    init(b);
    return new SourceEdit._(b.length, b.id, b.replacement, b.offset);
  }

  factory SourceEdit.fromJson(Map params) => new SourceEdit._(
      params.containsKey("length") ? params["length"] : null,
      params.containsKey("id") ? params["id"] : null,
      params.containsKey("replacement") ? params["replacement"] : null,
      params.containsKey("offset") ? params["offset"] : null);

  Map toJson() => {
        "length": length,
        "id": id,
        "replacement": replacement,
        "offset": offset
      };

  @override
  bool operator ==(Object other) {
    if (other is! SourceEdit) return false;
    var o = other as SourceEdit;
    if (length != o.length) return false;
    if (id != o.id) return false;
    if (replacement != o.replacement) return false;
    if (offset != o.offset) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [length, id, replacement, offset]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class SourceEdit$Builder {
  int length;
  String id;
  String replacement;
  int offset;

  SourceEdit$Builder._();
}

class AnalysisErrorSeverity {
  static const info = const AnalysisErrorSeverity._("INFO");
  static const error = const AnalysisErrorSeverity._("ERROR");
  static const warning = const AnalysisErrorSeverity._("WARNING");
  final String value;
  const AnalysisErrorSeverity._(this.value);
  factory AnalysisErrorSeverity.fromJson(String value) {
    const values = const {
      "INFO": AnalysisErrorSeverity.info,
      "ERROR": AnalysisErrorSeverity.error,
      "WARNING": AnalysisErrorSeverity.warning
    };
    return values[value];
  }
  String toJson() => value;
}

class Location {
  final int length;
  final String file;
  final int startLine;
  final int startColumn;
  final int offset;

  Location._(
      this.length, this.file, this.startLine, this.startColumn, this.offset);
  factory Location(void init(Location$Builder b)) {
    var b = new Location$Builder._();
    init(b);
    return new Location._(
        b.length, b.file, b.startLine, b.startColumn, b.offset);
  }

  factory Location.fromJson(Map params) => new Location._(
      params.containsKey("length") ? params["length"] : null,
      params.containsKey("file") ? params["file"] : null,
      params.containsKey("startLine") ? params["startLine"] : null,
      params.containsKey("startColumn") ? params["startColumn"] : null,
      params.containsKey("offset") ? params["offset"] : null);

  Map toJson() => {
        "length": length,
        "file": file,
        "startLine": startLine,
        "startColumn": startColumn,
        "offset": offset
      };

  @override
  bool operator ==(Object other) {
    if (other is! Location) return false;
    var o = other as Location;
    if (length != o.length) return false;
    if (file != o.file) return false;
    if (startLine != o.startLine) return false;
    if (startColumn != o.startColumn) return false;
    if (offset != o.offset) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [length, file, startLine, startColumn, offset]) {
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
  int length;
  String file;
  int startLine;
  int startColumn;
  int offset;

  Location$Builder._();
}

abstract class ContentOverlayUpdate {
  factory ContentOverlayUpdate.fromJson(Map params) {
    var selectBy = params["type"];
    if (selectBy == "change") return new ChangeContentOverlay.fromJson(params);
    if (selectBy == "add") return new AddContentOverlay.fromJson(params);
    if (selectBy == "remove") return new RemoveContentOverlay.fromJson(params);

    throw new ArgumentError(
        'Could not match ContentOverlayUpdate for $selectBy');
  }
  Map toJson();
}

class ChangeContentOverlay implements ContentOverlayUpdate {
  final type = "change";
  final List<SourceEdit> edits;

  ChangeContentOverlay._(this.edits);
  factory ChangeContentOverlay(void init(ChangeContentOverlay$Builder b)) {
    var b = new ChangeContentOverlay$Builder._();
    init(b);
    return new ChangeContentOverlay._(b.edits);
  }

  factory ChangeContentOverlay.fromJson(Map params) =>
      new ChangeContentOverlay._(params.containsKey("edits")
          ? params["edits"].map((v) => new SourceEdit.fromJson(v)).toList()
          : null);

  Map toJson() =>
      {"type": "change", "edits": edits.map((v) => v.toJson()).toList()};

  @override
  bool operator ==(Object other) {
    if (other is! ChangeContentOverlay) return false;
    var o = other as ChangeContentOverlay;
    if (edits != o.edits) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [edits]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class ChangeContentOverlay$Builder {
  List<SourceEdit> edits;

  ChangeContentOverlay$Builder._();
}

class AddContentOverlay implements ContentOverlayUpdate {
  final type = "add";
  final String content;

  AddContentOverlay._(this.content);
  factory AddContentOverlay(void init(AddContentOverlay$Builder b)) {
    var b = new AddContentOverlay$Builder._();
    init(b);
    return new AddContentOverlay._(b.content);
  }

  factory AddContentOverlay.fromJson(Map params) => new AddContentOverlay._(
      params.containsKey("content") ? params["content"] : null);

  Map toJson() => {"type": "add", "content": content};

  @override
  bool operator ==(Object other) {
    if (other is! AddContentOverlay) return false;
    var o = other as AddContentOverlay;
    if (content != o.content) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [content]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class AddContentOverlay$Builder {
  String content;

  AddContentOverlay$Builder._();
}

class RemoveContentOverlay implements ContentOverlayUpdate {
  final type = "remove";

  const RemoveContentOverlay();
  const RemoveContentOverlay.fromJson([_]);

  Map toJson() => {
        "type": "remove",
      };

  @override
  bool operator ==(Object other) => other is RemoveContentOverlay;

  @override
  int get hashCode {
    int hash = 0;
    for (var field in []) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class RemoveContentOverlay$Builder {
  RemoveContentOverlay$Builder._();
}

class AnalysisErrorType {
  static const staticWarning = const AnalysisErrorType._("STATIC_WARNING");
  static const lint = const AnalysisErrorType._("LINT");
  static const syntacticError = const AnalysisErrorType._("SYNTACTIC_ERROR");
  static const checkedModeCompileTimeError =
      const AnalysisErrorType._("CHECKED_MODE_COMPILE_TIME_ERROR");
  static const compileTimeError =
      const AnalysisErrorType._("COMPILE_TYPE_ERROR");
  static const staticTypeWarning =
      const AnalysisErrorType._("STATIC_TYPE_WARNING");
  static const hint = const AnalysisErrorType._("HINT");
  static const todo = const AnalysisErrorType._("TODO");
  final String value;
  const AnalysisErrorType._(this.value);
  factory AnalysisErrorType.fromJson(String value) {
    const values = const {
      "STATIC_WARNING": AnalysisErrorType.staticWarning,
      "LINT": AnalysisErrorType.lint,
      "SYNTACTIC_ERROR": AnalysisErrorType.syntacticError,
      "CHECKED_MODE_COMPILE_TIME_ERROR":
          AnalysisErrorType.checkedModeCompileTimeError,
      "COMPILE_TYPE_ERROR": AnalysisErrorType.compileTimeError,
      "STATIC_TYPE_WARNING": AnalysisErrorType.staticTypeWarning,
      "HINT": AnalysisErrorType.hint,
      "TODO": AnalysisErrorType.todo
    };
    return values[value];
  }
  String toJson() => value;
}

class AnalysisError {
  final Location location;
  final String message;
  final String correction;
  final AnalysisErrorType type;
  final bool hasFix;
  final AnalysisErrorSeverity severity;
  final String code;

  AnalysisError._(this.location, this.message, this.correction, this.type,
      this.hasFix, this.severity, this.code);
  factory AnalysisError(void init(AnalysisError$Builder b)) {
    var b = new AnalysisError$Builder._();
    init(b);
    return new AnalysisError._(b.location, b.message, b.correction, b.type,
        b.hasFix, b.severity, b.code);
  }

  factory AnalysisError.fromJson(Map params) => new AnalysisError._(
      params.containsKey("location")
          ? new Location.fromJson(params["location"])
          : null,
      params.containsKey("message") ? params["message"] : null,
      params.containsKey("correction") ? params["correction"] : null,
      params.containsKey("type")
          ? new AnalysisErrorType.fromJson(params["type"])
          : null,
      params.containsKey("hasFix") ? params["hasFix"] : null,
      params.containsKey("severity")
          ? new AnalysisErrorSeverity.fromJson(params["severity"])
          : null,
      params.containsKey("code") ? params["code"] : null);

  Map toJson() => {
        "location": location.toJson(),
        "message": message,
        "correction": correction,
        "type": type.toJson(),
        "hasFix": hasFix,
        "severity": severity.toJson(),
        "code": code
      };

  @override
  bool operator ==(Object other) {
    if (other is! AnalysisError) return false;
    var o = other as AnalysisError;
    if (location != o.location) return false;
    if (message != o.message) return false;
    if (correction != o.correction) return false;
    if (type != o.type) return false;
    if (hasFix != o.hasFix) return false;
    if (severity != o.severity) return false;
    if (code != o.code) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [
      location,
      message,
      correction,
      type,
      hasFix,
      severity,
      code
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

class AnalysisError$Builder {
  Location location;
  String message;
  String correction;
  AnalysisErrorType type;
  bool hasFix;
  AnalysisErrorSeverity severity;
  String code;

  AnalysisError$Builder._();
}
