import 'dart:async';

import 'package:pool/pool.dart';

class PerFilePool {
  final _pools = <String, Pool>{};

  Future<T> lock<T>(String path, FutureOr<T> operation()) =>
      _pools.putIfAbsent(path, () => new Pool(1)).withResource(operation);
}
