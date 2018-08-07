import 'package:analysis_server_lib/analysis_server_lib.dart'
    hide Position, Location;

import 'position_convert.dart';
import 'protocol/language_server/messages.dart';
import 'utils/file_cache.dart';

List<SymbolInformation> toSymbolInformation(
        FileCache files, AnalysisOutline outline) =>
    _toSymbolInformations(
            toFileUri(outline.file), files[outline.file], outline.outline)
        .toList();

Iterable<SymbolInformation> _toSymbolInformations(
    String fileUri, List<int> lineLengths, Outline outline,
    [String containerName]) sync* {
  String name;
  // Omit the top "<unit>"
  if (outline.element.kind != 'COMPILATION_UNIT') {
    name = outline.element.name;
    yield SymbolInformation((b) => b
      ..containerName = containerName
      ..kind = _toSymbolKind(outline.element)
      ..name = name
      ..location = Location((b) => b
        ..uri = fileUri
        ..range = rangeFromOffset(lineLengths, outline.element.location.offset,
            outline.element.location.length)));
  }
  if (outline.children != null) {
    yield* outline.children
        .expand((o) => _toSymbolInformations(fileUri, lineLengths, o, name));
  }
}

SymbolKind _toSymbolKind(Element element) {
  switch (element.kind) {
    case 'CLASS':
    case 'CLASS_TYPE_ALIAS':
      return SymbolKind.classSymbol;
    case 'CONSTRUCTOR':
    case 'CONSTRUCTOR_INVOCATION':
      return SymbolKind.constructor;
    case 'ENUM':
      return SymbolKind.enumSymbol;
    case 'ENUM_CONSTANT':
      return SymbolKind.enumMember;
    case 'FIELD':
      return SymbolKind.field;
    case 'FILE':
      return SymbolKind.file;
    case 'FUNCTION':
    case 'FUNCTION_INVOCATION':
      return SymbolKind.function;
    case 'GETTER':
      return SymbolKind.property;
    case 'LABEL':
      return SymbolKind.key; // ?
    case 'LIBRARY':
      return SymbolKind.module;
    case 'LOCAL_VARIABLE':
      return SymbolKind.variable;
    case 'METHOD':
      return SymbolKind.method;
    case 'PARAMETER':
      return SymbolKind.variable; //?
    case 'PREFIX':
      return SymbolKind.namespace;
    case 'SETTER':
      return SymbolKind.property;
    case 'TOP_LEVEL_VARIABLE':
      return SymbolKind.variable;
    case 'TYPE_PARAMETER':
      return SymbolKind.typeParameter;
    case 'UNIT_TEST_GROUP':
    case 'UNIT_TEST_TEST':
      return SymbolKind.function; //?
    case 'UNKNOWN':
    default:
      return null;
  }
}

String toFileUri(String path) => '${Uri.file(path)}';
