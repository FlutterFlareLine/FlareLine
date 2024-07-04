
import 'package:flareline_uikit/service/base_provider.dart';
import 'package:flareline_uikit/utils/snackbar_util.dart';
import 'package:flutter/material.dart';

class SignInProvider extends BaseProvider {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  SignInProvider(BuildContext ctx) : super(ctx) {
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
