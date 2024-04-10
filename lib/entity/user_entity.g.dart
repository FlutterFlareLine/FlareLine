// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity()
  ..uid = json['uid'] as String
  ..email = json['email'] as String
  ..displayName = json['displayName'] as String?
  ..password = json['password'] as String?
  ..platformUid = json['platformUid'] as String?
  ..avatar = json['avatar'] as String?
  ..phoneNumber = json['phoneNumber'] as String?
  ..platform = json['platform'] as String?
  ..creationTime = json['creationTime'] as String?
  ..lastSignInTime = json['lastSignInTime'] as String?
  ..token = json['token'] as String?;

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'displayName': instance.displayName,
      'password': instance.password,
      'platformUid': instance.platformUid,
      'avatar': instance.avatar,
      'phoneNumber': instance.phoneNumber,
      'platform': instance.platform,
      'creationTime': instance.creationTime,
      'lastSignInTime': instance.lastSignInTime,
      'token': instance.token,
    };
