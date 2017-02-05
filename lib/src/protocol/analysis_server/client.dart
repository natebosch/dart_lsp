import 'dart:async';
import 'dart:io';

import 'package:path/path.dart' as p;

import 'interface.dart';
import 'messages.dart';
import 'wireformat.dart';

String get _dart => Platform.resolvedExecutable;
String get _analysisServer =>
    '${p.dirname(_dart)}/snapshots/analysis_server.dart.snapshot';

/// An [AnalysisServer] which is a client of the sdk provided analysis server
/// as a subprocess.
class SubprocessAnalysisServer implements AnalysisServer {
  final RpcClient _client;

  static Future<AnalysisServer> start([String wirelogPath]) async {
    var process = await Process.start(_dart, [_analysisServer]);
    var client = new RpcClient('AnalysisServer', process, wirelogPath);
    return new SubprocessAnalysisServer._(client);
  }

  SubprocessAnalysisServer._(this._client) {
    _notifications();
  }

  void _notifications() {
    _client
      ..registerEventHandler('analysis.errors', (params) {
        _analysisErrors.add(new AnalysisErrors.fromJson(params));
      })
      ..registerEventHandler('completion.results', (params) {
        _completionResults.add(new CompletionResults.fromJson(params));
      });
  }

  @override
  Stream<AnalysisErrors> get analysisErrors => _analysisErrors.stream;
  final _analysisErrors = new StreamController<AnalysisErrors>();

  @override
  Stream<CompletionResults> get completionResults => _completionResults.stream;
  final _completionResults = new StreamController<CompletionResults>();

  @override
  Future<Null> shutdown() async {
    await _client.sendRequest('server.shutdown');
  }

  @override
  Future<Null> setPriorityFiles(List<String> files) async {
    await _client.sendRequest('analysis.setPriorityFiles', {'files': files});
  }

  @override
  Future<Null> setAnalysisRoots(List<String> included, List<String> excluded,
      [Map<String, String> packageRoots]) async {
    await _client.sendRequest('analysis.setAnalysisRoots', {
      'included': included,
      'excluded': excluded,
      'packageRoots': packageRoots
    });
  }

  @override
  Future<Null> updateContent(Map<String, ContentOverlayUpdate> files) async {
    var serializable =
        new Map.fromIterable(files.keys, value: (file) => files[file].toJson());
    await _client
        .sendRequest('analysis.updateContent', {'files': serializable});
  }

  @override
  Future<String> completionGetSuggestions(String file, int offset) async {
    var result = await _client.sendRequest(
        'completion.getSuggestions', {'file': file, 'offset': offset});
    return result['id'];
  }
}
