import 'package:firebase_auth/firebase_auth.dart';
import 'package:flareline/entity/user_entity.dart';
import 'package:flareline/provider/firebase_provider.dart';
import 'package:flareline/provider/localization_provider.dart';
import 'package:flareline/provider/store_provider.dart';
import 'package:flareline/utils/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class SignUpProvider with ChangeNotifier {
  final box = GetStorage();

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;

  SignUpProvider() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
  }

  Future<void> signUp(BuildContext context) async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        rePasswordController.text != passwordController.text) {
      SnackBarUtil.showSnack(context, 'Please enter your info');
      return;
    }
    if (passwordController.text.trim().length < 6) {
      SnackBarUtil.showSnack(context, 'Please enter 6+ Characters password');
      return;
    }

    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      print('credential ${credential}');
      if (credential.user != null) {
        User? user = credential.user;
        if (user != null) {
          context.read<StoreProvider>().saveEmail(user.email);

          await FirebaseAuth.instance.setLanguageCode(
              context.read<LocalizationProvider>().languageCode);
          await user?.sendEmailVerification();

          SnackBarUtil.showSuccess(
              context, 'Sign Up Success, Please verify your email');
          Navigator.of(context).popAndPushNamed('/signIn');
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        SnackBarUtil.showSnack(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        SnackBarUtil.showSnack(
            context, 'The account already exists for that email.');
        Navigator.of(context).popAndPushNamed('/signIn');
      }
    } catch (e) {
      SnackBarUtil.showSnack(context, e.toString());
    }
  }
}
