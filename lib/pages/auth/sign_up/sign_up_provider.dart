
import 'package:flareline_uikit/service/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class SignUpProvider extends BaseProvider {


  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;

  SignUpProvider(super.context) {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
  }

  Future<void> signUp(BuildContext context) async {
    // if (emailController.text.isEmpty ||
    //     passwordController.text.isEmpty ||
    //     rePasswordController.text != passwordController.text) {
    //   SnackBarUtil.showSnack(context, 'Please enter your info');
    //   return;
    // }
    // if (passwordController.text.trim().length < 6) {
    //   SnackBarUtil.showSnack(context, 'Please enter 6+ Characters password');
    //   return;
    // }

    Navigator.of(context).popAndPushNamed('/signIn');
  }
}
