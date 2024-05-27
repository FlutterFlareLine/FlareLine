import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'cache_entity.g.dart';

@JsonSerializable()
class CacheEntity {
  final int createdAt;
  final int? expire;
  final String value;

  const CacheEntity({
    required this.createdAt,
    this.expire,
    required this.value,
  });

  factory CacheEntity.create(dynamic value, {DateTime? expire}) => CacheEntity(
    createdAt: DateTime.now().millisecondsSinceEpoch,
    expire: expire?.millisecondsSinceEpoch,
    value: value,
  );

  CacheEntity copyWith({
    DateTime? createdAt,
    DateTime? expire,
    dynamic value,
  }) {
    return CacheEntity(
      createdAt: createdAt?.millisecondsSinceEpoch ?? this.createdAt,
      expire: expire?.millisecondsSinceEpoch ?? this.expire,
      value: value ?? this.value,
    );
  }

  factory CacheEntity.fromJson(Map<String, dynamic> json) => _$CacheEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CacheEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}