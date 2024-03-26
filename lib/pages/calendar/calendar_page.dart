import 'package:flutter/material.dart';
import 'package:free_flutter_admin_dashboard/pages/layout.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CalendarPage extends LayoutWidget {
  const CalendarPage({super.key});


  @override
  String breakTabTitle(BuildContext context) {
    return AppLocalizations.of(context)!.calendarPageTitle;
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SfCalendar(
      view: CalendarView.month,
      viewHeaderStyle: const ViewHeaderStyle(
        backgroundColor: Colors.blue,
        dayTextStyle: TextStyle(color: Colors.grey, fontSize: 20),
      ),
    ),
    );
  }
}
