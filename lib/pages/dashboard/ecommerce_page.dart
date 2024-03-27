import 'package:flutter/material.dart';

import 'package:free_flutter_admin_dashboard/components/card/white_card.dart';
import 'package:free_flutter_admin_dashboard/components/charts/bar_chart.dart';
import 'package:free_flutter_admin_dashboard/components/chats.dart';
import 'package:free_flutter_admin_dashboard/components/charts/circular_chart.dart';
import 'package:free_flutter_admin_dashboard/components/charts/line_chart.dart';
import 'package:free_flutter_admin_dashboard/components/charts/map_chart.dart';
import 'package:free_flutter_admin_dashboard/components/tables/TopChannel.dart';
import 'package:free_flutter_admin_dashboard/pages/dashboard/analytics_widget.dart';
import 'package:free_flutter_admin_dashboard/pages/dashboard/channel_widget.dart';
import 'package:free_flutter_admin_dashboard/pages/dashboard/grid_card.dart';
import 'package:free_flutter_admin_dashboard/pages/dashboard/revenue_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EcommercePage extends StatelessWidget {
  const EcommercePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: SingleChildScrollView(
          child: Column(children: [
            GridCard(),
            SizedBox(
              height: 16,
            ),
            RevenueWidget(),
            SizedBox(
              height: 16,
            ),
            AnalyticsWidget(),
            SizedBox(
              height: 16,
            ),
            ChannelWidget()
          ])),
    );
  }
}
