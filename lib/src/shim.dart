import 'dart:async';

import 'package:analysis_server_lib/analysis_server_lib.dart'
    hide Position, Location;
import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as p;

import 'apply_change.dart';
import 'args.dart';
import 'capabilities.dart';
import 'logging/logs.dart';
import 'position_convert.dart';
import 'protocol/language_server/interface.dart';
import 'protocol/language_server/messages.dart';
import 'utils/command_cache.dart';
import 'utils/file_cache.dart';
import 'utils/guid.dart';
import 'utils/package_dir_detection.dart';
import 'utils/per_file_pool.dart';

Future<LanguageServer> startShimmedServer(StartupArgs args) async {
  var client = await AnalysisServer.create(
      onRead: (m) => analyzerSink.add('OUT: $m\n'),
      onWrite: (m) => analyzerSink.add('IN: $m\n'),
      serverArgs: args.analysisServerArgs);
  await client.server.onConnected.first;
  return new AnalysisServerAdapter(client, args);
}

/// Wraps an [AnalysisServer] and exposes it as a [LanguageServer].
class AnalysisServerAdapter extends LanguageServer {
  final AnalysisServer _server;
  final StartupArgs _args;

  final _files = new FileCache();
  final _pools = new PerFilePool();
  final _commands = new CommandCache();
  final _fileVersions = <String, int>{};

  final _log = new Logger('AnalysisServerAdapter');

  AnalysisServerAdapter(this._server, this._args) {
    _listeners();
  }

  final _openDirectories = new Set<String>();
  final _openFiles = new Set<String>();

  ClientCapabilities clientCapabilities;

  @override
  Future<ServerCapabilities> initialize(int clientPid, String rootUri,
      ClientCapabilities clientCapabilities, String trace) async {
    this.clientCapabilities = clientCapabilities;
    final directory = _filePath(rootUri);
    final clientName = '${p.basename(directory)}-$clientPid';
    startLogging(clientName, _args.forceTraceLevel ?? trace);
    return serverCapabilities;
  }

  /// If [directory] is not already present in or underneath [_openDirectories]
  /// look for a parent that might be a package and add it.
  Future<Null> _addAnalysisRoot(String directory) async {
    if (!_openDirectories.contains(directory) &&
        !_openDirectories.any((d) => p.isWithin(d, directory))) {
      var packageDir = findParentPackageDir(directory);
      if (packageDir != null) {
        _openDirectories.add(packageDir);
        await _server.analysis
            .setAnalysisRoots(_openDirectories.toList(), const []);
      } else {
        _openDirectories.add(directory);
        await _server.analysis
            .setAnalysisRoots(_openDirectories.toList(), const []);
      }
    }
  }

  @override
  Future<Null> get onDone => _onDone.future;
  final _onDone = new Completer<Null>();
  bool _hasShutdown = false;

  @override
  Future<Null> shutdown() async {
    _hasShutdown = true;
    await _server.dispose();
  }

  @override
  void exit() {
    if (_hasShutdown) {
      _onDone.complete();
    } else {
      _server.dispose();
      _onDone.completeError('Exit called before shutdown');
    }
  }

  @override
  Future<Null> textDocumentDidOpen(TextDocumentItem document) async {
    final path = _filePath(document.uri);
    await _pools.lock(path, () async {
      _files[path] = findLineLengths(document.text);
      _fileVersions[path] = document.version;
      var directory = p.dirname(path);
      await _addAnalysisRoot(directory);
      _openFiles.add(path);
      await _server.analysis.setPriorityFiles(_openFiles.toList());
      await _server.analysis
          .updateContent({path: new AddContentOverlay(document.text)});
    });
  }

