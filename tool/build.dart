import 'dart:async';

import 'package:build_runner/build_runner.dart';

import 'message_builder.dart';

Future main() async {
  await build(new PhaseGroup.singleAction(new MessageBuilder(),
      new InputSet('dart_language_server', ['lib/**/*.yaml'])));
}
