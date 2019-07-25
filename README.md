# Dart Language Server

Wraps the [dart analysis server] and adapts its [default protocol] to the
[language server protocol].

[dart analysis server]: https://github.com/dart-lang/sdk/tree/master/pkg/analysis_server
[default protocol]: https://goo.gl/02kGvm
[language server protocol]: https://github.com/Microsoft/language-server-protocol

This project is obsolete. The Dart SDK ships with an analysis server which can
run in LSP mode with the `--lsp` flag.

To start up the server use the analysis server snapshot from the `bin` directory
of the SDK.

For example, if the Dart SDK is at `$DART_SDK` and `$DART_SDK/bin/` is on your
`$PATH` (which makes commands like `dart` and `pub` available) the analysis
server can be launched with:
`dart $DART_SDK/snapshots/analysis_server.dart.snapshot --lsp`

You can see an example of configuring the `vim-lsc` client at https://github.com/natebosch/vim-lsc-dart
