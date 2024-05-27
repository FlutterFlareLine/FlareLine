

import 'package:flareline/core/cache/cache_item.dart';

/// SimpleCache is a simple and fast in-memory cache.
class MemoryCache {
  /// Private Constructor
  MemoryCache._();

  /// Singleton instance of MemoryCache.
  static final MemoryCache instance = MemoryCache._();

  /// Public Constructor
  MemoryCache();

  /// internal cache
  final Map<String, CacheItem> _cache = {};

  /// Checks if cache is empty.
  bool get isEmpty {
    _cache.removeWhere((key, value) => _isExpired(value));
    return _cache.isEmpty;
  }

  /// Checks if cache is not empty.
  bool get isNotEmpty => !isEmpty;

  /// If cache contains a value for the [key], returns the value.
  /// If cache does not contains a value for the [key], returns null.
  T? read<T>(String key) {
    if (_expiryAwareContains(key)) {
      final item = _cache[key]!;
      return item.value;
    }
    return null;
  }

  /// Sets the [value] to the cache.
  /// If cache contains a value for the [key], overrides the value in the cache.
  void create<T>(String key, T value, {Duration? expiry}) {
    _cache[key] = CacheItem<T>.create(value, expiry: _setExpiry(expiry));
  }

  /// If cache does not contains a value for the [key], sets the [value] to the cache and returns true.
  /// If cache contains a value for the [key], returns false.
  bool createIfAbsent<T>(String key, T value, {Duration? expiry}) {
    if (!_expiryAwareContains(key)) {
      create(key, value, expiry: expiry);
      return true;
    }
    return false;
  }

  /// If cache contains a value for the [key], updates the value on the cache and returns true.
  /// If cache does not contains a value for the [key], returns false.
  bool update<T>(String key, T value, {Duration? expiry}) {
    if (_expiryAwareContains(key)) {
      _cache[key] = _cache[key]!.copyWith(
        value: value,
        expiry: _setExpiry(expiry),
      );
      return true;
    }
    return false;
  }

  /// Removes value from cache.
  void delete(String key) {
    _cache.remove(key);
  }

  /// Invalidates all cached values.
  void invalidate() {
    _cache.clear();
  }

  /// Returns true if cached value exists.
  bool contains(String key) {
    return _expiryAwareContains(key);
  }

  /// Adds [expiry] to DateTime.now() and returns it.
  DateTime? _setExpiry(Duration? expiry) =>
      expiry != null ? DateTime.now().add(expiry) : null;

  /// Checks if [item] is expired.
  bool _isExpired(CacheItem item) {
    if (item.expiry != null && item.expiry!.isBefore(DateTime.now())) {
      return true;
    }
    return false;
  }

  /// Returns true if cached value exists but not expired.
  /// If cached value expired removes from cache.
  bool _expiryAwareContains(String key) {
    final item = _cache[key];
    if (item == null) {
      return false;
    } else if (_isExpired(item)) {
      delete(key);
      return false;
    }
    return true;
  }
}