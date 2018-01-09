import 'dart:collection';

import '../protocol/language_server/messages.dart' show Command;

const _size = 1000;

typedef void Callback();

class CommandCache {
  /// Commands in insertion order
  final _commands = new LinkedHashMap<String, Callback>();

  /// Store [change] in the cache as a [Command] and return the command.
  Command add(Command command, Callback callback) {
    _commands[command.command] = callback;
    if (_commands.length > _size) _commands.remove(_commands.keys.first);
    return command;
  }

  Callback operator [](String key) => _commands[key];
}
