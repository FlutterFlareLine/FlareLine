import 'package:flareline/deferred_widget.dart';
import 'package:flareline/pages/modal/modal_page.dart' deferred as modal;
import 'package:flareline/pages/table/contacts_page.dart' deferred as contacts;
import 'package:flareline/pages/toast/toast_page.dart' deferred as toast;
import 'package:flareline/pages/tools/tools_page.dart' deferred as tools;
import 'package:flutter/material.dart';
import 'package:flareline/pages/alerts/alert_page.dart' deferred as alert;
import 'package:flareline/pages/button/button_page.dart' deferred as button;
import 'package:flareline/pages/form/form_elements_page.dart' deferred as formElements;
import 'package:flareline/pages/form/form_layout_page.dart' deferred as formLayout;
import 'package:flareline/pages/auth/sign_in/sign_in_page.dart' deferred as signIn;
import 'package:flareline/pages/auth/sign_up/sign_up_page.dart' deferred as signUp;
import 'package:flareline/pages/calendar/calendar_page.dart' deferred as calendar;
import 'package:flareline/pages/chart/chart_page.dart' deferred as chart;
import 'package:flareline/pages/dashboard/ecommerce_page.dart';
import 'package:flareline/pages/inbox/index.dart' deferred as inbox;
import 'package:flareline/pages/invoice/invoice_page.dart' deferred as invoice;
import 'package:flareline/pages/profile/profile_page.dart' deferred as profile;
import 'package:flareline/pages/resetpwd/reset_pwd_page.dart' deferred as resetPwd;
import 'package:flareline/pages/setting/settings_page.dart' deferred as settings;
import 'package:flareline/pages/table/tables_page.dart' deferred as tables;

typedef PathWidgetBuilder = Widget Function(BuildContext, String?);

final List<Map<String, Object>> MAIN_PAGES = [
  {'routerPath': '/', 'widget': const EcommercePage()},
  {'routerPath': '/calendar', 'widget': DeferredWidget(modal.loadLibrary, () => calendar.CalendarPage())},
  {'routerPath': '/profile', 'widget': DeferredWidget(modal.loadLibrary, () => profile.ProfilePage())},
  {
    'routerPath': '/formElements',
    'widget': DeferredWidget(modal.loadLibrary, () => formElements.FormElementsPage()),
  },
  {'routerPath': '/formLayout', 'widget': DeferredWidget(modal.loadLibrary, () => formLayout.FormLayoutPage())},
  {'routerPath': '/signIn', 'widget': DeferredWidget(modal.loadLibrary, () => signIn.SignInWidget())},
  {'routerPath': '/signUp', 'widget': DeferredWidget(modal.loadLibrary, () => signUp.SignUpWidget())},
  {
    'routerPath': '/resetPwd',
    'widget': DeferredWidget(modal.loadLibrary, () => resetPwd.ResetPwdWidget()),
  },
  {'routerPath': '/invoice', 'widget': DeferredWidget(modal.loadLibrary, () => invoice.InvoicePage())},
  {'routerPath': '/inbox', 'widget': DeferredWidget(modal.loadLibrary, () => inbox.InboxWidget())},
  {'routerPath': '/tables', 'widget': DeferredWidget(modal.loadLibrary, () => tables.TablesPage())},
  {'routerPath': '/settings', 'widget': DeferredWidget(modal.loadLibrary, () => settings.SettingsPage())},
  {'routerPath': '/basicChart', 'widget': DeferredWidget(modal.loadLibrary, () => chart.ChartPage())},
  {'routerPath': '/buttons', 'widget': DeferredWidget(modal.loadLibrary, () => button.ButtonPage())},
  {'routerPath': '/alerts', 'widget': DeferredWidget(modal.loadLibrary, () => alert.AlertPage())},
  {'routerPath': '/contacts', 'widget': DeferredWidget(modal.loadLibrary, () => contacts.ContactsPage())},
  {'routerPath': '/tools', 'widget': DeferredWidget(modal.loadLibrary, () => tools.ToolsPage())},
  {'routerPath': '/toast', 'widget': DeferredWidget(modal.loadLibrary, () => toast.ToastPage())},
  {
    'routerPath': '/modal',
    'widget': DeferredWidget(modal.loadLibrary, () => modal.ModalPage())
  },
];

class RouteConfiguration {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'Rex');

  static BuildContext? get navigatorContext =>
      navigatorKey.currentState?.context;

  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
  ) {
    String path = settings.name!;

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
