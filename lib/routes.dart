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
