// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageEntity _$MessageEntityFromJson(Map<String, dynamic> json) =>
    MessageEntity()
      ..id = json['id'] as String
      ..content = json['content'] as String
      ..isUser = json['isUser'] as bool
      ..timestamp = json['timestamp'] as int
      ..belongUid = json['belongUid'] as String
      ..conversationId = json['conversationId'] as String
      ..fromMessageId = json['fromMessageId'] as String;

Map<String, dynamic> _$MessageEntityToJson(MessageEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'isUser': instance.isUser,
      'timestamp': instance.timestamp,
      'belongUid': instance.belongUid,
      'conversationId': instance.conversationId,
      'fromMessageId': instance.fromMessageId,
    };
