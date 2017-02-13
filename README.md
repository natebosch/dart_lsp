# Dart Language Server

Wraps the dart analysis server and adapts it to the [language server protocol].

[language server protocol]: https://github.com/Microsoft/language-server-protocol

This is a very early and very experimental project to test the feasibility of
integrating the [dart analysis server] with an editor following a different api
than it's [default][analysis server api].

[dart analysis server]: https://github.com/dart-lang/sdk/tree/master/pkg/analysis_server
[analysis server api]: https://goo.gl/02kGvm

## Dart Language Server

The executable `dart_language_server` implements a partial adapter of the
analysis server following the language server protocol.

### Features

Support is working or planned for:

- [ ] Initialize/Configuration calls (`initialize`, capabilities, etc)
- [x] File tracking (open, change)
- [x] Diagnostic notifications
- [x] Completion suggestions
- [ ] Jump to definition

Support for further language server features is not planned.

# Installing

`pub global activate dart_language_server`

If you have the pub bin directory in your path (you should be warned during the
previous command if not) the server can be run as `dart_language_server`.

# A note on compatibility

Development is done based on the protocol spec but not against a reference
editor plugin - there are likely to be protocol bugs.
