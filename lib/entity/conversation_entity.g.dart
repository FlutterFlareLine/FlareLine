// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationEntity _$ConversationEntityFromJson(Map<String, dynamic> json) =>
    ConversationEntity()
      ..id = json['id'] as String
      ..title = json['title'] as String?
      ..latestMessage = json['latestMessage'] == null
          ? null
          : MessageEntity.fromJson(
              json['latestMessage'] as Map<String, dynamic>)
      ..belongUid = json['belongUid'] as String
      ..timestamp = json['timestamp'] as int
      ..type = json['type'] as String;

Map<String, dynamic> _$ConversationEntityToJson(ConversationEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'latestMessage': instance.latestMessage,
      'belongUid': instance.belongUid,
      'timestamp': instance.timestamp,
      'type': instance.type,
    };