  @override
  Future<Null> textDocumentDidChange(VersionedTextDocumentIdentifier documentId,
      List<TextDocumentContentChangeEvent> changes) async {
    final path = _filePath(documentId.uri);
    await _pools.lock(path, () async {
      if (_fileVersions[path] > documentId.version) {
        _log.warning('Ignoring file change for $path at version '
            '${documentId.version} since last seen in ${_fileVersions[path]}');
        return;
      }
      _fileVersions[path] = documentId.version;
      if (changes.length == 1 && changes.first.range == null) {
        _files[path] = findLineLengths(changes.single.text);
        await _server.analysis
            .updateContent({path: new AddContentOverlay(changes.single.text)});
      } else {
        var overlay = new ChangeContentOverlay(changes.map((change) {
          var sourceEdit = _toSourceEdit(_files[path], change);
          _files[path] = applyChange(_files[path], change);
          return sourceEdit;
        }).toList());
        await _server.analysis.updateContent({path: overlay});
      }
    });
  }

  @override
  Future<Null> textDocumentDidClose(TextDocumentIdentifier documentId) async {
    final path = _filePath(documentId.uri);
    await _pools.lock(path, () async {
      await _server.analysis.updateContent({path: new RemoveContentOverlay()});
    });
  }

  @override
  Future<CompletionList> textDocumentCompletion(
      TextDocumentIdentifier documentId, Position position) async {
    final path = _filePath(documentId.uri);
    return _pools.lock(path, () async {
      var offset = offsetFromPosition(_files[path], position);
      var id = (await _server.completion.getSuggestions(path, offset)).id;
      if (id == null) {
        return new CompletionList((b) => b
          ..isIncomplete = false
          ..items = const []);
      }
      _completionPaths[id] = path;
      return (_completions[id] = new Completer<CompletionList>()).future;
    });
  }

  final _completions = <String, Completer<CompletionList>>{};
  final _completionPaths = <String, String>{};
  void _listeners() {
    _server.completion.onResults.listen((results) {
      var id = results.id;
      if (!_completions.containsKey(id)) throw 'Missing completion $id';
      var path = _completionPaths.remove(id);
      _completions
          .remove(id)
          .complete(_toCompletionList(_files[path], results));
    });
    _server.search.onResults.listen((results) {
      var id = results.id;
      if (_searchResults.containsKey(id)) {
        _searchResults.remove(id).complete(_toLocationList(results, _files));
        return;
      }
      if (_highlightResults.containsKey(id)) {
        _highlightResults.remove(id)(results);
        return;
      }
      _log.severe('Missing handler for search result $id');
    });
  }

  @override
  Future<Location> textDocumentDefinition(
      TextDocumentIdentifier documentId, Position position) async {
    final path = _filePath(documentId.uri);
    return _pools.lock(path, () async {
      var offset = offsetFromPosition(_files[path], position);
      var result = await _server.analysis.getNavigation(path, offset, 1);
      if (result.targets.isEmpty) return null;
      return _navigationLocations(result).first;
    });
  }

  Iterable<Location> _navigationLocations(NavigationResult result) =>
      result.targets.map((t) {
        var file = result.files[t.fileIndex];
        return new Location((b) => b
          ..uri = _toFileUri(file)
          ..range = rangeFromOffset(_files[file], t.offset, t.length));
      });

  @override
  Future<List<Location>> textDocumentReferences(
      TextDocumentIdentifier documentId,
      Position position,
      ReferenceContext context) {
    final path = _filePath(documentId.uri);
    return _pools.lock(path, () async {
      var offset = offsetFromPosition(_files[path], position);
      var id =
          (await _server.search.findElementReferences(path, offset, true)).id;
      if (id == null) return const [];
      var references =
          (_searchResults[id] = new Completer<List<Location>>()).future;
      if (context.includeDeclaration) {
        var definition = await _server.analysis.getNavigation(path, offset, 1);
        return (await references)..addAll(_navigationLocations(definition));
      }
      return references;
    });
  }

