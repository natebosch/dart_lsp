import 'dart:async';

import 'package:analysis_server_lib/analysis_server_lib.dart'
    hide Position, Location;
import 'package:meta/meta.dart';

/// Datasets which are requests in LSP but Streams which need to be subscribed
/// to in the Analysis Server.
///
/// Anytime the result changes for any file an update will be sent and cached
/// until it is requested. Results should be invalided with [invalidate] which
/// temporarily marks a result as invalid in case a new version is sent, but
/// since we can't guarantee a result will be sent we fall back on the old
/// version after a delay.
class Subscriptions {
  final Subscription<AnalysisOutline> outlines;
  final Subscription<AnalysisOccurrences> occurrences;

  Subscriptions._(AnalysisServer server, _Updater updater)
      : outlines = Subscription<AnalysisOutline>(
          server,
          updater,
          subscriptionName: 'OUTLINE',
          findStream: (server) => server.analysis.onOutline,
          findFile: (outline) => outline.file,
        ),
        occurrences = Subscription<AnalysisOccurrences>(
          server,
          updater,
          subscriptionName: 'OCCURRENCES',
          findStream: (server) => server.analysis.onOccurrences,
          findFile: (occurrences) => occurrences.file,
        );

  factory Subscriptions(AnalysisServer server) {
    final updater = _Updater(server);
    return Subscriptions._(server, updater);
  }

  void onFileClose(String filePath) {
    outlines._onFileClose(filePath);
    occurrences._onFileClose(filePath);
  }

  void invalidate(String filePath) {
    outlines._invalidate(filePath);
    occurrences._onFileClose(filePath);
  }

  Future<void> close() =>
      Future.wait([outlines._close(), occurrences._close()]);
}

/// Analysis Server expects all subscription to be set on any change. Keep track
/// of active subscriptions so they can be enabled/disabled individually.
class _Updater {
  final AnalysisServer _server;

  final _subscriptions = <String, Set<String>>{};

  _Updater(this._server);

  void _subscribe(String name, String filePath) {
    _subscriptions.putIfAbsent(name, () => Set<String>());
    if (!_subscriptions[name].add(filePath)) return;
    _updateSubscriptions();
  }

  void _unsubscribe(String name, String filePath) {
    if (!_subscriptions.containsKey(name)) return;
    if (!_subscriptions[name].remove(filePath)) return;
    _updateSubscriptions();
  }

  void _updateSubscriptions() {
    _server.analysis.setSubscriptions(
        _subscriptions.map((name, files) => MapEntry(name, files.toList())));
  }
}

/// Manages Analysis subscriptions and adapts the Stream interface into a Future
/// interface.
///
/// For some requests the Analysis Server only exposes a Stream which must have
/// files explicitly subscribed to instead of a request made once. As requests
/// are needed the subscriptions are initialized and completers are prepared to
/// handle the first result.
///
/// Subscriptions for a given file are kept open with the assumption that
/// they'll be needed multiple times.
class Subscription<T> {
  final _Updater _updater;
  final AnalysisServer _server;

  StreamSubscription<T> _subscription;

  final _results = <String, T>{};
  final _requests = <String, Completer<T>>{};

  // When a file has changed but no new result has been received these results
  // can be used as a last resort.
  final _staleResults = <String, T>{};

  final String Function(T) _findFile;
  final String _subscriptionName;

  Subscription(
    this._server,
    this._updater, {
    @required String subscriptionName,
    @required String Function(T) findFile,
    @required Stream<T> Function(AnalysisServer) findStream,
  })  : _findFile = findFile,
        _subscriptionName = subscriptionName {
    _subscription = findStream(_server).listen(_onResult);
  }

  Future<T> requestFor(String filePath) {
    _updater._subscribe(_subscriptionName, filePath);
    if (_results.containsKey(filePath)) {
      return Future.value(_results[filePath]);
    }
    var resultFromStream =
        _requests.putIfAbsent(filePath, () => Completer()).future;
    if (_staleResults.containsKey(filePath)) {
      var oldResult = _staleResults[filePath];
      return Future.any([
        resultFromStream,
        Future.delayed(const Duration(seconds: 1), () => oldResult)
      ]);
    } else {
      return resultFromStream;
    }
  }

  void _onFileClose(String filePath) {
    _results.remove(filePath);
    _requests.remove(filePath);
    _updater._unsubscribe(_subscriptionName, filePath);
  }

  void _invalidate(String filePath) {
    final result = _results.remove(filePath);
    if (result != null) _staleResults[filePath] = result;
  }

  Future<void> _close() => _subscription.cancel();

  void _onResult(T result) {
    final filePath = _findFile(result);
    // File may have been closed and doesn't need to be cached
    if (_updater._subscriptions[_subscriptionName].contains(filePath)) {
      _results[filePath] = result;
      _staleResults.remove(filePath);
    }
    _requests.remove(filePath)?.complete(result);
  }
}
