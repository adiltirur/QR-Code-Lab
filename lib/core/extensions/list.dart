import 'map.dart';

extension TDList<E> on List<E> {
  List<T> mapIndexed<T>(T Function(int index, E e) mapper) {
    return asMap().mapToList((i, e) => mapper(i, e));
  }

  List<T> mapIndexedNoNulls<T>(T? Function(int index, E e) mapper) {
    return asMap().mapToListNoNulls((i, e) => mapper(i, e));
  }

  static List<int> generateIndexes(int n) =>
      List<int>.generate(n, (index) => index);

  List<E> operator *(int n) {
    final list = <E>[];
    for (var i = 0; i < n; ++i) {
      list.addAll(this);
    }
    return list;
  }

  void update({
    required bool Function(E element) test,
    required void Function(E element) ifExists,
    required E ifNotExists,
  }) {
    final index = indexWhere(test);
    if (index == -1) {
      add(ifNotExists);
    } else {
      ifExists(this[index]);
    }
  }

  bool get areAllUnique => toSet().length == length;

  List<E> withoutDuplicates(bool Function(E a, E b)? isEqual) {
    final isEqualAux = isEqual ?? (a, b) => a == b;
    final result = <E>[];
    for (var i = 0; i < length; ++i) {
      final element = this[i];
      if (result.tryFirstWhere((e) => isEqualAux(e, element)) == null) {
        result.add(element);
      }
    }
    return result;
  }

  void sortComparable(
    Comparable? Function(E e) getComparable, [
    bool ascending = true,
  ]) {
    sort((a, b) {
      final comparableA = getComparable(a), comparableB = getComparable(b);
      if (comparableA != null && comparableB != null) {
        return ascending
            ? comparableA.compareTo(comparableB)
            : comparableB.compareTo(comparableA);
      }
      if (comparableA == null && comparableB != null) {
        return 1;
      }
      if (comparableA != null && comparableB == null) {
        return -1;
      }
      return 0;
    });
  }

  void swap(int index1, int index2) {
    final tmp = this[index1];
    this[index1] = this[index2];
    this[index2] = tmp;
  }

  List<R>? tryCast<R>() {
    for (var item in this) {
      if (item is! R) {
        return null;
      }
    }
    return cast<R>().toList();
  }

  List<E> insertInBetween(E e) {
    if (length == 0) {
      return this;
    }
    return List<E>.generate(length * 2 - 1, (i) => i.isEven ? this[i ~/ 2] : e);
  }
}

extension TDComparableList<E extends Comparable> on List<E> {
  bool hasSameElementsAs(List<E> other) {
    final list1 = toSet().toList(), list2 = other.toSet().toList();
    list1.sort();
    list2.sort();
    if (list1.length != list2.length) {
      return false;
    }
    for (var i = 0; i < list1.length; ++i) {
      if (list1[i].compareTo(list2[i]) != 0) {
        return false;
      }
    }
    return true;
  }
}

extension TDIterable<E> on Iterable<E> {
  E? get tryFirst => isEmpty ? null : first;

  E? tryFirstWhere(bool Function(E e) test) {
    for (final e in this) {
      if (test(e)) {
        return e;
      }
    }
    return null;
  }

  List<T> mapToList<T>(T Function(E e) mapper) {
    return map(mapper).toList();
  }

  List<T> mapNoNulls<T>(T? Function(E e) mapper) {
    return map((e) => mapper(e)).whereType<T>().toList();
  }

  List<E> whereToList(bool Function(E e) test) {
    return where(test).toList();
  }

  bool containsWhere(bool Function(E e) test) {
    return where(test).isNotEmpty;
  }
}

extension TDStringIterable on Iterable<String?> {
  String removeEmptyItemsAndJoin(String separator) {
    return map((e) => (e ?? '').trim())
        .where((e) => e.isNotEmpty)
        .join(separator);
  }
}
