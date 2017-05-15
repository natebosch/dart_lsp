class AnalysisError {
  final String code;
  final String correction;
  final bool hasFix;
  final Location location;
  final String message;
  final AnalysisErrorSeverity severity;
  final AnalysisErrorType type;

  AnalysisError._(this.code, this.correction, this.hasFix, this.location,
      this.message, this.severity, this.type);
  factory AnalysisError(void init(AnalysisError$Builder b)) {
    var b = new AnalysisError$Builder._();
    init(b);
    return new AnalysisError._(b.code, b.correction, b.hasFix, b.location,
        b.message, b.severity, b.type);
  }

  factory AnalysisError.fromJson(Map params) => new AnalysisError._(
      params.containsKey("code") ? params["code"] : null,
      params.containsKey("correction") ? params["correction"] : null,
      params.containsKey("hasFix") ? params["hasFix"] : null,
      params.containsKey("location")
          ? new Location.fromJson(params["location"])
          : null,
      params.containsKey("message") ? params["message"] : null,
      params.containsKey("severity")
          ? new AnalysisErrorSeverity.fromJson(params["severity"])
          : null,
      params.containsKey("type")
          ? new AnalysisErrorType.fromJson(params["type"])
          : null);

  Map toJson() => {
        "code": code,
        "correction": correction,
        "hasFix": hasFix,
        "location": location?.toJson(),
        "message": message,
        "severity": severity?.toJson(),
        "type": type?.toJson()
      };

  @override
  bool operator ==(Object other) {
    if (other is! AnalysisError) return false;
    var o = other as AnalysisError;
    if (code != o.code) return false;
    if (correction != o.correction) return false;
    if (hasFix != o.hasFix) return false;
    if (location != o.location) return false;
    if (message != o.message) return false;
    if (severity != o.severity) return false;
    if (type != o.type) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [
      code,
      correction,
      hasFix,
      location,
      message,
      severity,
      type
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
  String code;
  String correction;
  bool hasFix;
  Location location;
  String message;
  AnalysisErrorSeverity severity;
  AnalysisErrorType type;

  AnalysisError$Builder._();
}

class AnalysisErrorSeverity {
  static const error = const AnalysisErrorSeverity._("ERROR");
  static const info = const AnalysisErrorSeverity._("INFO");
  static const warning = const AnalysisErrorSeverity._("WARNING");
  final String _value;
  const AnalysisErrorSeverity._(this._value);
  factory AnalysisErrorSeverity.fromJson(String value) {
    const values = const {
      "ERROR": AnalysisErrorSeverity.error,
      "INFO": AnalysisErrorSeverity.info,
      "WARNING": AnalysisErrorSeverity.warning
    };
    return values[value];
  }
  String toJson() => _value;
}

class AnalysisErrorType {
  static const checkedModeCompileTimeError =
      const AnalysisErrorType._("CHECKED_MODE_COMPILE_TIME_ERROR");
  static const compileTimeError =
      const AnalysisErrorType._("COMPILE_TYPE_ERROR");
  static const hint = const AnalysisErrorType._("HINT");
  static const lint = const AnalysisErrorType._("LINT");
  static const staticTypeWarning =
      const AnalysisErrorType._("STATIC_TYPE_WARNING");
  static const staticWarning = const AnalysisErrorType._("STATIC_WARNING");
  static const syntacticError = const AnalysisErrorType._("SYNTACTIC_ERROR");
  static const todo = const AnalysisErrorType._("TODO");
  final String _value;
  const AnalysisErrorType._(this._value);
  factory AnalysisErrorType.fromJson(String value) {
    const values = const {
      "CHECKED_MODE_COMPILE_TIME_ERROR":
          AnalysisErrorType.checkedModeCompileTimeError,
      "COMPILE_TYPE_ERROR": AnalysisErrorType.compileTimeError,
      "HINT": AnalysisErrorType.hint,
      "LINT": AnalysisErrorType.lint,
      "STATIC_TYPE_WARNING": AnalysisErrorType.staticTypeWarning,
      "STATIC_WARNING": AnalysisErrorType.staticWarning,
      "SYNTACTIC_ERROR": AnalysisErrorType.syntacticError,
      "TODO": AnalysisErrorType.todo
    };
    return values[value];
  }
  String toJson() => _value;
}

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
      {"errors": errors?.map((v) => v?.toJson())?.toList(), "file": file};

  @override
  bool operator ==(Object other) {
    if (other is! AnalysisErrors) return false;
    var o = other as AnalysisErrors;
    if (!_deepEquals(errors, o.errors)) return false;
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

class CompletionResults {
  final String id;
  final bool isLast;
  final int replacementLength;
  final int replacementOffset;
  final List<CompletionSuggestion> results;

  CompletionResults._(this.id, this.isLast, this.replacementLength,
      this.replacementOffset, this.results);
  factory CompletionResults(void init(CompletionResults$Builder b)) {
    var b = new CompletionResults$Builder._();
    init(b);
    return new CompletionResults._(
        b.id, b.isLast, b.replacementLength, b.replacementOffset, b.results);
  }

  factory CompletionResults.fromJson(Map params) => new CompletionResults._(
      params.containsKey("id") ? params["id"] : null,
      params.containsKey("isLast") ? params["isLast"] : null,
      params.containsKey("replacementLength")
          ? params["replacementLength"]
          : null,
      params.containsKey("replacementOffset")
          ? params["replacementOffset"]
          : null,
      params.containsKey("results")
          ? params["results"]
              .map((v) => new CompletionSuggestion.fromJson(v))
              .toList()
          : null);

  Map toJson() => {
        "id": id,
        "isLast": isLast,
        "replacementLength": replacementLength,
        "replacementOffset": replacementOffset,
        "results": results?.map((v) => v?.toJson())?.toList()
      };

  @override
  bool operator ==(Object other) {
    if (other is! CompletionResults) return false;
    var o = other as CompletionResults;
    if (id != o.id) return false;
    if (isLast != o.isLast) return false;
    if (replacementLength != o.replacementLength) return false;
    if (replacementOffset != o.replacementOffset) return false;
    if (!_deepEquals(results, o.results)) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [
      id,
      isLast,
      replacementLength,
      replacementOffset,
      results
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

class CompletionResults$Builder {
  String id;
  bool isLast;
  int replacementLength;
  int replacementOffset;
  List<CompletionSuggestion> results;

  CompletionResults$Builder._();
}

class CompletionSuggestion {
  final String completion;
  final String declaringType;
  final String docComplete;
  final String docSummary;
  final Element element;
  final bool hasNamedParameters;
  final String importUri;
  final bool isDeprecated;
  final bool isPotential;
  final CompletionSuggestionKind kind;
  final String parameterName;
  final List<String> parameterNames;
  final String parameterType;
  final List<String> parameterTypes;
  final int relevance;
  final int requiredParameterCount;
  final String returnType;
  final int selectionLength;
  final int selectionOffset;

  CompletionSuggestion._(
      this.completion,
      this.declaringType,
      this.docComplete,
      this.docSummary,
      this.element,
      this.hasNamedParameters,
      this.importUri,
      this.isDeprecated,
      this.isPotential,
      this.kind,
      this.parameterName,
      this.parameterNames,
      this.parameterType,
      this.parameterTypes,
      this.relevance,
      this.requiredParameterCount,
      this.returnType,
      this.selectionLength,
      this.selectionOffset);
  factory CompletionSuggestion(void init(CompletionSuggestion$Builder b)) {
    var b = new CompletionSuggestion$Builder._();
    init(b);
    return new CompletionSuggestion._(
        b.completion,
        b.declaringType,
        b.docComplete,
        b.docSummary,
        b.element,
        b.hasNamedParameters,
        b.importUri,
        b.isDeprecated,
        b.isPotential,
        b.kind,
        b.parameterName,
        b.parameterNames,
        b.parameterType,
        b.parameterTypes,
        b.relevance,
        b.requiredParameterCount,
        b.returnType,
        b.selectionLength,
        b.selectionOffset);
  }

  factory CompletionSuggestion.fromJson(Map params) => new CompletionSuggestion
          ._(
      params.containsKey("completion") ? params["completion"] : null,
      params.containsKey("declaringType") ? params["declaringType"] : null,
      params.containsKey("docComplete") ? params["docComplete"] : null,
      params.containsKey("docSummary") ? params["docSummary"] : null,
      params.containsKey("element")
          ? new Element.fromJson(params["element"])
          : null,
      params.containsKey("hasNamedParameters")
          ? params["hasNamedParameters"]
          : null,
      params.containsKey("importUri") ? params["importUri"] : null,
      params.containsKey("isDeprecated") ? params["isDeprecated"] : null,
      params.containsKey("isPotential") ? params["isPotential"] : null,
      params.containsKey("kind")
          ? new CompletionSuggestionKind.fromJson(params["kind"])
          : null,
      params.containsKey("parameterName") ? params["parameterName"] : null,
      params.containsKey("parameterNames") ? params["parameterNames"] : null,
      params.containsKey("parameterType") ? params["parameterType"] : null,
      params.containsKey("parameterTypes") ? params["parameterTypes"] : null,
      params.containsKey("relevance") ? params["relevance"] : null,
      params.containsKey("requiredParameterCount")
          ? params["requiredParameterCount"]
          : null,
      params.containsKey("returnType") ? params["returnType"] : null,
      params.containsKey("selectionLength") ? params["selectionLength"] : null,
      params.containsKey("selectionOffset") ? params["selectionOffset"] : null);

  Map toJson() => {
        "completion": completion,
        "declaringType": declaringType,
        "docComplete": docComplete,
        "docSummary": docSummary,
        "element": element?.toJson(),
        "hasNamedParameters": hasNamedParameters,
        "importUri": importUri,
        "isDeprecated": isDeprecated,
        "isPotential": isPotential,
        "kind": kind?.toJson(),
        "parameterName": parameterName,
        "parameterNames": parameterNames,
        "parameterType": parameterType,
        "parameterTypes": parameterTypes,
        "relevance": relevance,
        "requiredParameterCount": requiredParameterCount,
        "returnType": returnType,
        "selectionLength": selectionLength,
        "selectionOffset": selectionOffset
      };

  @override
  bool operator ==(Object other) {
    if (other is! CompletionSuggestion) return false;
    var o = other as CompletionSuggestion;
    if (completion != o.completion) return false;
    if (declaringType != o.declaringType) return false;
    if (docComplete != o.docComplete) return false;
    if (docSummary != o.docSummary) return false;
    if (element != o.element) return false;
    if (hasNamedParameters != o.hasNamedParameters) return false;
    if (importUri != o.importUri) return false;
    if (isDeprecated != o.isDeprecated) return false;
    if (isPotential != o.isPotential) return false;
    if (kind != o.kind) return false;
    if (parameterName != o.parameterName) return false;
    if (!_deepEquals(parameterNames, o.parameterNames)) return false;
    if (parameterType != o.parameterType) return false;
    if (!_deepEquals(parameterTypes, o.parameterTypes)) return false;
    if (relevance != o.relevance) return false;
    if (requiredParameterCount != o.requiredParameterCount) return false;
    if (returnType != o.returnType) return false;
    if (selectionLength != o.selectionLength) return false;
    if (selectionOffset != o.selectionOffset) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [
      completion,
      declaringType,
      docComplete,
      docSummary,
      element,
      hasNamedParameters,
      importUri,
      isDeprecated,
      isPotential,
      kind,
      parameterName,
      parameterNames,
      parameterType,
      parameterTypes,
      relevance,
      requiredParameterCount,
      returnType,
      selectionLength,
      selectionOffset
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

class CompletionSuggestion$Builder {
  String completion;
  String declaringType;
  String docComplete;
  String docSummary;
  Element element;
  bool hasNamedParameters;
  String importUri;
  bool isDeprecated;
  bool isPotential;
  CompletionSuggestionKind kind;
  String parameterName;
  List<String> parameterNames;
  String parameterType;
  List<String> parameterTypes;
  int relevance;
  int requiredParameterCount;
  String returnType;
  int selectionLength;
  int selectionOffset;

  CompletionSuggestion$Builder._();
}

class CompletionSuggestionKind {
  static const argumentList = const CompletionSuggestionKind._("ARGUMENT_LIST");
  static const identifier = const CompletionSuggestionKind._("IDENTIFIER");
  static const import = const CompletionSuggestionKind._("IMPORT");
  static const invocation = const CompletionSuggestionKind._("INVOCATION");
  static const keyword = const CompletionSuggestionKind._("KEYWORD");
  static const namedArgument =
      const CompletionSuggestionKind._("NAMED_ARGUMENT");
  static const optionalArgument =
      const CompletionSuggestionKind._("OPTIONAL_ARGUMENT");
  static const parameter = const CompletionSuggestionKind._("PARAMETER");
  final String _value;
  const CompletionSuggestionKind._(this._value);
  factory CompletionSuggestionKind.fromJson(String value) {
    const values = const {
      "ARGUMENT_LIST": CompletionSuggestionKind.argumentList,
      "IDENTIFIER": CompletionSuggestionKind.identifier,
      "IMPORT": CompletionSuggestionKind.import,
      "INVOCATION": CompletionSuggestionKind.invocation,
      "KEYWORD": CompletionSuggestionKind.keyword,
      "NAMED_ARGUMENT": CompletionSuggestionKind.namedArgument,
      "OPTIONAL_ARGUMENT": CompletionSuggestionKind.optionalArgument,
      "PARAMETER": CompletionSuggestionKind.parameter
    };
    return values[value];
  }
  String toJson() => _value;
}

abstract class ContentOverlayUpdate {
  factory ContentOverlayUpdate.fromJson(Map params) {
    var selectBy = params["type"];
    if (selectBy == "add") return new AddContentOverlay.fromJson(params);
    if (selectBy == "change") return new ChangeContentOverlay.fromJson(params);
    if (selectBy == "remove") return new RemoveContentOverlay.fromJson(params);

    throw new ArgumentError(
        'Could not match ContentOverlayUpdate for $selectBy');
  }
  Map toJson();
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
      {"type": "change", "edits": edits?.map((v) => v?.toJson())?.toList()};

  @override
  bool operator ==(Object other) {
    if (other is! ChangeContentOverlay) return false;
    var o = other as ChangeContentOverlay;
    if (!_deepEquals(edits, o.edits)) return false;
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

class Element {
  final int flags;
  final ElementKind kind;
  final Location location;
  final String name;
  final String parameters;
  final String returnType;
  final String typeParameters;

  Element._(this.flags, this.kind, this.location, this.name, this.parameters,
      this.returnType, this.typeParameters);
  factory Element(void init(Element$Builder b)) {
    var b = new Element$Builder._();
    init(b);
    return new Element._(b.flags, b.kind, b.location, b.name, b.parameters,
        b.returnType, b.typeParameters);
  }

  factory Element.fromJson(Map params) => new Element._(
      params.containsKey("flags") ? params["flags"] : null,
      params.containsKey("kind")
          ? new ElementKind.fromJson(params["kind"])
          : null,
      params.containsKey("location")
          ? new Location.fromJson(params["location"])
          : null,
      params.containsKey("name") ? params["name"] : null,
      params.containsKey("parameters") ? params["parameters"] : null,
      params.containsKey("returnType") ? params["returnType"] : null,
      params.containsKey("typeParameters") ? params["typeParameters"] : null);

  Map toJson() => {
        "flags": flags,
        "kind": kind?.toJson(),
        "location": location?.toJson(),
        "name": name,
        "parameters": parameters,
        "returnType": returnType,
        "typeParameters": typeParameters
      };

  @override
  bool operator ==(Object other) {
    if (other is! Element) return false;
    var o = other as Element;
    if (flags != o.flags) return false;
    if (kind != o.kind) return false;
    if (location != o.location) return false;
    if (name != o.name) return false;
    if (parameters != o.parameters) return false;
    if (returnType != o.returnType) return false;
    if (typeParameters != o.typeParameters) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [
      flags,
      kind,
      location,
      name,
      parameters,
      returnType,
      typeParameters
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

class Element$Builder {
  int flags;
  ElementKind kind;
  Location location;
  String name;
  String parameters;
  String returnType;
  String typeParameters;

  Element$Builder._();
}

class ElementKind {
  static const classElement = const ElementKind._("CLASS");
  static const classTypeAlias = const ElementKind._("CLASS_TYPE_ALIAS");
  static const compilationUnit = const ElementKind._("COMPILATION_UNIT");
  static const constructor = const ElementKind._("CONSTRUCTOR");
  static const enumConstant = const ElementKind._("ENUM_CONSTANT");
  static const enumElement = const ElementKind._("ENUM");
  static const field = const ElementKind._("FIELD");
  static const file = const ElementKind._("FILE");
  static const function = const ElementKind._("FUNCTION");
  static const functionTypeAlias = const ElementKind._("FUNCTION_TYPE_ALIAS");
  static const getter = const ElementKind._("GETTER");
  static const label = const ElementKind._("LABEL");
  static const library = const ElementKind._("LIBRARY");
  static const localVariable = const ElementKind._("LOCAL_VARIABLE");
  static const method = const ElementKind._("METHOD");
  static const parameter = const ElementKind._("PARAMETER");
  static const prefix = const ElementKind._("PREFIX");
  static const setter = const ElementKind._("SETTER");
  static const topLevelVariable = const ElementKind._("TOP_LEVEL_VARIABLE");
  static const typeParameter = const ElementKind._("TYPE_PARAMETER");
  static const unknown = const ElementKind._("UNKNOWN");
  final String _value;
  const ElementKind._(this._value);
  factory ElementKind.fromJson(String value) {
    const values = const {
      "CLASS": ElementKind.classElement,
      "CLASS_TYPE_ALIAS": ElementKind.classTypeAlias,
      "COMPILATION_UNIT": ElementKind.compilationUnit,
      "CONSTRUCTOR": ElementKind.constructor,
      "ENUM_CONSTANT": ElementKind.enumConstant,
      "ENUM": ElementKind.enumElement,
      "FIELD": ElementKind.field,
      "FILE": ElementKind.file,
      "FUNCTION": ElementKind.function,
      "FUNCTION_TYPE_ALIAS": ElementKind.functionTypeAlias,
      "GETTER": ElementKind.getter,
      "LABEL": ElementKind.label,
      "LIBRARY": ElementKind.library,
      "LOCAL_VARIABLE": ElementKind.localVariable,
      "METHOD": ElementKind.method,
      "PARAMETER": ElementKind.parameter,
      "PREFIX": ElementKind.prefix,
      "SETTER": ElementKind.setter,
      "TOP_LEVEL_VARIABLE": ElementKind.topLevelVariable,
      "TYPE_PARAMETER": ElementKind.typeParameter,
      "UNKNOWN": ElementKind.unknown
    };
    return values[value];
  }
  String toJson() => _value;
}

class Location {
  final String file;
  final int length;
  final int offset;
  final int startColumn;
  final int startLine;

  Location._(
      this.file, this.length, this.offset, this.startColumn, this.startLine);
  factory Location(void init(Location$Builder b)) {
    var b = new Location$Builder._();
    init(b);
    return new Location._(
        b.file, b.length, b.offset, b.startColumn, b.startLine);
  }

  factory Location.fromJson(Map params) => new Location._(
      params.containsKey("file") ? params["file"] : null,
      params.containsKey("length") ? params["length"] : null,
      params.containsKey("offset") ? params["offset"] : null,
      params.containsKey("startColumn") ? params["startColumn"] : null,
      params.containsKey("startLine") ? params["startLine"] : null);

  Map toJson() => {
        "file": file,
        "length": length,
        "offset": offset,
        "startColumn": startColumn,
        "startLine": startLine
      };

  @override
  bool operator ==(Object other) {
    if (other is! Location) return false;
    var o = other as Location;
    if (file != o.file) return false;
    if (length != o.length) return false;
    if (offset != o.offset) return false;
    if (startColumn != o.startColumn) return false;
    if (startLine != o.startLine) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [file, length, offset, startColumn, startLine]) {
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
  String file;
  int length;
  int offset;
  int startColumn;
  int startLine;

  Location$Builder._();
}

class NavigationRegion {
  final int length;
  final int offset;
  final List<int> targets;

  NavigationRegion._(this.length, this.offset, this.targets);
  factory NavigationRegion(void init(NavigationRegion$Builder b)) {
    var b = new NavigationRegion$Builder._();
    init(b);
    return new NavigationRegion._(b.length, b.offset, b.targets);
  }

  factory NavigationRegion.fromJson(Map params) => new NavigationRegion._(
      params.containsKey("length") ? params["length"] : null,
      params.containsKey("offset") ? params["offset"] : null,
      params.containsKey("targets") ? params["targets"] : null);

  Map toJson() => {"length": length, "offset": offset, "targets": targets};

  @override
  bool operator ==(Object other) {
    if (other is! NavigationRegion) return false;
    var o = other as NavigationRegion;
    if (length != o.length) return false;
    if (offset != o.offset) return false;
    if (!_deepEquals(targets, o.targets)) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [length, offset, targets]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class NavigationRegion$Builder {
  int length;
  int offset;
  List<int> targets;

  NavigationRegion$Builder._();
}

class NavigationResult {
  final List<String> files;
  final List<NavigationRegion> regions;
  final List<NavigationTarget> targets;

  NavigationResult._(this.files, this.regions, this.targets);
  factory NavigationResult(void init(NavigationResult$Builder b)) {
    var b = new NavigationResult$Builder._();
    init(b);
    return new NavigationResult._(b.files, b.regions, b.targets);
  }

  factory NavigationResult.fromJson(Map params) => new NavigationResult._(
      params.containsKey("files") ? params["files"] : null,
      params.containsKey("regions")
          ? params["regions"]
              .map((v) => new NavigationRegion.fromJson(v))
              .toList()
          : null,
      params.containsKey("targets")
          ? params["targets"]
              .map((v) => new NavigationTarget.fromJson(v))
              .toList()
          : null);

  Map toJson() => {
        "files": files,
        "regions": regions?.map((v) => v?.toJson())?.toList(),
        "targets": targets?.map((v) => v?.toJson())?.toList()
      };

  @override
  bool operator ==(Object other) {
    if (other is! NavigationResult) return false;
    var o = other as NavigationResult;
    if (!_deepEquals(files, o.files)) return false;
    if (!_deepEquals(regions, o.regions)) return false;
    if (!_deepEquals(targets, o.targets)) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [files, regions, targets]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class NavigationResult$Builder {
  List<String> files;
  List<NavigationRegion> regions;
  List<NavigationTarget> targets;

  NavigationResult$Builder._();
}

class NavigationTarget {
  final int fileIndex;
  final ElementKind kind;
  final int length;
  final int offset;
  final int startColumn;
  final int startLine;

  NavigationTarget._(this.fileIndex, this.kind, this.length, this.offset,
      this.startColumn, this.startLine);
  factory NavigationTarget(void init(NavigationTarget$Builder b)) {
    var b = new NavigationTarget$Builder._();
    init(b);
    return new NavigationTarget._(
        b.fileIndex, b.kind, b.length, b.offset, b.startColumn, b.startLine);
  }

  factory NavigationTarget.fromJson(Map params) => new NavigationTarget._(
      params.containsKey("fileIndex") ? params["fileIndex"] : null,
      params.containsKey("kind")
          ? new ElementKind.fromJson(params["kind"])
          : null,
      params.containsKey("length") ? params["length"] : null,
      params.containsKey("offset") ? params["offset"] : null,
      params.containsKey("startColumn") ? params["startColumn"] : null,
      params.containsKey("startLine") ? params["startLine"] : null);

  Map toJson() => {
        "fileIndex": fileIndex,
        "kind": kind?.toJson(),
        "length": length,
        "offset": offset,
        "startColumn": startColumn,
        "startLine": startLine
      };

  @override
  bool operator ==(Object other) {
    if (other is! NavigationTarget) return false;
    var o = other as NavigationTarget;
    if (fileIndex != o.fileIndex) return false;
    if (kind != o.kind) return false;
    if (length != o.length) return false;
    if (offset != o.offset) return false;
    if (startColumn != o.startColumn) return false;
    if (startLine != o.startLine) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [
      fileIndex,
      kind,
      length,
      offset,
      startColumn,
      startLine
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

class NavigationTarget$Builder {
  int fileIndex;
  ElementKind kind;
  int length;
  int offset;
  int startColumn;
  int startLine;

  NavigationTarget$Builder._();
}

class SearchResult {
  final bool isPotential;
  final SearchResultKind kind;
  final Location location;
  final List<Element> path;

  SearchResult._(this.isPotential, this.kind, this.location, this.path);
  factory SearchResult(void init(SearchResult$Builder b)) {
    var b = new SearchResult$Builder._();
    init(b);
    return new SearchResult._(b.isPotential, b.kind, b.location, b.path);
  }

  factory SearchResult.fromJson(Map params) => new SearchResult._(
      params.containsKey("isPotential") ? params["isPotential"] : null,
      params.containsKey("kind")
          ? new SearchResultKind.fromJson(params["kind"])
          : null,
      params.containsKey("location")
          ? new Location.fromJson(params["location"])
          : null,
      params.containsKey("path")
          ? params["path"].map((v) => new Element.fromJson(v)).toList()
          : null);

  Map toJson() => {
        "isPotential": isPotential,
        "kind": kind?.toJson(),
        "location": location?.toJson(),
        "path": path?.map((v) => v?.toJson())?.toList()
      };

  @override
  bool operator ==(Object other) {
    if (other is! SearchResult) return false;
    var o = other as SearchResult;
    if (isPotential != o.isPotential) return false;
    if (kind != o.kind) return false;
    if (location != o.location) return false;
    if (!_deepEquals(path, o.path)) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [isPotential, kind, location, path]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class SearchResult$Builder {
  bool isPotential;
  SearchResultKind kind;
  Location location;
  List<Element> path;

  SearchResult$Builder._();
}

class SearchResultKind {
  static const declaration = const SearchResultKind._("DECLARATION");
  static const invocation = const SearchResultKind._("INVOCATION");
  static const read = const SearchResultKind._("READ");
  static const readWrite = const SearchResultKind._("READ_WRITE");
  static const reference = const SearchResultKind._("REFERENCE");
  static const unknown = const SearchResultKind._("UNKNOWN");
  static const write = const SearchResultKind._("WRITE");
  final String _value;
  const SearchResultKind._(this._value);
  factory SearchResultKind.fromJson(String value) {
    const values = const {
      "DECLARATION": SearchResultKind.declaration,
      "INVOCATION": SearchResultKind.invocation,
      "READ": SearchResultKind.read,
      "READ_WRITE": SearchResultKind.readWrite,
      "REFERENCE": SearchResultKind.reference,
      "UNKNOWN": SearchResultKind.unknown,
      "WRITE": SearchResultKind.write
    };
    return values[value];
  }
  String toJson() => _value;
}

class SearchResults {
  final String id;
  final List<SearchResult> results;

  SearchResults._(this.id, this.results);
  factory SearchResults(void init(SearchResults$Builder b)) {
    var b = new SearchResults$Builder._();
    init(b);
    return new SearchResults._(b.id, b.results);
  }

  factory SearchResults.fromJson(Map params) => new SearchResults._(
      params.containsKey("id") ? params["id"] : null,
      params.containsKey("results")
          ? params["results"].map((v) => new SearchResult.fromJson(v)).toList()
          : null);

  Map toJson() =>
      {"id": id, "results": results?.map((v) => v?.toJson())?.toList()};

  @override
  bool operator ==(Object other) {
    if (other is! SearchResults) return false;
    var o = other as SearchResults;
    if (id != o.id) return false;
    if (!_deepEquals(results, o.results)) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [id, results]) {
      hash = 0x1fffffff & (hash + field.hashCode);
      hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
      hash ^= hash >> 6;
    }
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

class SearchResults$Builder {
  String id;
  List<SearchResult> results;

  SearchResults$Builder._();
}

class SourceEdit {
  final String id;
  final int length;
  final int offset;
  final String replacement;

  SourceEdit._(this.id, this.length, this.offset, this.replacement);
  factory SourceEdit(void init(SourceEdit$Builder b)) {
    var b = new SourceEdit$Builder._();
    init(b);
    return new SourceEdit._(b.id, b.length, b.offset, b.replacement);
  }

  factory SourceEdit.fromJson(Map params) => new SourceEdit._(
      params.containsKey("id") ? params["id"] : null,
      params.containsKey("length") ? params["length"] : null,
      params.containsKey("offset") ? params["offset"] : null,
      params.containsKey("replacement") ? params["replacement"] : null);

  Map toJson() => {
        "id": id,
        "length": length,
        "offset": offset,
        "replacement": replacement
      };

  @override
  bool operator ==(Object other) {
    if (other is! SourceEdit) return false;
    var o = other as SourceEdit;
    if (id != o.id) return false;
    if (length != o.length) return false;
    if (offset != o.offset) return false;
    if (replacement != o.replacement) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [id, length, offset, replacement]) {
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
  String id;
  int length;
  int offset;
  String replacement;

  SourceEdit$Builder._();
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
