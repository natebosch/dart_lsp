import 'dart:async';

bool _defaultEquals(left, right) => left == right;

StreamTransformer/*<T,T>*/ distinctUntilChanged/*<T>*/(
    [bool equals(dynamic/*=T*/ left, dynamic/*=T*/ right)]) {
  equals ??= _defaultEquals;
  dynamic/*=T*/ previousValue;
  return new StreamTransformer.fromHandlers(
      handleData: (dynamic/*=T*/ value, EventSink/*<T>*/ sink) {
    if (previousValue != null && equals(previousValue, value)) return;
    previousValue = value;
    sink.add(value);
  });
}
