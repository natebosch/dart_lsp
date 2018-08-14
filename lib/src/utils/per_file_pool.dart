import 'dart:async';

import 'package:logging/logging.dart';
import 'package:pool/pool.dart';

class PerFilePool {
  final _pools = <String, Pool>{};
  final _log = Logger('OperationPool');

  Future<T> lock<T>(String path, Future<T> Function() operation,
          {bool withTimeout = true}) =>
      _pools
          .putIfAbsent(path, () => Pool(1))
          .withResource(withTimeout ? _timeout(operation) : operation);

  Future<T> Function() _timeout<T>(Future<T> Function() operation) =>
      () => operation().timeout(const Duration(seconds: 2), onTimeout: () {
            _log.warning('Operation timed out!');
            return null;
          });
}
