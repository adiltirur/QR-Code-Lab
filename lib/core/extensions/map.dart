extension TDMap<K, V> on Map<K, V> {
  List<V2> mapToList<V2>(V2 Function(K key, V value) convert) {
    return map((key, value) => MapEntry(key, convert(key, value)))
        .values
        .toList();
  }

  List<V2> mapToListNoNulls<V2>(V2? Function(K key, V value) convert) {
    return map((key, value) => MapEntry(key, convert(key, value)))
        .values
        .whereType<V2>()
        .toList();
  }

  Map<RK, RV>? tryCast<RK, RV>() {
    for (var entry in entries) {
      if (entry.key is! RK || entry.value is! RV) {
        return null;
      }
    }
    return Map<RK, RV>.from(cast<RK, RV>());
  }
}
