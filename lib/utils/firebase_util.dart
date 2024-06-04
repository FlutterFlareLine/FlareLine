import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flareline/entity/user_entity.dart';
import 'package:flareline/firebase_options.dart';
import 'package:flareline_uikit/core/event/global_event.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:uuid/uuid.dart';

class FirebaseUtil {
  /// Private Constructor
  FirebaseUtil._();

  /// Singleton instance.
  static final FirebaseUtil instance = FirebaseUtil._();

  Future<FirebaseAnalyticsObserver> init() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    FirebaseAnalytics analytics = FirebaseAnalytics.instance;

    final FirebaseAnalyticsObserver observer =
        FirebaseAnalyticsObserver(analytics: analytics);

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
    ]);

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('authStateChanges User is currently signed out!');
      } else {
        log('authStateChanges User is signed in!');
      }
    });

    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        log('idTokenChanges User is currently signed out!');
      } else {
        log('idTokenChanges User is signed in!');
      }
    });

    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
      } else {
        log('User is signed in!');
      }
    });

    return observer;
  }

  Future<UserCredential> signInWithGoogle() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }

  Future<UserCredential> signInWithGithub() async {
    // Create a new provider
    GithubAuthProvider githubProvider = GithubAuthProvider();

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(githubProvider);
  }

  Future<UserEntity> login(User user) async {
    UserEntity? userEntity = await generateUserEntity(user);
    userEntity.token = user.refreshToken;
    GlobalEvent.eventBus.fire(EventInfo(userEntity, 'loginSuccess'));
    return userEntity;
  }

  Future<UserEntity> generateUserEntity(User user) async {
    UserEntity userEntity = UserEntity();
    userEntity.uid = Uuid().v1();
    userEntity.email = user.email ?? '';
    userEntity.avatar = user.photoURL;
    userEntity.displayName = user.displayName;
    userEntity.phoneNumber = user.phoneNumber;
    userEntity.platformUid = user.providerData.first.uid;
    userEntity.platform = user.providerData.first.providerId;
    userEntity.token = user.refreshToken;
    return userEntity;
  }

}
