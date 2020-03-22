# 0.1.15

- Add a deprecation warning on `stderr`. This will be the last version that can
  be run as a binary.

# 0.1.14

- Set the `executeCommandProvider` capability.
- Fix bug searching for a package root when receiving a `didOpen` for a document
  in a directory that doesn't exist.

# 0.1.13+2

- Correct `documentHighlightsProviers` capability `documentHighlightProvider`.

# 0.1.13+1

- Fix some static warnings for dev SDK.

# 0.1.13

- Rename `--force_trace_level` argument to `--force-trace-level`. Keep the old
  name as a fallback.
- Add support for sending edits directly with `CodeAction` literals.
- Use the 2.0 stable SDK.

# 0.1.12+2

- Yet another Dart 2 runtime fix: Correct type of `List<SymbolInformation>` for
  `documentSymbols` call.

# 0.1.12+1

- More Dart 2 runtime fixes:
  - Fix a null boolean when loading an empty hover.
  - Fix the reified type of the `List<TextEdit>` for applying workspace edits.

# 0.1.12

- Fix more Dart 2 runtime types for collections deserialized from json.
- Use Windows style newlines in the analyzer wirelog on Windows platform.
- Add support for using `MarkupContent` for hover.

# 0.1.11+6

- Fix compatibility with Dart 2.
- Write uncaught exceptions to `stderr` instead of a temp file.

# 0.1.11+5

- Bug fix for mishandled edits which could cause offset calculations to become
  inaccurate.

# 0.1.11+4

- Bug fix for converting positions in files with windows line endings.

# 0.1.11+3

- Bug fixes for windows file paths:
  - Use `toFilePath()` to convert from URI which uses correct separators.
  - Use `Directory.systemTemp` to use a correct temp directory.
  - Use platform path separators when checking for apparent workspace roots.

# 0.1.11+2

- Bug Fix: Set `implementationProvider` and `workspaceSymbolProvider` to `true`
  in server capabilities since these requests are now supported.

# 0.1.11+1

- Bug Fix: Don't error when `textDocument/implementation` is called with a
  position that is not a symbol that can be implemented.

# 0.1.11

- Add support for `textDocument/implementation`.

# 0.1.10

- Add support for `workspace/symbol`.

# 0.1.9+4

- Bug Fix: Send `null` rather than `false` for `codeLensProvider` and
  `documentOnTypeFormattingProvider`.

# 0.1.9+3

- Bug Fix: Send a `SaveOptions` rather than a `boolean` for
  `ServerCapabilities.textDocumentSync.save`

# 0.1.9+2

- Bug fixes:
  - Reduce the possibilities for Overlays to get out of sync - start requests in
    order and don't put a timeout on the operations that impact file overlays.
  - Increase timeouts for other operations.
  - Flush logs on each message.
  - Improve performance of `textDocument/documentHighlight`. Use `Occurrences`
    subscription which is per-file rather than references request which is
    across the entire workspace.

# 0.1.9+1

- Use the latest `package:async`.

# 0.1.9

- Add 'Sort Members' to available code actions.

# 0.1.8

- Add support for `textDocument/documentSymbol`.

# 0.1.7

- Add `textDocument/documentHighlights`.
- Bug Fix: Calling `textDocument/references` on non-identifiers won't freeze up
  all operations for that document.
- Add a 500ms time for operations that lock per-file.

# 0.1.6

- Chunk writes to stdout.

# 0.1.5+2

- Tolerate keys explicitly set to `null` instead of omitted.

# 0.1.5+1

- Bug Fix: Remove usage of new Function type syntax so to restore compatibility
  with the stable SDK.

# 0.1.5

- Only treat `pubspec.yaml` and `BUILD` files as indications of a package root.
- Only send empty diagnostics for a file if it is clearing previous diagnostics.

# 0.1.4

- Stop adding `rootUri` as an analysis root. When there are nested directories
  that 'look like' a package this can be very large (like with the SDK repo) and
  given the other tweaks to how `didOpen` analysis roots are handled this
  shouldn't be as useful anymore.

# 0.1.3

- Add fixes to available code actions.
- Add support for `textDocument/rename`.
- Run requests for the same file serially rather than allowing them to
  interleave. Fixes some cases where bad overlays can stick around.
- Add 'Organize imports' to every code actions list.
- Never offer "Convert into block documentation comment"
- Add `dart/getServerPort` extension method.
- Strip trailing comma from completions since there is no cursor moving support.

# 0.1.2

- Only add `rootUri` as an analysis root when it or a parent seems to be a
  package directory.
- Add support for code actions.

# 0.1.1

- Bug Fix: Restore analyzer wire log.
- Set the client `rootUri` as an analysis root. Resolves some cases where
  opening a file in a subdirectory can fail to find symbols from directories
  higher up.
- Bug Fix: Set priority files by path rather than URI.
- Add ability to pass arguments to the analysis server.

# 0.1.0

- Add support for `TextDocumentSyncKind.Incremental`.
- Only send changed diagnostics.

# 0.0.16

- Reduce memory usage by caching file line lengths instead of complete content.
- Always reread files that the editor doesn't have open rather than cache their
  line lengths.
- Bug Fix: URI decode file paths.

# 0.0.15

- Report 'Hint' type analysis as a 'Hint' rather than 'Info' diagnostic.
- Use `package:analysis_server_lib`.

# 0.0.14

- Add element description to hover message.

# 0.0.13+1

- Bug Fix: Report support for hover during initialization.

# 0.0.13

- Add `textDocument/hover` - finds the `dartdoc` string for an element.

# 0.0.12

- Include definition in list of element references.

# 0.0.11

- Bug Fix: Conform to spec for headers - use a space after the colon.

# 0.0.10

- Improved `CompletionItemKind` for completion suggestions.

# 0.0.9

- Bug fix: Allow the process to exit when the server is done.

# 0.0.8

- Add more information in completion item `detail` field. Add full doc comment
  to `documentation` field.
- Bug fix: Avoid duplicates in reference list when the same file shows up in
  multiple analysis roots.
- Only write logs when 'verbose' or 'message' trace level is used.

# 0.0.7

- Add logging of uncaught asynchronous error logs to a hardcoded path in /tmp
- Bug Fix: Support forwarding diagnostics for files that haven't already been
  opened in the editor
- Add support for `textDocument/references` call.

# 0.0.6

- Fix a bug for clients which do not send a `trace` parameter to initialize call

# 0.0.5

- Fix an error with sdk 1.22 where `lineMode` cannot be set on stdin when it is
  a pipe
- Separate logs by client. Log names are prefixed with client's directory and
  pid
- Fix a buf causing a stack trace when attempting to jump to a token with no
  definition
- Ignore updates to old file versions

# 0.0.4

- Add the initialize method for better spec compliance

# 0.0.3

- Add support for GoToDefinition

# 0.0.2

- Add (almost entirely untested) support for completion suggestions.
- Correct Range translation for diagnostics which span lines.

# 0.0.1

- Initial experimental version. Starts up the sdk analysis server and forwards
  file state messages and errors. Can be used to show file diagnostics in an
  editor.