  @override
  Future<List<DocumentHighlight>> textDocumentHighlights(
      TextDocumentIdentifier documentId, Position position) {
    final path = _filePath(documentId.uri);
    return _pools.lock(path, () async {
      var offset = offsetFromPosition(_files[path], position);
      var id =
          (await _server.search.findElementReferences(path, offset, false)).id;
      if (id == null) return const [];
      var completer = new Completer<List<DocumentHighlight>>();
      _highlightResults[id] = (searchResults) =>
          completer.complete(_toHighlightList(searchResults, path, _files));
      var definition = await _server.analysis.getNavigation(path, offset, 1);
      var result = await completer.future
          .timeout(const Duration(milliseconds: 200), onTimeout: () => []);
      if (definition.targets.length == 1 &&
          path == definition.files[definition.targets.single.fileIndex]) {
        // Definitions seem nonsensical when there are more than one
        var target = definition.targets.single;
        result.add(new DocumentHighlight((b) => b
          ..range = rangeFromOffset(_files[path], target.offset, target.length)
          ..kind = DocumentHighlightKind.text));
      }
      return result;
    });
  }

  @override
  Future<Hover> textDocumentHover(
      TextDocumentIdentifier documentId, Position position) async {
    final path = _filePath(documentId.uri);
    return _pools.lock(path, () async {
      var offset = offsetFromPosition(_files[path], position);
      var hovers = (await _server.analysis.getHover(path, offset)).hovers;
      if (hovers.isEmpty) return null;
      var hover = hovers.first;
      var range = rangeFromOffset(_files[path], hover.offset, hover.length);
      return new Hover((b) => b
        ..contents = _hoverMessage(hover)
        ..range = range);
    });
  }

  @override
  Future<List<Command>> textDocumentCodeAction(
      TextDocumentIdentifier documentId,
      Range range,
      CodeActionContext context) async {
    // The only actions supported go through workspace/applyEdit
    if (!(clientCapabilities?.workspace?.applyEdit ?? false)) return const [];

    final path = _filePath(documentId.uri);
    return _pools.lock(path, () async {
      final results = <Command>[];
      List<int> lineLengths = _files[path];
      var offsetLength = offsetLengthFromRange(lineLengths, range);
      var assists = (await _server.edit
              .getAssists(path, offsetLength.offset, offsetLength.length))
          .assists
          .where(
              (a) => a.message != 'Convert into block documentation comment');
      results.addAll(assists
          .map((a) => _commands.add(_toCommand(a), () => _applyEdit(a))));

      final fixes =
          (await _server.edit.getFixes(path, offsetLength.offset)).fixes;
      results.addAll(fixes.expand((fix) {
        final prefix = 'Fix [${fix.error.code}]: ';
        return fix.fixes.map(
            (f) => _commands.add(_toCommand(f, prefix), () => _applyEdit(f)));
      }));

      results.add(_commands.add(
          new Command((b) => b
            ..title = 'Organize imports'
            ..command = makeGuid()),
          () => _organizeDirectives(_files[path], path)));

      return results;
    });
  }

  Future<Null> _organizeDirectives(List<int> fileLengths, String path) async {
    final sourceFileEdit = (await _server.edit.organizeDirectives(path)).edit;
    final workspaceEdit = new WorkspaceEdit((b) => b
      ..changes = {
        _toFileUri(sourceFileEdit.file): sourceFileEdit.edits
            .map((e) => _toTextEdit(fileLengths, e))
            .toList()
      });
    _workspaceEdits.add(new ApplyWorkspaceEditParams((b) => b
      ..label = 'Organize Imports'
      ..edit = workspaceEdit));
  }

  @override
  Future<Null> workspaceExecuteCommand(String command) async {
    _commands[command]();
  }

  void _applyEdit(SourceChange change) {
    final params = new ApplyWorkspaceEditParams((b) => b
      ..label = change.message
      ..edit = _toWorkspaceEdit(_files, change));
    _workspaceEdits.add(params);
  }

  final _searchResults = <String, Completer<List<Location>>>{};
  final _highlightResults = <String, void Function(SearchResults)>{};

  final _filesWithDiagnostics = new Set<String>();
  @override
  Stream<Diagnostics> get diagnostics => _server.analysis.onErrors
      .map((errors) {
        var lines = _files[errors.file];
        return _toDiagnostics(lines, errors);
      })
      .distinct()
      .where((diagnostics) {
        if (diagnostics.diagnostics.isEmpty) {
          if (!_filesWithDiagnostics.contains(diagnostics.uri)) {
            return false;
          } else {
            _filesWithDiagnostics.remove(diagnostics.uri);
          }
        } else {
          _filesWithDiagnostics.add(diagnostics.uri);
        }
        return true;
      });

