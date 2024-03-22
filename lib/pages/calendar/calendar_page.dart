import 'package:flutter/material.dart';
import 'package:free_flutter_admin_dashboard/pages/layout.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends LayoutWidget {
  CalendarPage();

  @override
  String title() {
    return 'Calendar';
  }

  @override
  Widget contentWidget(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SfCalendar(
      view: CalendarView.month,
      viewHeaderStyle: ViewHeaderStyle(
        backgroundColor: Colors.blue,
        dayTextStyle: TextStyle(color: Colors.grey, fontSize: 20),
      ),
    ),
    );
  }
}
