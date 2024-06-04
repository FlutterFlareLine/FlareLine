import 'dart:convert';

import 'package:dart_openai/dart_openai.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flareline/entity/conversation_entity.dart';
import 'package:flareline/entity/user_entity.dart';
import 'package:flareline/utils/cache_util.dart';
import 'package:flareline/utils/login_util.dart';
import 'package:flareline_uikit/core/event/global_event.dart';
import 'package:flareline_uikit/service/base_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class LoginStatusProvider extends BaseProvider {

  @override
  bool get isRegisterEventBus => true;

  UserEntity? _user;

  LoginStatusProvider(super.context);

  UserEntity? get user => _user ??= LoginUtil.loginUser();

  String get email => LoginUtil.email;

  @override
  void handleEventBus(BuildContext context, EventInfo eventInfo) {
    if(eventInfo.eventType=='loginSuccess'){
      if(eventInfo.obj is UserEntity) {
        _user = eventInfo.obj;
        _saveLogin(eventInfo.obj);
        _saveEmail(eventInfo.obj.email);
      }
    }
  }

  _saveLogin(UserEntity userEntity) {
    CacheUtil.instance.write("loginUser", userEntity.toString());
  }

  _saveEmail(String? email) {
    CacheUtil.instance.write("email", email??'');
  }


  @override
  void init(BuildContext context) {
    // TODO: implement init
  }



}
