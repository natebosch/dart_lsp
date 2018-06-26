import 'package:args/args.dart';
import 'package:meta/meta.dart';

const _forceTraceLevel = 'force_trace_level';
const _logFolder = 'log_folder';

class StartupArgs {
  List<String> analysisServerArgs;
  String forceTraceLevel;
  String logFolder;

  factory StartupArgs(List<String> args) {
    final parser = new ArgParser()
      ..addOption(_forceTraceLevel,
          help: 'Override the `trace` option during initialization',
          allowed: ['trace', 'verbose', 'off'])
      ..addOption(_logFolder, help: 'Override the log folder');
    try {
      final result = parser.parse(args);
      return new StartupArgs._(
        forceTraceLevel: result[_forceTraceLevel],
        logFolder: result[_logFolder],
        analysisServerArgs: result.rest,
      );
    } catch (_) {
      throw new UsageException(parser.usage);
    }
  }

  StartupArgs._({
    @required String forceTraceLevel,
    @required String logFolder,
    @required List<String> analysisServerArgs,
  })  : forceTraceLevel = forceTraceLevel,
        logFolder = logFolder,
        analysisServerArgs = analysisServerArgs;
}

class UsageException implements Exception {
  final String usage;
  UsageException(this.usage);
}
