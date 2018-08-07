import 'package:args/args.dart';
import 'package:meta/meta.dart';

const _forceTraceLevel = 'force-trace-level';
const _forceTraceLevelLegacy = 'force_trace_level';
const _logDirectory = 'log-directory';

class StartupArgs {
  List<String> analysisServerArgs;
  String forceTraceLevel;
  String logDirectory;

  factory StartupArgs(List<String> args) {
    final parser = ArgParser()
      ..addOption(_forceTraceLevel,
          help: 'Override the `trace` option during initialization',
          allowed: ['trace', 'verbose', 'off'])
      ..addOption(_forceTraceLevelLegacy,
          hide: true, allowed: ['trace', 'verbose', 'off'])
      ..addOption(_logDirectory, help: 'Override the log directory');
    try {
      final result = parser.parse(args);
      return StartupArgs._(
        forceTraceLevel:
            result[_forceTraceLevel] ?? result[_forceTraceLevelLegacy],
        logDirectory: result[_logDirectory],
        analysisServerArgs: result.rest,
      );
    } catch (_) {
      throw UsageException(parser.usage);
    }
  }

  StartupArgs._({
    @required String forceTraceLevel,
    @required String logDirectory,
    @required List<String> analysisServerArgs,
  })  : forceTraceLevel = forceTraceLevel,
        logDirectory = logDirectory,
        analysisServerArgs = analysisServerArgs;
}

class UsageException implements Exception {
  final String usage;
  UsageException(this.usage);
}
