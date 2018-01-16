import 'dart:async';

import 'package:logging/logging.dart';
import 'package:pool/pool.dart';

class PerFilePool {
  final _pools = <String, Pool>{};
  final _log = new Logger('OperationPool');

  Future<T> lock<T>(String path, FutureOr<T> Function() operation) => _pools
      .putIfAbsent(path, () => new Pool(1))
      .withResource(_timeout(operation));

  FutureOr<T> Function() _timeout<T>(FutureOr<T> Function() operation) => () {
        var result = operation();
        if (result is Future<T>)
          return result.timeout(const Duration(milliseconds: 500),
              onTimeout: () {
            _log.warning('Operation times out!');
          });
        return result;
      };
}
