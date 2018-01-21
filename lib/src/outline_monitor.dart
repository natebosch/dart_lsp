import 'dart:async';

import 'package:analysis_server_lib/analysis_server_lib.dart'
    hide Position, Location;

/// Manages Analysis subscriptions for outlines and adaptes the Stream interface
/// into a Future interface.
///
/// Analysis server does not have an API for getting the outline of a file once.
/// Instead, as outlines are needed, add subscriptions and set up completers for
/// when they arrive on the stream.
class OutlineMonitor {
  final AnalysisServer _server;
  StreamSubscription<AnalysisOutline> _subscription;

  final _monitoredFiles = new Set<String>();
  final _outlines = <String, AnalysisOutline>{};
  final _requests = <String, Completer<AnalysisOutline>>{};

  OutlineMonitor(this._server) {
    _subscription = _server.analysis.onOutline.listen(_onOutline);
  }
  Future<AnalysisOutline> outlineFor(String filePath) {
    if (_monitoredFiles.add(filePath)) {
      _updateSubscriptions();
    }
    if (_outlines.containsKey(filePath)) {
      return new Future.value(_outlines[filePath]);
    }
    return _requests.putIfAbsent(filePath, () => new Completer()).future;
  }

  void onFileClose(String filePath) {
    if (_monitoredFiles.remove(filePath)) {
      _updateSubscriptions();
      _outlines.remove(filePath);
    }
  }

  Future<Null> close() => _subscription.cancel();

  void _updateSubscriptions() {
    _server.analysis.setSubscriptions({'OUTLINE': _monitoredFiles.toList()});
  }

  void _onOutline(AnalysisOutline outline) {
    // File may have been closed an doesn't need to be cached
    if (_monitoredFiles.contains(outline.file)) {
      _outlines[outline.file] = outline;
    }
    _requests.remove(outline.file)?.complete(outline);
  }
}
