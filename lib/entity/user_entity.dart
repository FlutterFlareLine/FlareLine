import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
	late String uid;
	late String email;
	String? displayName;
	String? password;
	String? platformUid;
	String? avatar;
	String? phoneNumber;
	String? platform;
	String? creationTime;
	String? lastSignInTime;
	String? token;

	UserEntity();

	factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);

	Map<String, dynamic> toJson() => _$UserEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
