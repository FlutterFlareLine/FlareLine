
import 'package:flareline/entity/user_entity.dart';
import 'package:flareline/utils/cache_util.dart';
import 'package:flareline/utils/login_util.dart';
import 'package:flareline_uikit/core/event/global_event.dart';
import 'package:flareline_uikit/service/base_provider.dart';
import 'package:flutter/material.dart';

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
        saveLogin(eventInfo.obj);
        saveEmail(eventInfo.obj.email);
      }
    }
  }

  saveLogin(UserEntity userEntity) {
    CacheUtil.instance.write("loginUser", userEntity.toString());
  }

  saveEmail(String? email) {
    CacheUtil.instance.write("email", email??'');
  }


  @override
  void init(BuildContext context) {
    // TODO: implement init
  }



}
