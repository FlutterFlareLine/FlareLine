// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CacheEntity _$CacheEntityFromJson(Map<String, dynamic> json) => CacheEntity(
      createdAt: json['createdAt'] as int,
      expire: json['expire'] as int?,
      value: json['value'] as String,
    );

Map<String, dynamic> _$CacheEntityToJson(CacheEntity instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'expire': instance.expire,
      'value': instance.value,
    };
