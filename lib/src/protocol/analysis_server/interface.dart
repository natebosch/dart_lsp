import 'dart:async';

import 'messages.dart';

abstract class AnalysisServer {
  Future<Null> shutdown() async {}
  Future<Null> setPriorityFiles(List<String> files) async {}
  Future<Null> setAnalysisRoots(List<String> included, List<String> excluded,
      [Map<String, String> packageRoots]) async {}
  Future<Null> updateContent(Map<String, ContentOverlayUpdate> files) async {}

  Stream<AnalysisErrors> get analysisErrors;
}
