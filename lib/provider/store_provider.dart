import 'dart:convert';

import 'package:flareline/entity/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class StoreProvider extends ChangeNotifier {
  final box = GetStorage();

  UserEntity? _user;

  UserEntity? get user => _user ??= loginUser();

  bool isLogin() {
    dynamic loginUser = box.read("loginUser");
    return loginUser != null;
  }

  UserEntity? loginUser() {
    dynamic loginUser = box.read("loginUser");
    UserEntity? userEntity = UserEntity.fromJson(jsonDecode(loginUser));
    return userEntity;
  }

  void logout() {
    box.remove('loginUser');
  }
}
