class CacheItem<T> {
  final DateTime createdAt;
  final DateTime? expiry;
  final T? value;

  const CacheItem({
    required this.createdAt,
    this.expiry,
    this.value,
  });

  factory CacheItem.create(T? value, {DateTime? expiry}) => CacheItem(
    createdAt: DateTime.now(),
    expiry: expiry,
    value: value,
  );

  CacheItem<T> copyWith({
    DateTime? createdAt,
    DateTime? expiry,
    T? value,
  }) {
    return CacheItem<T>(
      createdAt: createdAt ?? this.createdAt,
      expiry: expiry ?? this.expiry,
      value: value ?? this.value,
    );
  }
}