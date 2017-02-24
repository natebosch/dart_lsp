# 0.0.5-dev

- Fix an error with sdk 1.22 where `lineMode` cannot be set on stdin when it is
  a pipe
- Separate logs by client. Log names are prefixed with client's directory and
  pid

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
