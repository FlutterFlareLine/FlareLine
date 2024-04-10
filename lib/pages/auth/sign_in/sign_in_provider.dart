import 'package:firebase_auth/firebase_auth.dart';
import 'package:flareline/entity/user_entity.dart';
import 'package:flareline/provider/firebase_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class SignInProvider with ChangeNotifier {
  final box = GetStorage();

  Future<void> signInWithGoogle(BuildContext context) async {
    UserCredential userCredential =
        await context.read<FirebaseProvider>().signInWithGoogle();
    User? user = userCredential.user;
    print('login user ${user}');
    if (user != null && user.emailVerified) {
      UserEntity userEntity =
          await context.read<FirebaseProvider>().login(user);
      box.write("loginUser", userEntity.toString());
      Navigator.of(context).popAndPushNamed('/');
      return;
    }
    showDialog(
        context: context,
        builder: (ctx) {
          return SizedBox(child: Text('login fail'));
        });
  }
}
