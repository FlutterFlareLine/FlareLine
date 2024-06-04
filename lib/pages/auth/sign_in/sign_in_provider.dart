import 'package:flareline/entity/user_entity.dart';
import 'package:flareline/utils/cache_util.dart';
import 'package:flareline/utils/login_util.dart';
import 'package:flareline/utils/snackbar_util.dart';
import 'package:flareline_uikit/service/base_provider.dart';
import 'package:flutter/material.dart';

class SignInProvider extends BaseProvider {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  SignInProvider(BuildContext ctx) : super(ctx) {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailController.text = LoginUtil.email;
    if (emailController.text.isEmpty ||
        emailController.text == 'demo@flareline.com') {
      emailController.text = 'demo@flareline.com';
      passwordController.text = '123456';
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    SnackBarUtil.showSnack(context, 'Sign In With Google');
  }

  Future<void> signInWithGithub(BuildContext context) async {
    SnackBarUtil.showSnack(context, 'Sign In With Github');
  }

  Future<void> signIn(BuildContext context) async {
    Navigator.of(context).pushNamed('/');
  }
}
