import 'package:firebase_auth/firebase_auth.dart';
import 'package:flareline/entity/user_entity.dart';
import 'package:flareline/provider/firebase_provider.dart';
import 'package:flareline/provider/store_provider.dart';
import 'package:flareline/utils/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class SignInProvider with ChangeNotifier {
  final box = GetStorage();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  SignInProvider(BuildContext ctx) {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailController.text = ctx.read<StoreProvider>().email;
    if (emailController.text.isEmpty||emailController.text=='demo@flareline.com') {
      emailController.text = 'demo@flareline.com';
      passwordController.text = '123456';
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    UserCredential userCredential =
        await context.read<FirebaseProvider>().signInWithGoogle();
    User? user = userCredential.user;
    debugPrint('login user ${user}');
    if (user != null) {
      UserEntity userEntity =
          await context.read<FirebaseProvider>().login(user);
      context.read<StoreProvider>().saveLogin(userEntity);
      Navigator.of(context).popAndPushNamed('/');
      return;
    }
    SnackBarUtil.showSnack(context, 'Sign In Fail');
  }

  Future<void> signInWithGithub(BuildContext context) async {
    UserCredential userCredential =
        await context.read<FirebaseProvider>().signInWithGithub();
    User? user = userCredential.user;
    debugPrint('login user ${user}');
    if (user != null) {
      UserEntity userEntity =
          await context.read<FirebaseProvider>().login(user);
      context.read<StoreProvider>().saveLogin(userEntity);
      Navigator.of(context).popAndPushNamed('/');
      return;
    }
    SnackBarUtil.showSnack(context, 'Sign In Fail');
  }

  Future<void> signIn(BuildContext context) async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      SnackBarUtil.showSnack(context, 'Please enter your info');
      return;
    }
    if (passwordController.text.trim().length < 6) {
      SnackBarUtil.showSnack(context, 'Please enter 6+ Characters password');
      return;
    }

    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      debugPrint('credential ${credential}');
      if (credential.user != null) {
        User? user = credential.user;
        if (user != null) {
          if (user.email != 'demo@flareline.com' && !user.emailVerified) {
            SnackBarUtil.showSnack(context, 'Please verify your email first');
            return;
          }
          UserEntity userEntity =
              await context.read<FirebaseProvider>().login(user);
          context.read<StoreProvider>().saveLogin(userEntity);
          context.read<StoreProvider>().saveEmail(userEntity.email);
          Navigator.of(context).popAndPushNamed('/');
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        SnackBarUtil.showSnack(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        SnackBarUtil.showSnack(
            context, 'Wrong password provided for that user.');
      }
    } catch (e) {
      SnackBarUtil.showSnack(context, e.toString());
    }
  }
}
