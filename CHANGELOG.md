# 0.0.7-dev

- Add logging of uncaught asynchronous error logs to a hardcoded path in /tmp
- Bug Fix: Drop diagnostics for files not opened yet in the editor instead of
  crashing
- Add support for textDocument/references call. Only supports showing references
  in files that have already been opened by the client.

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
