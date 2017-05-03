import 'dart:async';
import 'dart:io';

import 'package:path/path.dart' as p;

import '../../logging/logs.dart';
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

  static Future<AnalysisServer> start() async {
    var process = await Process.start(_dart, [_analysisServer]);
    var client = new RpcClient('AnalysisServer', process, analyzerChannel);
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
      })
      ..registerEventHandler('search.results', (params) {
        _searchResults.add(new SearchResults.fromJson(params));
      });
  }

  @override
  Stream<AnalysisErrors> get analysisErrors => _analysisErrors.stream;
  final _analysisErrors = new StreamController<AnalysisErrors>();

  @override
  Stream<CompletionResults> get completionResults => _completionResults.stream;
  final _completionResults = new StreamController<CompletionResults>();

  @override
  Stream<SearchResults> get searchResults => _searchResults.stream;
  final _searchResults = new StreamController<SearchResults>();

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

  @override
  Future<NavigationResult> analysisGetNavigation(
      String file, int offset, int length) async {
    var result = await _client.sendRequest('analysis.getNavigation',
        {'file': file, 'offset': offset, 'length': length});
    return new NavigationResult((b) => b
      ..files = result['files']
      ..targets = result['targets'].map((t) => new NavigationTarget.fromJson(t))
      ..regions =
          result['regions'].map(((r) => new NavigationRegion.fromJson(r))));
  }

  @override
  Future<String> findElementReferences(
      String file, int offset, bool includePotential) async {
    var result = await _client.sendRequest('search.findElementReferences',
        {'file': file, 'offset': offset, 'includePotential': includePotential});
    return result['id'];
  }
}
