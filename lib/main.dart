
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flareline/core/theme/global_theme.dart';
import 'package:flareline/provider/localization_provider.dart';
import 'package:flareline/utils/firebase_util.dart';
import 'package:flareline_uikit/service/sidebar_provider.dart';
import 'package:flareline/provider/openai_provider.dart';
import 'package:flareline/provider/login_status_provider.dart';
import 'package:flareline/provider/theme_provider.dart';
import 'package:flareline/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

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

  ///firebase
  FirebaseAnalyticsObserver observer = await FirebaseUtil.instance.init();

  runApp(MyApp(observer: observer));
}

class MyApp extends StatelessWidget {
  FirebaseAnalyticsObserver? observer;

  MyApp({super.key, this.observer});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider(_)),//theme
          ChangeNotifierProvider(create: (_) => SideBarProvider(_)),//sidebar
          ChangeNotifierProvider(create: (_) => LoginStatusProvider(_)),//login status
          ChangeNotifierProvider(create: (_) => LocalizationProvider(_)),//localization
          ChangeNotifierProvider(create: (_) => OpenAIProvider(_)),//open ai
        ],
        child: Builder(builder: (context) {
          context.read<OpenAIProvider>().initOpenApiConfig(context);
          return MaterialApp(
            navigatorKey: RouteConfiguration.navigatorKey,
            restorationScopeId: 'rootFlareLine',
            title: 'FlareLine',
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
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