  @override
  Stream<ApplyWorkspaceEditParams> get workspaceEdits => _workspaceEdits.stream;
  final _workspaceEdits = new StreamController<ApplyWorkspaceEditParams>();

  @override
  Future<WorkspaceEdit> textDocumentRename(TextDocumentIdentifier documentId,
      Position position, String newName) async {
    final path = _filePath(documentId.uri);
    final offset = offsetFromPosition(_files[path], position);
    final result = await _server.edit.getRefactoring(
        'RENAME', path, offset, 0, false,
        options: new RenameRefactoringOptions(newName: newName));
    return _toWorkspaceEdit(_files, result.change);
  }

  @override
  void setupExtraMethods(Peer peer) {
    peer
      ..registerMethod('dart/getServerPort', () async {
        final result = await _server.diagnostic.getServerPort();
        return result.port;
      });
  }
}

String _hoverMessage(HoverInformation hover) {
  var message = new StringBuffer();
  if (hover.elementDescription != null) {
    message.writeln(hover.elementDescription);
  }
  if (hover.isDeprecated) message.writeln('(deprecated)');
  if (hover.dartdoc != null) {
    if (message.isNotEmpty) message.writeln();
    message.writeln(hover.dartdoc);
  }
  return '$message';
}

String _filePath(String fileUri) =>
    Uri.decodeComponent(Uri.parse(fileUri).path);

List<Location> _toLocationList(SearchResults results, FileCache files) =>
    results.results
        .map((result) => result.location)
        .toSet()
        .map((location) => new Location((b) => b
          ..uri = _toFileUri(location.file)
          ..range = rangeFromLocation(files[location.file], location)))
        .toList();

List<DocumentHighlight> _toHighlightList(
        SearchResults results, String path, FileCache files) =>
    results.results
        .where((result) => result.location.file == path)
        .map((result) => new DocumentHighlight((b) => b
          ..range =
              rangeFromLocation(files[result.location.file], result.location)
          ..kind = _documentHighlightKind(result)))
        .toList();

DocumentHighlightKind _documentHighlightKind(SearchResult result) =>
    result.kind == 'READ'
        ? DocumentHighlightKind.read
        : result.kind == 'READ_WRITE' || result.kind == 'WRITE'
            ? DocumentHighlightKind.write
            : DocumentHighlightKind.text;

Diagnostics _toDiagnostics(List<int> lineLengths, AnalysisErrors errors) =>
    new Diagnostics((b) => b
      ..uri = _toFileUri(errors.file)
      ..diagnostics = errors.errors
          .map((error) => _toDiagnostic(lineLengths, error))
          .toList());

String _toFileUri(String path) => '${new Uri.file(path)}';

CompletionList _toCompletionList(
        List<int> lineLengths, CompletionResults results) =>
    new CompletionList((b) => b
      ..isIncomplete = !results.isLast
      ..items = results.results
          .map((r) => _toCompletionItem(lineLengths, r, results))
          .toList());

CompletionItem _toCompletionItem(List<int> lineLengths,
    CompletionSuggestion suggestion, CompletionResults results) {
  final symbol = _completionSymbol(suggestion);
  return new CompletionItem((b) => b
    ..label = symbol
    ..kind = _completionKind(suggestion)
    ..textEdit = new TextEdit((b) => b
      ..newText = symbol
      ..range = rangeFromOffset(
          lineLengths, results.replacementOffset, results.replacementLength))
    ..detail = _completionItemDetail(suggestion)
    ..documentation = suggestion.docComplete);
}

/// Normalize completions since snippets aren't supported.
///
/// Analysis Server expects to be able to send `selectionOffset` and
/// `selectionLength` to move the cursor and give a better UX. Normalize the
/// cases that depend on this that are particularly annoying.
String _completionSymbol(CompletionSuggestion suggestion) {
  if (suggestion.completion.endsWith(',')) {
    return suggestion.completion.substring(0, suggestion.completion.length - 1);
  }
  return suggestion.completion;
}

