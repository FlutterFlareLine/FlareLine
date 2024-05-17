import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flutter/material.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/core/theme/global_colors.dart';
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
    return CommonCard(
      height: 800,
      child: SfCalendar(
        view: CalendarView.month,
        todayTextStyle: const TextStyle(color: GlobalColors.primary),
        todayHighlightColor: Colors.white,
        headerStyle: const CalendarHeaderStyle(
          backgroundColor: Colors.transparent,
        ),
        monthViewSettings: const MonthViewSettings(
            showAgenda: true,
            // dayFormat: 'EEEE',
            agendaViewHeight: 200,
            agendaStyle: AgendaStyle(
                appointmentTextStyle: TextStyle(color: GlobalColors.danger))),
        viewHeaderHeight: 60,
        headerHeight: 60,
        viewHeaderStyle: const ViewHeaderStyle(
          backgroundColor: GlobalColors.primary,
          dayTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
