import 'dart:async';

import 'messages.dart';

abstract class AnalysisServer {
  Future<Null> shutdown() async {}
  Future<Null> setPriorityFiles(List<String> files) async {}
  Future<Null> setAnalysisRoots(List<String> included, List<String> excluded,
      [Map<String, String> packageRoots]) async {}
  Future<Null> updateContent(Map<String, ContentOverlayUpdate> files) async {}
  Future<String> completionGetSuggestions(String file, int offset);
  Future<NavigationResult> analysisGetNavigation(
      String file, int offset, int length);
  Future<String> findElementReferences(
      String file, int offset, bool includePotential);
  Future<List<HoverInformation>> analysisGetHover(String file, int offset);

  Stream<AnalysisErrors> get analysisErrors;
  Stream<CompletionResults> get completionResults;
  Stream<SearchResults> get searchResults;
}
