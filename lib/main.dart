import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:free_flutter_admin_dashboard/provider/main_provider.dart';
import 'package:free_flutter_admin_dashboard/routes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

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
    return  MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => MainProvider())],
          child: Builder(builder: (context) {
            return MaterialApp(
              restorationScopeId: 'rootXAdmin',
              title: 'XAdmin',
              debugShowCheckedModeBanner: false,
              // You can use the library anywhere in the app even in theme
              // theme: GlobalTheme.lightThemeData,
              // darkTheme: GlobalTheme.darkThemeData,
              initialRoute: '/',
              onGenerateRoute: (settings) =>
                  RouteConfiguration.onGenerateRoute(settings),
            );
          }));
  }
}
