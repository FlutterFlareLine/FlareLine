import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flareline/entity/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class StoreProvider extends ChangeNotifier {
  final box = GetStorage();

  UserEntity? _user;

  UserEntity? get user => _user ??= loginUser();

  String get email => box.read("email") ?? 'demo@flareline.com';

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

  Future<void> logout() async {
    box.remove('loginUser');
    await FirebaseAuth.instance.signOut();
  }
}
