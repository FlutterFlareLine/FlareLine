import 'dart:convert';

import 'package:dart_openai/dart_openai.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flareline/entity/user_entity.dart';
import 'package:flareline_uikit/service/base_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class StoreProvider extends BaseProvider {
  final box = GetStorage();

  UserEntity? _user;

  StoreProvider(super.context);

  UserEntity? get user => _user ??= loginUser();

  String get email => box.read("email") ?? '';

  Map<String, dynamic>? get openAiConfig {
    String? json = box.read("openAiConfig");
    if (json == null) {
      return null;
    }
    return jsonDecode(json);
  }

  String get openAiModel => openAiConfig == null
      ? 'gpt-3.5-turbo'
      : (openAiConfig!['usedModel'] == null || openAiConfig!['usedModel'] == ''
          ? 'gpt-3.5-turbo'
          : openAiConfig!['usedModel']);

  bool isLogin() {
    dynamic loginUser = box.read("loginUser");
    return loginUser != null;
  }

  UserEntity? loginUser() {
    dynamic loginUser = box.read("loginUser");
    UserEntity? userEntity = UserEntity.fromJson(jsonDecode(loginUser));
    return userEntity;
  }

  saveLogin(UserEntity userEntity) {
    box.write("loginUser", userEntity.toString());
  }

  saveEmail(String? email) {
    box.write("email", email);
  }

  saveOpenAi(Map<String, dynamic> config) {
    box.write("openAiConfig", jsonEncode(config));
  }

  Future<void> logout() async {
    box.remove('loginUser');
    await FirebaseAuth.instance.signOut();
  }

  @override
  void init(BuildContext context) {
    // TODO: implement init
  }

}
