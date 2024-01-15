import 'package:dual_screen/dual_screen.dart';
import 'package:flutter/material.dart';
import 'package:free_flutter_admin_dashboard/home.dart';
import 'package:free_flutter_admin_dashboard/pages/FormElements.dart';
import 'package:free_flutter_admin_dashboard/pages/FormLayout.dart';
import 'package:free_flutter_admin_dashboard/pages/Kanban.dart';
import 'package:free_flutter_admin_dashboard/pages/ListPage.dart';
import 'package:free_flutter_admin_dashboard/pages/analytics.dart';
import 'package:free_flutter_admin_dashboard/pages/auth/sign_in.dart';
import 'package:free_flutter_admin_dashboard/pages/auth/sign_up.dart';
import 'package:free_flutter_admin_dashboard/pages/calendar.dart';
import 'package:free_flutter_admin_dashboard/pages/crm.dart';
import 'package:free_flutter_admin_dashboard/pages/ecommerce.dart';
import 'package:free_flutter_admin_dashboard/pages/marketing.dart';
import 'package:free_flutter_admin_dashboard/pages/profile.dart';
import 'package:free_flutter_admin_dashboard/pages/resetpwd/reset_pwd.dart';

typedef PathWidgetBuilder = Widget Function(BuildContext, String?);

const List<Map<String, Object>> MAIN_PAGES = [
  {'routerPath': '/dashboard', 'widget': EcommercePage()},
  {'routerPath': '/analytics', 'widget': AnalyticsPage()},
  {'routerPath': '/marketing', 'widget': MarketingPage()},
  {'routerPath': '/crm', 'widget': CrmPage()},
  {'routerPath': '/calendar', 'widget': CalendarPage()},
  {'routerPath': '/profile', 'widget': ProfilePage()},
  {'routerPath': '/list', 'widget': ListPage()},
  {'routerPath': '/kanban', 'widget': KanbanPage()},
  {'routerPath': '/formElements', 'widget': FormElementsPage()},
  {'routerPath': '/formLayout', 'widget': FormLayoutPage()},
  {'routerPath': '/signIn', 'widget': SignInWidget()},
];

class RouteConfiguration {
  static Map<String, PathWidgetBuilder> paths = {
    '/': (context, match) => HomePage(),
    '/signIn': (context, match) => const SignInWidget(),
    '/signUp': (context, match) => const SignUpWidget(),
    '/resetPwd': (p0, p1) => const ResetPwdWidget(),
  };

  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
  ) {
    String path = settings.name!;
    print(path);
    if (!paths.containsKey(path)) {
      return null;
    }

    PathWidgetBuilder builder = paths[path]!;
    return MaterialPageRoute<void>(
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

class TwoPanePageRoute<T> extends OverlayRoute<T> {
  TwoPanePageRoute({
    required this.builder,
    super.settings,
  });

  final WidgetBuilder builder;

  @override
  Iterable<OverlayEntry> createOverlayEntries() sync* {
    yield OverlayEntry(builder: (context) {
      final hinge = MediaQuery.of(context).hinge?.bounds;
      if (hinge == null) {
        return builder.call(context);
      } else {
        return Positioned(
            top: 0,
            left: hinge.right,
            right: 0,
            bottom: 0,
            child: builder.call(context));
      }
    });
  }
}
