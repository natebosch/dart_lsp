import 'package:args/args.dart';
import 'package:meta/meta.dart';

const _forceTraceLevel = 'force_trace_level';

class StartupArgs {
  List<String> analysisServerArgs;
  String forceTraceLevel;

  factory StartupArgs(List<String> args) {
    final parser = new ArgParser()
      ..addOption(_forceTraceLevel,
          help: 'Override the `trace` option during initialization',
          allowed: ['trace', 'verbose', 'off']);
    try {
      final result = parser.parse(args);
      return new StartupArgs._(
        forceTraceLevel: result[_forceTraceLevel],
        analysisServerArgs: result.rest,
      );
    } catch (_) {
      throw new UsageException(parser.usage);
    }
  }

  StartupArgs._({
    @required String forceTraceLevel,
    @required List<String> analysisServerArgs,
  })  : forceTraceLevel = forceTraceLevel,
        analysisServerArgs = analysisServerArgs;
}

class UsageException implements Exception {
  final String usage;
  UsageException(this.usage);
}
