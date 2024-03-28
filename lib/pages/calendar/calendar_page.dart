import 'package:flutter/material.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/themes/global_colors.dart';
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
      margin: const EdgeInsets.symmetric(horizontal: 80),
      height: 800,
      child: SfCalendar(
        view: CalendarView.month,
        todayTextStyle: const TextStyle(color: primary),
        todayHighlightColor: Colors.white,
        headerStyle: const CalendarHeaderStyle(
          backgroundColor: Colors.transparent,
        ),
        monthViewSettings: const MonthViewSettings(showAgenda: true,dayFormat: 'EEEE',agendaViewHeight: 200, agendaStyle: AgendaStyle(
          backgroundColor: Colors.white,
          appointmentTextStyle: TextStyle(color: red)
        ) ),
        viewHeaderHeight:60,
        headerHeight: 60,
        viewHeaderStyle: const ViewHeaderStyle(
          backgroundColor: primary,
          dayTextStyle: TextStyle(color: Colors.white, fontSize: 20,),
        ),
      ),
    );
  }
}
