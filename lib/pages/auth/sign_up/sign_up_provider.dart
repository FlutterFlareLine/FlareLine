
import 'package:flareline_uikit/core/mvvm/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class SignUpProvider extends BaseViewModel {


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
