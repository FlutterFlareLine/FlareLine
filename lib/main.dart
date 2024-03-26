import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_flutter_admin_dashboard/provider/main_provider.dart';
import 'package:free_flutter_admin_dashboard/routes.dart';
import 'package:free_flutter_admin_dashboard/themes/global_theme.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 720),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiProvider(
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
          })),
    );
  }
}
