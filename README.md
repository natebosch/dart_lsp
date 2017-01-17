# Dart Language Server

Wraps the dart analysis server and adapts it to the [language server protocol].

[language server protocol]: https://github.com/Microsoft/language-server-protocol

This is a very early and very experimental project to test the feasibility of
integrating the [dart analysis server] with an editor following a different api
than it's [default][analysis server api].

[dart analysis server]: https://github.com/dart-lang/sdk/tree/master/pkg/analysis_server
[analysis server api]: https://goo.gl/02kGvm

## Demo Server

The file `bin/demo_server.dart` implements a language server which is mostly
useful for testing integration against an editor. This server supports file
handling and will send diagnostic errors wherever it sees the string `error` in
a file.

## Dart Language Server

The file `bin/dart_language_server.dart` implements a partial adapter of the
analysis server following the language server protocol. This server supports
file handling and forwards analysis errors as diagnostics.

# Installing

`pub global activate dart_language_server`

If you have the pub bin directory in your path (you should be warned during the
previous command if not) the server can be run as `dart_language_server`.
