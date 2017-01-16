import 'dart:async';

import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';
import 'package:yaml/yaml.dart';

class MessageBuilder implements Builder {
  @override
  List<AssetId> declareOutputs(AssetId input) =>
      input.extension == '.yaml' ? [input.changeExtension('.dart')] : const [];

  @override
  Future build(BuildStep buildStep) async {
    var descriptions = loadYaml(buildStep.input.stringContents);
    var result = new StringBuffer();
    for (var name in descriptions.keys) {
      result.write(_classFor(name, descriptions[name]));
    }
    var formatter = new DartFormatter();
    buildStep.writeAsString(new Asset(
        buildStep.input.id.changeExtension('.dart'),
        formatter.format(result.toString())));
  }
}

String _classFor(String name, Map params) {
  final message = _parseMessage(name, params);
  return message.implementation;
}

const _primitives = const ['String', 'int', 'bool', 'dynamic'];

Message _parseMessage(String name, Map params) {
  var fields = params.containsKey('fields')
      ? _parseFields(params['fields'])
      : _parseFields(params);
  return new Message(name, fields);
}

Iterable<Field> _parseFields(Map fields) =>
    fields.keys.map((name) => new Field(name, _parseFieldType(fields[name])));

FieldType _parseFieldType(dynamic /*String|Map*/ field) {
  if (field is String) {
    if (_primitives.contains(field)) return new PrimitiveFieldType(field);
    return new MessageFieldType(field);
  }
  if (field is Map) {
    if (field.containsKey('listType')) {
      return new ListFieldType(_parseFieldType(field['listType']));
    }
  }
  throw 'Unhandled field type [$field]';
}

class Message {
  final String name;
  final List<Field> fields;
  Message(this.name, this.fields);

  String get implementation {
    final finalDeclarations = fields.map((f) => 'final ${f.declaration}');
    final fieldNames = fields.map((f) => f.name);
    final equalityChecks =
        fields.map((f) => 'if(${f.name} != o.${f.name}) return false;');
    var builderName = '$name\$Builder';
    return '''
  class $name {
    ${finalDeclarations.join('\n')}

    $name._(${fieldNames.map((f) => 'this.$f').join(',')});

    factory $name(void init($builderName b)) {
      var b = new $builderName._();
      init(b);
      return new $name._(${fieldNames.map((f) => 'b.$f').join(', ')});
    }

    factory $name.fromJson(Map params) =>
      new $name._(${fields.map((f) => f.fromParams).join(', ')});

    Map toJson() => {${fields.map((f) => f.toJson).join(', ')}};

    @override
    int get hashCode {
      int hash = 0;
      for(var field in [${fieldNames.join(', ')}]) {
        hash = 0x1fffffff & (hash + field.hashCode);
        hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
        hash ^= hash >> 6;
      }
      hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
      hash = hash ^ (hash >> 11);
      return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
    }

    @override
    bool operator==(Object other) {
      if(other is! $name) return false;
      var o = other as $name;
      ${equalityChecks.join('\n')}
      return true;
    }
  }

  class $builderName {
    ${fields.map((f) => f.declaration).join('\n')}

    $builderName._();
  }
  ''';
  }
}

class Field {
  final String name;
  final FieldType type;
  Field(this.name, this.type);
  String get toJson => '"$name": $name${type.toJsonSuffix}';
  String get fromParams {
    var typeFromParams = type.fromParams('params["$name"]');
    return 'params.containsKey("$name") ? $typeFromParams : null';
  }

  String get declaration => '${type.declaration} $name;';
}

abstract class FieldType {
  String get toJsonSuffix;
  String fromParams(String name);
  String get declaration;
  bool get isPrimitive;
}

class PrimitiveFieldType implements FieldType {
  final String name;
  PrimitiveFieldType(this.name);
  @override
  String get toJsonSuffix => '';
  @override
  String fromParams(String fieldValue) => fieldValue;
  @override
  String get declaration => '$name';
  @override
  bool get isPrimitive => true;
}

class MessageFieldType extends FieldType {
  final String name;
  MessageFieldType(this.name);

  @override
  String get toJsonSuffix => '.toJson()';

  @override
  String fromParams(String fieldValue) => 'new $name.fromJson($fieldValue)';

  @override
  String get declaration => '$name';

  @override
  bool get isPrimitive => false;
}

class ListFieldType extends FieldType {
  final FieldType typeArgument;
  ListFieldType(this.typeArgument);

  @override
  String get toJsonSuffix {
    if (typeArgument.isPrimitive) return '';
    return '.map((v) => v${typeArgument.toJsonSuffix}).toList()';
  }

  @override
  String fromParams(String fieldValue) {
    if (typeArgument.isPrimitive) return fieldValue;
    return '$fieldValue.map((v) => ${typeArgument.fromParams('v')}).toList()';
  }

  @override
  String get declaration => 'List<${typeArgument.declaration}>';

  @override
  bool get isPrimitive => typeArgument.isPrimitive;
}
