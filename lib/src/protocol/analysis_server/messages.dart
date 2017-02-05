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

class CompletionResults {
  final int replacementOffset;
  final String id;
  final bool isLast;
  final int replacementLength;
  final List<CompletionSuggestion> results;

  CompletionResults._(this.replacementOffset, this.id, this.isLast,
      this.replacementLength, this.results);
  factory CompletionResults(void init(CompletionResults$Builder b)) {
    var b = new CompletionResults$Builder._();
    init(b);
    return new CompletionResults._(
        b.replacementOffset, b.id, b.isLast, b.replacementLength, b.results);
  }

  factory CompletionResults.fromJson(Map params) => new CompletionResults._(
      params.containsKey("replacementOffset")
          ? params["replacementOffset"]
          : null,
      params.containsKey("id") ? params["id"] : null,
      params.containsKey("isLast") ? params["isLast"] : null,
      params.containsKey("replacementLength")
          ? params["replacementLength"]
          : null,
      params.containsKey("results")
          ? params["results"]
              .map((v) => new CompletionSuggestion.fromJson(v))
              .toList()
          : null);

  Map toJson() => {
        "replacementOffset": replacementOffset,
        "id": id,
        "isLast": isLast,
        "replacementLength": replacementLength,
        "results": results.map((v) => v.toJson()).toList()
      };

