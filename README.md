# Dart Language Server

Wraps the dart analysis server and adapts it to the [language server protocol].

[language server protocol]: https://github.com/Microsoft/language-server-protocol

This is a very early and very experimental project to test the feasibility of
integrating the [dart analysis server] with an editor following a different api
than it's [default][analysis server api].

[dart analysis server]: https://github.com/dart-lang/sdk/tree/master/pkg/analysis_server
[analysis server api]: https://htmlpreview.github.io/?https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/doc/api.html

## Demo Server

The file `bin/demo_server.dart` implements a language server which is mostly
useful for testing integration against an editor. This server supports file
handling and will send diagnostic errors wherever it sees the string `error` in
a file.

## Dart Language Server

The file `bin/dart_language_server.dart` implements a partial adapter of the
analysis server following the language server protocol. This server supports
file handling and forwards analysis errors as diagnostics.
