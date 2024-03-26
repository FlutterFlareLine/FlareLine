import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:free_flutter_admin_dashboard/provider/localization_provider.dart';
import 'package:free_flutter_admin_dashboard/provider/main_provider.dart';
import 'package:free_flutter_admin_dashboard/routes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  usePathUrlStrategy();

  runApp(MyApp());

  doWhenWindowReady(() {
    appWindow.minSize = Size(480, 360);
    appWindow.size = Size.infinite;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MainProvider()),
          ChangeNotifierProvider(create: (_) => LocalizationProvider())
        ],
        child: Builder(builder: (context) {
          return MaterialApp(
            restorationScopeId: 'rootXAdmin',
            title: 'XAdmin',
            debugShowCheckedModeBanner: false,
            // You can use the library anywhere in the app even in theme
            // theme: GlobalTheme.lightThemeData,
            // darkTheme: GlobalTheme.darkThemeData,
            initialRoute: '/',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            onGenerateRoute: (settings) =>
                RouteConfiguration.onGenerateRoute(settings),
          );
        }));
  }
}