String _completionItemDetail(CompletionSuggestion suggestion) {
  if (suggestion.returnType != null && suggestion.docSummary != null) {
    return '${suggestion.returnType} : ${suggestion.docSummary}';
  }
  if (suggestion.docSummary != null) return suggestion.docSummary;
  if (suggestion.returnType != null) return suggestion.returnType;
  if (suggestion.parameterName != null) {
    if (suggestion.parameterType != null) {
      return '${suggestion.parameterName} : ${suggestion.parameterType}';
    }
    return '${suggestion.parameterName}';
  }
  return null;
}

Diagnostic _toDiagnostic(List<int> lineLengths, AnalysisError error) =>
    new Diagnostic((b) => b
      ..range = rangeFromLocation(lineLengths, error.location)
      ..severity = _diagnosticSeverity(error.severity, error.type)
      ..code = error.code
      ..source = 'Dart analysis server'
      ..message = error.message);

int _diagnosticSeverity(String severity, String type) {
  if (severity == 'ERROR') return 1;
  if (severity == 'WARNING') return 2;
  return (type == 'INFO') ? 4 : 3;
}

CompletionItemKind _completionKind(CompletionSuggestion suggestion) {
  if (suggestion.element != null) {
    switch (suggestion.element.kind) {
      case 'GETTER':
      case 'SETTER':
      case 'FIELD':
        return CompletionItemKind.field;
      case 'FUNCTION':
        return CompletionItemKind.function;
      case 'METHOD':
        return CompletionItemKind.method;
      case 'LOCAL_VARIABLE':
      case 'TOP_LEVEL_VARIABLE':
        return CompletionItemKind.variable;
      case 'CLASS_ELEMENT':
      case 'CLASS_TYPE_ALIAS':
        return CompletionItemKind.classKind;
      case 'CONSTRUCTOR':
        return CompletionItemKind.constructor;
      case 'ENUM_CONSTANT':
      case 'ENUM_ELEMENT':
        return CompletionItemKind.enumKind;
      case 'FILE':
        return CompletionItemKind.file;
      case 'LIBRARY':
      case 'COMPILATION_UNIT':
        return CompletionItemKind.module;
    }
  }
  switch (suggestion.kind) {
    case 'ARGUMENT_LIST':
      return CompletionItemKind.snippet; // ?
    case 'IMPORT':
      return CompletionItemKind.module; // ?
    case 'IDENTIFIER':
      return CompletionItemKind.reference;
    case 'INVOCATION':
      return CompletionItemKind.method;
    case 'KEYWORD':
      return CompletionItemKind.keyword;
    case 'NAMED_ARGUMENT':
    case 'OPTIONAL_ARGUMENT':
      return CompletionItemKind.snippet; // ?
    case 'PARAMETER':
      return CompletionItemKind.value; //?
    default:
      return null;
  }
}

SourceEdit _toSourceEdit(
        Iterable<int> lineLengths, TextDocumentContentChangeEvent change) =>
    new SourceEdit(offsetFromPosition(lineLengths, change.range.start),
        change.rangeLength, change.text);

Command _toCommand(SourceChange change, [String messagePrefix]) =>
    new Command((b) => b
      ..title = messagePrefix != null
          ? '$messagePrefix${change.message}'
          : change.message
      ..arguments = const []
      ..command = makeGuid());

WorkspaceEdit _toWorkspaceEdit(FileCache fileCache, SourceChange change) =>
    new WorkspaceEdit((b) => b
      ..changes = new Map<String, List<TextEdit>>.fromIterable(change.edits,
          key: (edit) => _toFileUri(edit.file),
          value: (edit) => edit.edits
              .map((e) => _toTextEdit(fileCache[edit.file], e))
              .toList()));

TextEdit _toTextEdit(Iterable<int> lineLengths, SourceEdit edit) =>
    new TextEdit((b) => b
      ..newText = edit.replacement
      ..range = rangeFromOffset(lineLengths, edit.offset, edit.length));
