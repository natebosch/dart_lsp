# 0.1.1

- Add `lspChannel` to wrap a stream and sink of bytes into a
  `StreamChannel<String>` with the LSP header wireformat handled. This can be
  used to create a JSON RPC `Peer` directly rather than implementing the
  `LanguageServer` interface. Allows using a `Socket` as an alternative to
  `stdin` and `stdout`.

# 0.1.0

- Initial release. Forked from `dart_language_server`.
