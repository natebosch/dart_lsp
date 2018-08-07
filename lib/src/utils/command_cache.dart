import 'dart:collection';

import '../protocol/language_server/messages.dart' show Command;

const _size = 1000;

class CommandCache {
  /// Commands in insertion order
  final _commands = LinkedHashMap<String, void Function()>();

  /// Store [change] in the cache as a [Command] and return the command.
  Command add(Command command, void Function() callback) {
    _commands[command.command] = callback;
    if (_commands.length > _size) _commands.remove(_commands.keys.first);
    return command;
  }

  void Function() operator [](String key) => _commands[key];
}
