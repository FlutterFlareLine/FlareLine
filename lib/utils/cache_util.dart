import 'dart:convert';

import 'package:flareline/entity/cache_entity.dart';
import 'package:get_storage/get_storage.dart';

/// SimpleCache is a simple and fast in-memory cache.
class CacheUtil {
  /// Private Constructor
  CacheUtil._();

  /// Singleton instance of MemoryCache.
  static final CacheUtil instance = CacheUtil._();

  /// Public Constructor
  CacheUtil();

  /// internal cache
  // final Map<String, CacheEntity> _cache = {};

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
  String? read(String key) {
    String? json = _box.read(key);
    if (json == null||json.isEmpty) {
      return null;
    }
    CacheEntity item = CacheEntity.fromJson(jsonDecode(json));
    if (_isExpired(item)) {
      delete(key);
      return null;
    }

    return null;
  }

  /// Sets the [value] to the cache.
  /// If cache contains a value for the [key], overrides the value in the cache.
  void write(String key, String value, {Duration? expire}) {
    _box.write(
        key,
        jsonEncode(CacheEntity.create(value,
                expire: _setExpiry(expire))
            .toJson()));
  }

  /// Removes value from cache.
  void delete(String key) {
    _box.remove(key);
  }

  /// Returns true if cached value exists.
  bool contains(String key) {
    return _expiryAwareContains(key);
  }

  /// Adds [expire] to DateTime.now() and returns it.
  DateTime? _setExpiry(Duration? expire) =>
      expire != null ? DateTime.now().add(expire) : null;

  /// Checks if [item] is expired.
  bool _isExpired(CacheEntity item) {
    if (item.expire != null &&
        item.expire! < (DateTime.now().millisecondsSinceEpoch)) {
      print('_isExpired ${true}');
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

  void remove(String key) {
    _box.remove(key);
  }
}
