import 'dart:io';

import 'package:flareline/provider/firebase_provider.dart';
import 'package:flareline/provider/localization_provider.dart';
import 'package:flareline/provider/main_provider.dart';
import 'package:flareline/provider/store_provider.dart';
import 'package:flareline/provider/theme_provider.dart';
import 'package:flareline/routes.dart';
import 'package:flareline/themes/global_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
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

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => MainProvider()),
          ChangeNotifierProvider(create: (_) => StoreProvider()),
          ChangeNotifierProvider(create: (_) => FirebaseProvider()),
          ChangeNotifierProvider(create: (_) => LocalizationProvider())
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
            theme: GlobalTheme.theme(context, context.watch<ThemeProvider>().isDark),
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.noScaling),
                child: widget!,
              );
            },
          );
        }));
  }
}
