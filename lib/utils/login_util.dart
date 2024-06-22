import 'dart:convert';

import 'package:flareline/entity/user_entity.dart';
import 'package:flareline/utils/cache_util.dart';


class LoginUtil{

  static String get email => CacheUtil.instance.read("email") ?? '';

  static bool isLogin() {
    print('check login status');
    dynamic loginUser = CacheUtil.instance.read("loginUser");

    return loginUser != null;
  }

  static saveLogin(UserEntity userEntity) {
    CacheUtil.instance.write("loginUser", userEntity.toString());
  }

  static saveEmail(String? email) {
    CacheUtil.instance.write("email", email??'');
  }

  static UserEntity? loginUser() {
    dynamic loginUser = CacheUtil.instance.read("loginUser");
    if(loginUser!=null) {
      UserEntity? userEntity = UserEntity.fromJson(jsonDecode(loginUser));
      return userEntity;
    }
    return null;
  }

  static Future<void> logout() async {
    CacheUtil.instance.remove('loginUser');
  }
}