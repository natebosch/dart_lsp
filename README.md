# Dart Language Server

Wraps the [dart analysis server] and adapts its [default protocol] to the
[language server protocol].

[dart analysis server]: https://github.com/dart-lang/sdk/tree/master/pkg/analysis_server
[default protocol]: https://goo.gl/02kGvm
[language server protocol]: https://github.com/Microsoft/language-server-protocol

## Features

This server supports:

- Diagnostic notifications
- Completion suggestions
- Jump to definition
- List references
- Hover information
- Document reference highlights
- Document outlines
- Workspace symbol search
- Quick Fixes / Code Actions
- Symbol Rename

## Installing

`pub global activate dart_language_server`

If you have the pub bin directory in your path (you should be warned during the
previous command if not) the server can be run as `dart_language_server`.

Integration with an editor depends on the details of the editor. All
communication with this server is through stdin/stdout.
