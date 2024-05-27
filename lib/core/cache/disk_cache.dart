import 'dart:convert';

import 'package:flareline/core/cache/cache_item.dart';
import 'package:get_storage/get_storage.dart';

/// SimpleCache is a simple and fast in-memory cache.
class DiskCache {
  /// Private Constructor
  DiskCache._();

  /// Singleton instance of MemoryCache.
  static final DiskCache instance = DiskCache._();

  /// Public Constructor
  DiskCache();

  /// internal cache
  // final Map<String, CacheItem> _cache = {};

  final _box = GetStorage();

  /// Checks if cache is empty.
  // bool get isEmpty {
  //   _cache.removeWhere((key, value) => _isExpired(value));
  //   return _cache.isEmpty;
  // }

  /// Checks if cache is not empty.
  // bool get isNotEmpty => !isEmpty;

  /// If cache contains a value for the [key], returns the value.
  /// If cache does not contains a value for the [key], returns null.
  T? read<T>(String key) {
    if (_expiryAwareContains(key)) {
      CacheItem item = _box.read(key);
      return item.value;
    }
    return null;
  }

  /// Sets the [value] to the cache.
  /// If cache contains a value for the [key], overrides the value in the cache.
  void write<T>(String key, T value, {Duration? expiry}) {
    _box.write(
        key,
        CacheItem<T>.create(value,
            expiry: _setExpiry(expiry ?? Duration(hours: 1))));
  }

  /// Removes value from cache.
  void delete(String key) {
    _box.remove(key);
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
    final item = _box.read(key);
    if (item == null) {
      return false;
    } else if (_isExpired(item)) {
      delete(key);
      return false;
    }
    return true;
  }
}
