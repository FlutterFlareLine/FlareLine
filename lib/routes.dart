import 'package:flareline/crm/home/crm_home_page.dart';
import 'package:flareline/pages/ai/ai_page.dart';
import 'package:flareline/pages/chat/chat_page.dart';
import 'package:flareline/pages/chatgpt/chatgpt_page.dart';
import 'package:flareline/pages/dictionary/dictionary_page.dart';
import 'package:flareline/pages/modal/modal_page.dart';
import 'package:flareline/pages/table/contacts_page.dart';
import 'package:flareline/pages/toast/toast_page.dart';
import 'package:flareline/pages/tools/tools_page.dart';
import 'package:flareline/provider/login_status_provider.dart';
import 'package:flareline/utils/login_util.dart';
import 'package:flutter/material.dart';
import 'package:flareline/pages/alerts/alert_page.dart';
import 'package:flareline/pages/button/button_page.dart';
import 'package:flareline/pages/form/form_elements_page.dart';
import 'package:flareline/pages/form/form_layout_page.dart';
import 'package:flareline/pages/auth/sign_in/sign_in_page.dart';
import 'package:flareline/pages/auth/sign_up/sign_up_page.dart';
import 'package:flareline/pages/calendar/calendar_page.dart';
import 'package:flareline/pages/chart/chart_page.dart';
import 'package:flareline/pages/dashboard/ecommerce_page.dart';
import 'package:flareline/pages/inbox/index.dart';
import 'package:flareline/pages/invoice/invoice_page.dart';
import 'package:flareline/pages/profile/profile_page.dart';
import 'package:flareline/pages/resetpwd/reset_pwd_page.dart';
import 'package:flareline/pages/setting/settings_page.dart';
import 'package:flareline/pages/table/tables_page.dart';
import 'package:provider/provider.dart';

typedef PathWidgetBuilder = Widget Function(BuildContext, String?);

final List<Map<String, Object>> MAIN_PAGES = [
  {'routerPath': '/', 'widget': const EcommercePage(), 'isWhite': true},
  {'routerPath': '/calendar', 'widget': const CalendarPage(), 'isWhite': true},
  {'routerPath': '/profile', 'widget': const ProfilePage()},
  {'routerPath': '/formElements', 'widget': FormElementsPage(), 'isWhite': true},
  {'routerPath': '/formLayout', 'widget': FormLayoutPage(), 'isWhite': true},
  {'routerPath': '/signIn', 'widget': SignInWidget()},
  {'routerPath': '/signUp', 'widget': SignUpWidget(), 'isWhite': true},
  {
    'routerPath': '/resetPwd',
    'widget': const ResetPwdWidget(),
    'isWhite': true
  },
  {'routerPath': '/invoice', 'widget': const InvoicePage(), 'isWhite': true},
  {'routerPath': '/inbox', 'widget': const InboxWidget(), 'isWhite': true},
  {'routerPath': '/tables', 'widget': const TablesPage(), 'isWhite': true},
  {'routerPath': '/settings', 'widget': SettingsPage()},
  {'routerPath': '/basicChart', 'widget': const ChartPage(), 'isWhite': true},
  {'routerPath': '/buttons', 'widget': const ButtonPage(), 'isWhite': true},
  {'routerPath': '/alerts', 'widget': const AlertPage(), 'isWhite': true},
  {'routerPath': '/contacts', 'widget': ContactsPage(), 'isWhite': true},
  {'routerPath': '/chatGpt', 'widget': ChatGptPage()},
  {'routerPath': '/chat', 'widget': ChatPage()},
  {'routerPath': '/dictionary', 'widget': DictionaryPage()},
  {'routerPath': '/tools', 'widget': ToolsPage(), 'isWhite': true},
  {'routerPath': '/ai', 'widget': AIPage()},
  {'routerPath': '/toast', 'widget': ToastPage(), 'isWhite': true},
  {'routerPath': '/modal', 'widget': ModalPage(), 'isWhite': true},
  {'routerPath': '/crmPage', 'widget': CrmHomePage(), 'isWhite': true},
];

class RouteConfiguration {
  static final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>(debugLabel: 'Rex');

  static BuildContext? get navigatorContext =>
      navigatorKey.currentState?.context;

  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
  ) {
    bool? isLogin = LoginUtil.isLogin();

    String path = settings.name!;

    dynamic map =
        MAIN_PAGES.firstWhere((element) => element['routerPath'] == path);
    bool? isWhite = map['isWhite'];
    if (isWhite == null || !isWhite) {
      if (path == '/signIn') {
        if (isLogin != null && isLogin) {
          path = '/';
        }
      } else {
        if (isLogin == null || !isLogin) {
          path = '/signIn';
        }
      }

      map = MAIN_PAGES.firstWhere((element) => element['routerPath'] == path);
    }

    if (map == null) {
      return null;
    }
    Widget targetPage = map['widget'];

    builder(context, match) {
      return targetPage;
    }

    return NoAnimationMaterialPageRoute<void>(
      builder: (context) => builder(context, null),
      settings: settings,
    );
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required super.builder,
    super.settings,
  });

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
