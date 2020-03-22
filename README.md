Tools for writing a language server following the [Language Server
Protocol][LSP].

[LSP]: https://github.com/Microsoft/language-server-protocol

Any class implementing `LanguageServer` can be started as a server communicating
over `stdin` and `stdout`. Includes types for all the messages that can be sent
to and from the client.

# Looking for a Dart language server?

The Dart language server implemented in this package is deprecated. Instead, use
the [analysis server][] from the Dart SDK with the `--lsp` flag.

[analysis server]: https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md
