import 'map.dart';

extension WBList<E> on List<E> {
  List<T> mapIndexed<T>(T Function(int index, E e) mapper) {
    return asMap().mapToList((i, e) => mapper(i, e));
  }
}

extension WBIterable<E> on Iterable<E> {
  E? get tryFirst => isEmpty ? null : first;

  List<T> mapToList<T>(T Function(E e) mapper) {
    return map(mapper).toList();
  }
}
