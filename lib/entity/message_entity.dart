import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'message_entity.g.dart';

@JsonSerializable()
class MessageEntity {
  late String id;
  late String content;
  late bool isUser;
  late int timestamp;
  late String belongUid;
  late String conversationId;
  late String fromMessageId;

  MessageEntity();

  factory MessageEntity.fromJson(Map<String, dynamic> json) => _$MessageEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MessageEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }


}
