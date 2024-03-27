import 'package:flutter/material.dart';
import 'package:free_flutter_admin_dashboard/pages/home/home_page.dart';
import 'package:free_flutter_admin_dashboard/pages/alerts/alert_page.dart';
import 'package:free_flutter_admin_dashboard/pages/button/button_page.dart';
import 'package:free_flutter_admin_dashboard/pages/form/form_elements_page.dart';
import 'package:free_flutter_admin_dashboard/pages/form/form_layout_page.dart';
import 'package:free_flutter_admin_dashboard/pages/kanban/kanban_page.dart';
import 'package:free_flutter_admin_dashboard/pages/list/list_page.dart';
import 'package:free_flutter_admin_dashboard/pages/auth/sign_in_page.dart';
import 'package:free_flutter_admin_dashboard/pages/auth/sign_up_page.dart';
import 'package:free_flutter_admin_dashboard/pages/calendar/calendar_page.dart';
import 'package:free_flutter_admin_dashboard/pages/chart/chart_page.dart';
import 'package:free_flutter_admin_dashboard/pages/crm/crm_page.dart';
import 'package:free_flutter_admin_dashboard/pages/dashboard/ecommerce_page.dart';
import 'package:free_flutter_admin_dashboard/pages/inbox/index.dart';
import 'package:free_flutter_admin_dashboard/pages/invoice/invoice_page.dart';
import 'package:free_flutter_admin_dashboard/pages/marketing/marketing_page.dart';
import 'package:free_flutter_admin_dashboard/pages/profile/profile_page.dart';
import 'package:free_flutter_admin_dashboard/pages/resetpwd/reset_pwd_page.dart';
import 'package:free_flutter_admin_dashboard/pages/setting/settings_page.dart';
import 'package:free_flutter_admin_dashboard/pages/table/tables_page.dart';

typedef PathWidgetBuilder = Widget Function(BuildContext, String?);

final List<Map<String, Object>> MAIN_PAGES = [
  {'routerPath': '/', 'widget': HomePage()},
  {'routerPath': '/dashboard', 'widget': EcommercePage()},
  {'routerPath': '/marketing', 'widget': MarketingPage()},
  {'routerPath': '/crm', 'widget': CrmPage()},
  {'routerPath': '/calendar', 'widget': CalendarPage()},
  {'routerPath': '/profile', 'widget': ProfilePage()},
  {'routerPath': '/list', 'widget': ListPage()},
  {'routerPath': '/kanban', 'widget': KanbanPage()},
  {'routerPath': '/formElements', 'widget': FormElementsPage()},
  {'routerPath': '/formLayout', 'widget': FormLayoutPage()},
  {'routerPath': '/signIn', 'widget': SignInWidget()},
  {'routerPath': '/signUp', 'widget': SignUpWidget()},
  {'routerPath': '/resetPwd', 'widget': ResetPwdWidget()},
  {'routerPath': '/invoice', 'widget': InvoicePage()},
  {'routerPath': '/inbox', 'widget': InboxWidget()},
  {'routerPath': '/tables', 'widget': TablesPage()},
  {'routerPath': '/settings', 'widget': SettingsPage()},
  {'routerPath': '/basicChart', 'widget': ChartPage()},
  {'routerPath': '/buttons', 'widget': ButtonPage()},
  {'routerPath': '/alerts', 'widget': AlertPage()},
];

class RouteConfiguration {

  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
  ) {
    String path = settings.name!;
    print(path);

    dynamic map =
        MAIN_PAGES.firstWhere((element) => element['routerPath'] == path);
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