  @override
  bool operator ==(Object other) {
    if (other is! CompletionResults) return false;
    var o = other as CompletionResults;
    if (replacementOffset != o.replacementOffset) return false;
    if (id != o.id) return false;
    if (isLast != o.isLast) return false;
    if (replacementLength != o.replacementLength) return false;
    if (!_deepEquals(results, o.results)) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [
      replacementOffset,
      id,
      isLast,
      replacementLength,
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
  int replacementOffset;
  String id;
  bool isLast;
  int replacementLength;
  List<CompletionSuggestion> results;

  CompletionResults$Builder._();
}

class ElementKind {
  static const localVariable = const ElementKind._("LOCAL_VARIABLE");
  static const function = const ElementKind._("FUNCTION");
  static const file = const ElementKind._("FILE");
  static const enumConstant = const ElementKind._("ENUM_CONSTANT");
  static const library = const ElementKind._("LIBRARY");
  static const enumElement = const ElementKind._("ENUM");
  static const getter = const ElementKind._("GETTER");
  static const compilationUnit = const ElementKind._("COMPILATION_UNIT");
  static const unknown = const ElementKind._("UNKNOWN");
  static const method = const ElementKind._("METHOD");
  static const functionTypeAlias = const ElementKind._("FUNCTION_TYPE_ALIAS");
  static const field = const ElementKind._("FIELD");
  static const classElement = const ElementKind._("CLASS");
  static const constructor = const ElementKind._("CONSTRUCTOR");
  static const topLevelVariable = const ElementKind._("TOP_LEVEL_VARIABLE");
  static const classTypeAlias = const ElementKind._("CLASS_TYPE_ALIAS");
  static const typeParameter = const ElementKind._("TYPE_PARAMETER");
  static const parameter = const ElementKind._("PARAMETER");
  static const label = const ElementKind._("LABEL");
  static const setter = const ElementKind._("SETTER");
  static const prefix = const ElementKind._("PREFIX");
  final String _value;
  const ElementKind._(this._value);
  factory ElementKind.fromJson(String value) {
    const values = const {
      "LOCAL_VARIABLE": ElementKind.localVariable,
      "FUNCTION": ElementKind.function,
      "FILE": ElementKind.file,
      "ENUM_CONSTANT": ElementKind.enumConstant,
      "LIBRARY": ElementKind.library,
      "ENUM": ElementKind.enumElement,
      "GETTER": ElementKind.getter,
      "COMPILATION_UNIT": ElementKind.compilationUnit,
      "UNKNOWN": ElementKind.unknown,
      "METHOD": ElementKind.method,
      "FUNCTION_TYPE_ALIAS": ElementKind.functionTypeAlias,
      "FIELD": ElementKind.field,
      "CLASS": ElementKind.classElement,
      "CONSTRUCTOR": ElementKind.constructor,
      "TOP_LEVEL_VARIABLE": ElementKind.topLevelVariable,
      "CLASS_TYPE_ALIAS": ElementKind.classTypeAlias,
      "TYPE_PARAMETER": ElementKind.typeParameter,
      "PARAMETER": ElementKind.parameter,
      "LABEL": ElementKind.label,
      "SETTER": ElementKind.setter,
      "PREFIX": ElementKind.prefix
    };
    return values[value];
  }
  String toJson() => _value;
}

class AnalysisErrorSeverity {
  static const info = const AnalysisErrorSeverity._("INFO");
  static const error = const AnalysisErrorSeverity._("ERROR");
  static const warning = const AnalysisErrorSeverity._("WARNING");
  final String _value;
  const AnalysisErrorSeverity._(this._value);
  factory AnalysisErrorSeverity.fromJson(String value) {
    const values = const {
      "INFO": AnalysisErrorSeverity.info,
      "ERROR": AnalysisErrorSeverity.error,
      "WARNING": AnalysisErrorSeverity.warning
    };
    return values[value];
  }
  String toJson() => _value;
}

class Element {
  final Location location;
  final int flags;
  final String name;
  final String typeParameters;
  final String parameters;
  final ElementKind kind;
  final String returnType;

  Element._(this.location, this.flags, this.name, this.typeParameters,
      this.parameters, this.kind, this.returnType);
  factory Element(void init(Element$Builder b)) {
    var b = new Element$Builder._();
    init(b);
    return new Element._(b.location, b.flags, b.name, b.typeParameters,
        b.parameters, b.kind, b.returnType);
  }

  factory Element.fromJson(Map params) => new Element._(
      params.containsKey("location")
          ? new Location.fromJson(params["location"])
          : null,
      params.containsKey("flags") ? params["flags"] : null,
      params.containsKey("name") ? params["name"] : null,
      params.containsKey("typeParameters") ? params["typeParameters"] : null,
      params.containsKey("parameters") ? params["parameters"] : null,
      params.containsKey("kind")
          ? new ElementKind.fromJson(params["kind"])
          : null,
      params.containsKey("returnType") ? params["returnType"] : null);

  Map toJson() => {
        "location": location.toJson(),
        "flags": flags,
        "name": name,
        "typeParameters": typeParameters,
        "parameters": parameters,
        "kind": kind.toJson(),
        "returnType": returnType
      };

  @override
  bool operator ==(Object other) {
    if (other is! Element) return false;
    var o = other as Element;
    if (location != o.location) return false;
    if (flags != o.flags) return false;
    if (name != o.name) return false;
    if (typeParameters != o.typeParameters) return false;
    if (parameters != o.parameters) return false;
    if (kind != o.kind) return false;
    if (returnType != o.returnType) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [
      location,
      flags,
      name,
      typeParameters,
      parameters,
      kind,
      returnType
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
  Location location;
  int flags;
  String name;
  String typeParameters;
  String parameters;
  ElementKind kind;
  String returnType;

  Element$Builder._();
}

class CompletionSuggestionKind {
  static const keyword = const CompletionSuggestionKind._("KEYWORD");
  static const optionalArgument =
      const CompletionSuggestionKind._("OPTIONAL_ARGUMENT");
  static const argumentList = const CompletionSuggestionKind._("ARGUMENT_LIST");
  static const import = const CompletionSuggestionKind._("IMPORT");
  static const parameter = const CompletionSuggestionKind._("PARAMETER");
  static const identifier = const CompletionSuggestionKind._("IDENTIFIER");
  static const invocation = const CompletionSuggestionKind._("INVOCATION");
  static const namedArgument =
      const CompletionSuggestionKind._("NAMED_ARGUMENT");
  final String _value;
  const CompletionSuggestionKind._(this._value);
  factory CompletionSuggestionKind.fromJson(String value) {
    const values = const {
      "KEYWORD": CompletionSuggestionKind.keyword,
      "OPTIONAL_ARGUMENT": CompletionSuggestionKind.optionalArgument,
      "ARGUMENT_LIST": CompletionSuggestionKind.argumentList,
      "IMPORT": CompletionSuggestionKind.import,
      "PARAMETER": CompletionSuggestionKind.parameter,
      "IDENTIFIER": CompletionSuggestionKind.identifier,
      "INVOCATION": CompletionSuggestionKind.invocation,
      "NAMED_ARGUMENT": CompletionSuggestionKind.namedArgument
    };
    return values[value];
  }
  String toJson() => _value;
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

class CompletionSuggestion {
  final List<String> parameterTypes;
  final bool isPotential;
  final String importUri;
  final CompletionSuggestionKind kind;
  final int selectionOffset;
  final bool isDeprecated;
  final List<String> parameterNames;
  final bool hasNamedParameters;
  final String docComplete;
  final int relevance;
  final int requiredParameterCount;
  final String completion;
  final Element element;
  final int selectionLength;
  final String parameterName;
  final String docSummary;
  final String returnType;
  final String declaringType;
  final String paramterType;

  CompletionSuggestion._(
      this.parameterTypes,
      this.isPotential,
      this.importUri,
      this.kind,
      this.selectionOffset,
      this.isDeprecated,
      this.parameterNames,
      this.hasNamedParameters,
      this.docComplete,
      this.relevance,
      this.requiredParameterCount,
      this.completion,
      this.element,
      this.selectionLength,
      this.parameterName,
      this.docSummary,
      this.returnType,
      this.declaringType,
      this.paramterType);
  factory CompletionSuggestion(void init(CompletionSuggestion$Builder b)) {
    var b = new CompletionSuggestion$Builder._();
    init(b);
    return new CompletionSuggestion._(
        b.parameterTypes,
        b.isPotential,
        b.importUri,
        b.kind,
        b.selectionOffset,
        b.isDeprecated,
        b.parameterNames,
        b.hasNamedParameters,
        b.docComplete,
        b.relevance,
        b.requiredParameterCount,
        b.completion,
        b.element,
        b.selectionLength,
        b.parameterName,
        b.docSummary,
        b.returnType,
        b.declaringType,
        b.paramterType);
  }

  factory CompletionSuggestion.fromJson(Map params) => new CompletionSuggestion
          ._(
      params.containsKey("parameterTypes") ? params["parameterTypes"] : null,
      params.containsKey("isPotential") ? params["isPotential"] : null,
      params.containsKey("importUri") ? params["importUri"] : null,
      params.containsKey("kind")
          ? new CompletionSuggestionKind.fromJson(params["kind"])
          : null,
      params.containsKey("selectionOffset") ? params["selectionOffset"] : null,
      params.containsKey("isDeprecated") ? params["isDeprecated"] : null,
      params.containsKey("parameterNames") ? params["parameterNames"] : null,
      params.containsKey("hasNamedParameters")
          ? params["hasNamedParameters"]
          : null,
      params.containsKey("docComplete") ? params["docComplete"] : null,
      params.containsKey("relevance") ? params["relevance"] : null,
      params.containsKey("requiredParameterCount")
          ? params["requiredParameterCount"]
          : null,
      params.containsKey("completion") ? params["completion"] : null,
      params.containsKey("element")
          ? new Element.fromJson(params["element"])
          : null,
      params.containsKey("selectionLength") ? params["selectionLength"] : null,
      params.containsKey("parameterName") ? params["parameterName"] : null,
      params.containsKey("docSummary") ? params["docSummary"] : null,
      params.containsKey("returnType") ? params["returnType"] : null,
      params.containsKey("declaringType") ? params["declaringType"] : null,
      params.containsKey("paramterType") ? params["paramterType"] : null);

  Map toJson() => {
        "parameterTypes": parameterTypes,
        "isPotential": isPotential,
        "importUri": importUri,
        "kind": kind.toJson(),
        "selectionOffset": selectionOffset,
        "isDeprecated": isDeprecated,
        "parameterNames": parameterNames,
        "hasNamedParameters": hasNamedParameters,
        "docComplete": docComplete,
        "relevance": relevance,
        "requiredParameterCount": requiredParameterCount,
        "completion": completion,
        "element": element.toJson(),
        "selectionLength": selectionLength,
        "parameterName": parameterName,
        "docSummary": docSummary,
        "returnType": returnType,
        "declaringType": declaringType,
        "paramterType": paramterType
      };

  @override
  bool operator ==(Object other) {
    if (other is! CompletionSuggestion) return false;
    var o = other as CompletionSuggestion;
    if (!_deepEquals(parameterTypes, o.parameterTypes)) return false;
    if (isPotential != o.isPotential) return false;
    if (importUri != o.importUri) return false;
    if (kind != o.kind) return false;
    if (selectionOffset != o.selectionOffset) return false;
    if (isDeprecated != o.isDeprecated) return false;
    if (!_deepEquals(parameterNames, o.parameterNames)) return false;
    if (hasNamedParameters != o.hasNamedParameters) return false;
    if (docComplete != o.docComplete) return false;
    if (relevance != o.relevance) return false;
    if (requiredParameterCount != o.requiredParameterCount) return false;
    if (completion != o.completion) return false;
    if (element != o.element) return false;
    if (selectionLength != o.selectionLength) return false;
    if (parameterName != o.parameterName) return false;
    if (docSummary != o.docSummary) return false;
    if (returnType != o.returnType) return false;
    if (declaringType != o.declaringType) return false;
    if (paramterType != o.paramterType) return false;
    return true;
  }

  @override
  int get hashCode {
    int hash = 0;
    for (var field in [
      parameterTypes,
      isPotential,
      importUri,
      kind,
      selectionOffset,
      isDeprecated,
      parameterNames,
      hasNamedParameters,
      docComplete,
      relevance,
      requiredParameterCount,
      completion,
      element,
      selectionLength,
      parameterName,
      docSummary,
      returnType,
      declaringType,
      paramterType
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
  List<String> parameterTypes;
  bool isPotential;
  String importUri;
  CompletionSuggestionKind kind;
  int selectionOffset;
  bool isDeprecated;
  List<String> parameterNames;
  bool hasNamedParameters;
  String docComplete;
  int relevance;
  int requiredParameterCount;
  String completion;
  Element element;
  int selectionLength;
  String parameterName;
  String docSummary;
  String returnType;
  String declaringType;
  String paramterType;

  CompletionSuggestion$Builder._();
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
  final String _value;
  const AnalysisErrorType._(this._value);
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
  String toJson() => _value;
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
