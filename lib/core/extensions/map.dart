extension GSMap<K, V> on Map<K, V> {
  List<V2> mapToList<V2>(V2 Function(K key, V value) convert) {
    return map((key, value) => MapEntry(key, convert(key, value)))
        .values
        .toList();
  }
}
