import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flareline/core/theme/global_theme.dart';
import 'package:flareline/pages/setting/open_ai_setting.dart';
import 'package:flareline/provider/firebase_provider.dart';
import 'package:flareline/provider/firebase_store_provider.dart';
import 'package:flareline/provider/localization_provider.dart';
import 'package:flareline/provider/main_provider.dart';
import 'package:flareline/provider/openai_setting_provider.dart';
import 'package:flareline/provider/store_provider.dart';
import 'package:flareline/provider/theme_provider.dart';
import 'package:flareline/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  final FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
  ]);

  if (GetPlatform.isDesktop && !GetPlatform.isWeb) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(1080, 720),
      minimumSize: Size(480, 360),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      // titleBarStyle: TitleBarStyle.hidden,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  runApp(MyApp(observer: observer));
}

class MyApp extends StatelessWidget {
  FirebaseAnalyticsObserver? observer;

  MyApp({super.key, this.observer});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => MainProvider()),
          ChangeNotifierProvider(create: (_) => StoreProvider()),
          ChangeNotifierProvider(create: (_) => FirebaseProvider()),
          ChangeNotifierProvider(create: (_) => FirebaseStoreProvider()),
          ChangeNotifierProvider(create: (_) => LocalizationProvider()),
          ChangeNotifierProvider(create: (_) => OpenAISettingProvider(_))
        ],
        child: Builder(builder: (context) {
          return MaterialApp(
            navigatorKey: RouteConfiguration.navigatorKey,
            restorationScopeId: 'rootFlareLine',
            title: 'FlareLine',
            debugShowCheckedModeBanner: false,
            initialRoute: '/signIn',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            locale: context.watch<LocalizationProvider>().locale,
            supportedLocales: AppLocalizations.supportedLocales,
            onGenerateRoute: (settings) =>
                RouteConfiguration.onGenerateRoute(settings),
            themeMode: context.watch<ThemeProvider>().isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: GlobalTheme.lightThemeData,
            darkTheme: GlobalTheme.darkThemeData,
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.noScaling),
                child: widget!,
              );
            },
            navigatorObservers: [if (observer != null) observer!],
          );
        }));
  }
}
