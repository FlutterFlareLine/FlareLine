import 'package:dual_screen/dual_screen.dart';
import 'package:free_flutter_admin_dashboard/home.dart';
import 'package:free_flutter_admin_dashboard/pages/FormElements.dart';
import 'package:free_flutter_admin_dashboard/pages/FormLayout.dart';
import 'package:free_flutter_admin_dashboard/pages/Kanban.dart';
import 'package:free_flutter_admin_dashboard/pages/ListPage.dart';
import 'package:free_flutter_admin_dashboard/pages/analytics.dart';
import 'package:free_flutter_admin_dashboard/pages/calendar.dart';
import 'package:free_flutter_admin_dashboard/pages/crm.dart';
import 'package:free_flutter_admin_dashboard/pages/ecommerce.dart';
import 'package:free_flutter_admin_dashboard/pages/marketing.dart';
import 'package:free_flutter_admin_dashboard/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

typedef PathWidgetBuilder = Widget Function(BuildContext, String?);

class Path {
  const Path(this.pattern, this.builder, {this.openInSecondScreen = false});

  /// A RegEx string for route matching.
  final String pattern;

  /// The builder for the associated pattern route. The first argument is the
  /// [BuildContext] and the second argument a RegEx match if that is included
  /// in the pattern.
  ///
  /// ```dart
  /// Path(
  ///   'r'^/demo/([\w-]+)$',
  ///   (context, matches) => Page(argument: match),
  /// )
  /// ```
  final PathWidgetBuilder builder;

  /// If the route should open on the second screen on foldables.
  final bool openInSecondScreen;
}


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
];

class RouteConfiguration {

  static List<Path> paths = [
    Path(
      r'^/',
      (context, match) => HomePage(),
      openInSecondScreen: false,
    ),
  ];

/// The route generator callback used when the app is navigated to a named
  /// route. Set it on the [MaterialApp.onGenerateRoute] or
  /// [WidgetsApp.onGenerateRoute] to make use of the [paths] for route
  /// matching.
  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
    bool hasHinge,
  ) {
    for (final path in paths) {
      final regExpPattern = RegExp(path.pattern);
      if (regExpPattern.hasMatch(settings.name!)) {
        final firstMatch = regExpPattern.firstMatch(settings.name!)!;
        final match = (firstMatch.groupCount == 1) ? firstMatch.group(1) : null;
        if (kIsWeb) {
          return NoAnimationMaterialPageRoute<void>(
            builder: (context) => path.builder(context, match),
            settings: settings,
          );
        }
        if (path.openInSecondScreen && hasHinge) {
          return TwoPanePageRoute<void>(
            builder: (context) => path.builder(context, match),
            settings: settings,
          );
        } else {
          return MaterialPageRoute<void>(
            builder: (context) => path.builder(context, match),
            settings: settings,
          );
        }
      }
    }

    // If no match was found, we let [WidgetsApp.onUnknownRoute] handle it.
    return null;
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
