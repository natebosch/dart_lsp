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
    var hasList = false;
    for (var name in descriptions.keys) {
      var description = _parseDescription(name, descriptions[name]);
      if (description.hasListField) hasList = true;
      result.write(description.implementation);
    }
    if (hasList) {
      result.write(_deepEquals);
    }
    var formatter = new DartFormatter();
    buildStep.writeAsString(new Asset(
        buildStep.input.id.changeExtension('.dart'),
        formatter.format(result.toString())));
  }
}

const _deepEquals = '''
_deepEquals(dynamic left, dynamic right) {
  if (left is List && right is List) {
    var leftLength = left.length;
    var rightLength = right.length;
    if (leftLength != rightLength) return false;
    for(int i = 0; i < leftLength; i++) {
      if(!_deepEquals(left[i], right[i])) return false;
    }
    return true;
  }
  return left == right;
}
''';

const _primitives = const ['String', 'int', 'bool', 'dynamic'];

Description _parseDescription(String name, Map params) {
  if (params.containsKey('enumValues')) {
    return new EnumType(
        name, params['wireType'], _parseEnumValues(params['enumValues']));
  }
  if (params.containsKey('subclassBy')) {
    return _parseSubclassedMessage(name, params);
  }
  var fields = params.containsKey('fields')
      ? _parseFields(params['fields'])
      : _parseFields(params);
  return new Message(name, fields);
}

Description _parseSubclassedMessage(String name, Map params) {
  var parentField = params['subclassBy'];
  var subclasses = <Message>[];
  var subclassSelections = <String, String>{};
  var descriptions = params['subclasses'];
  for (var subclass in descriptions.keys) {
    var description = descriptions[subclass];
    var fields = {};
    if (description.containsKey('fields')) {
      fields.addAll(description['fields']);
    }
    var parentFieldToken = description['selectOn'] is String
        ? '"${description['selectOn']}"'
        : '${description.selectOn}';
    subclasses.add(new Message(subclass, _parseFields(fields), name,
        parentField.keys.single, parentFieldToken));
    subclassSelections[parentFieldToken] = subclass;
  }
  return new SubclassedMessage(
      name, subclasses, parentField.keys.single, subclassSelections);
}

Iterable<EnumValue> _parseEnumValues(Map values) =>
    values.keys.map((name) => new EnumValue(name, values[name]));

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

class Description {
  String get implementation;
  bool get hasListField;
}

class EnumType implements Description {
  final String name;
  final String wireType;
  final List<EnumValue> values;
  EnumType(this.name, this.wireType, this.values);
  @override
  bool get hasListField => false;

  @override
  String get implementation {
    var instantiations =
        values.map((v) => '${v.name} = const $name._(${v.wireId});');
    return '''
  class $name {
    ${instantiations.map((i) => 'static const $i').join('\n')}
    final $wireType _value;
    const $name._(this._value);
    factory $name.fromJson($wireType value) {
      const values = const {
        ${values.map((v) => '${v.wireId}: $name.${v.name}').join(',\n')}
      };
      return values[value];
    }
    $wireType toJson() => _value;
  }
  ''';
  }
}

class EnumValue {
  final String name;
  final dynamic /*String|int*/ wireValue;
  EnumValue(this.name, this.wireValue);
  String get wireId => (wireValue is String) ? '"$wireValue"' : '$wireValue';
}

class SubclassedMessage implements Description {
  final String name;
  final List<Message> subclasses;
  final String subclassBy;
  final Map<String, String> subclassSelections;
  SubclassedMessage(
      this.name, this.subclasses, this.subclassBy, this.subclassSelections);

  @override
  bool get hasListField => subclasses.any((m) => m.hasListField);

  @override
  String get implementation {
    var selection = new StringBuffer();
    for (var key in subclassSelections.keys) {
      var ctor = 'new ${subclassSelections[key]}.fromJson(params)';
      selection.writeln('if (selectBy == $key) return $ctor;');
    }
    return '''
  abstract class $name {
    factory $name.fromJson(Map params) {
      var selectBy = params["$subclassBy"];
      $selection
      throw new ArgumentError('Could not match $name for \$selectBy');
    }
    Map toJson();
  }

  ${subclasses.map((c) => c.implementation).join('\n')}
  ''';
  }
}

class Message implements Description {
  final String name;
  final List<Field> fields;
  final String parent;
  final String parentField;
  final String parentFieldToken;
  Message(this.name, this.fields,
      [this.parent, this.parentField, this.parentFieldToken]);

  Iterable<String> get _fieldNames => fields.map((f) => f.name);

  String get _builderName => '$name\$Builder';

  @override
  bool get hasListField => fields.any((f) => f.type is ListFieldType);

  @override
  String get implementation {
    final finalDeclarations = fields.map((f) => 'final ${f.declaration}');
    var implementStatement = parent == null ? '' : 'implements $parent';
    final parentFieldInitializer =
        parentField == null ? '' : 'final $parentField = $parentFieldToken;';
    final parentFieldJson =
        parentField == null ? '' : '"$parentField": $parentFieldToken,';
    return '''
  class $name $implementStatement {
    $parentFieldInitializer
    ${finalDeclarations.join('\n')}

    $_ctors

    Map toJson() => {$parentFieldJson
      ${fields.map((f) => f.toJson).join(', ')}};

    @override
    $_equality

    @override
    int get hashCode {
      int hash = 0;
      for(var field in [${_fieldNames.join(', ')}]) {
        hash = 0x1fffffff & (hash + field.hashCode);
        hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
        hash ^= hash >> 6;
      }
      hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
      hash = hash ^ (hash >> 11);
      return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
    }

  }

  class $_builderName {
    ${fields.map((f) => f.declaration).join('\n')}

    $_builderName._();
  }
  ''';
  }

  String get _equality {
    if (fields.isEmpty) {
      return 'bool operator==(Object other) => other is $name;';
    }
    final equalityChecks =
        fields.map((f) => 'if(${f.equalityCheck('o')}) return false;');
    return '''
    bool operator==(Object other) {
      if(other is! $name) return false;
      var o = other as $name;
      ${equalityChecks.join('\n')}
      return true;
    }
    ''';
  }

  String get _ctors => fields.isNotEmpty
      ? '''
    $name._(${_fieldNames.map((f) => 'this.$f').join(',')});
    factory $name(void init($_builderName b)) {
      var b = new $_builderName._();
      init(b);
      return new $name._(${_fieldNames.map((f) => 'b.$f').join(', ')});
    }

    factory $name.fromJson(Map params) =>
      new $name._(${fields.map((f) => f.fromParams).join(', ')});
    '''
      : '''
      const $name();
      const $name.fromJson([_]);
    ''';
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

  String equalityCheck(String other) =>
      type.equalityCheck(name, '$other.$name');
}

abstract class FieldType {
  String get toJsonSuffix;
  String fromParams(String name);
  String get declaration;
  bool get isPrimitive;
  String equalityCheck(String leftToken, String rightToken);
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

  @override
  bool equalityCheck(String leftToken, String rightToken) =>
      '$leftToken != $rightToken';
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

  @override
  String equalityCheck(String leftToken, String rightToken) =>
      '$leftToken != $rightToken';
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

  @override
  String equalityCheck(String leftToken, String rightToken) =>
      '!_deepEquals($leftToken, $rightToken)';
}
