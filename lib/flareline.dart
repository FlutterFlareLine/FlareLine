import 'package:flareline/provider/localization_provider.dart';
import 'package:flareline/provider/login_status_provider.dart';
import 'package:flareline/provider/theme_provider.dart';
import 'package:flareline/routes.dart';
import 'package:flareline_uikit/service/sidebar_provider.dart';
import 'package:provider/provider.dart';

class Flareline {
  static var services = [
    ChangeNotifierProvider(create: (_) => ThemeProvider(_)),
    //theme
    ChangeNotifierProvider(create: (_) => SideBarProvider(_)),
    //sidebar
    ChangeNotifierProvider(create: (_) => LoginStatusProvider(_)),
    //login status
    ChangeNotifierProvider(create: (_) => LocalizationProvider(_)),
    //localizationen ai
  ];

  static var routes = MAIN_PAGES;
}
