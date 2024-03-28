import 'package:flutter/material.dart';

import 'package:flareline/components/card/white_card.dart';
import 'package:flareline/components/charts/bar_chart.dart';
import 'package:flareline/components/chats.dart';
import 'package:flareline/components/charts/circular_chart.dart';
import 'package:flareline/components/charts/line_chart.dart';
import 'package:flareline/components/charts/map_chart.dart';
import 'package:flareline/components/tables/TopChannel.dart';
import 'package:flareline/pages/dashboard/analytics_widget.dart';
import 'package:flareline/pages/dashboard/channel_widget.dart';
import 'package:flareline/pages/dashboard/grid_card.dart';
import 'package:flareline/pages/dashboard/revenue_widget.dart';
import 'package:flareline/pages/layout.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EcommercePage extends LayoutWidget {
  const EcommercePage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'Ecommerce';
  }
  @override
  Widget contentDesktopWidget(BuildContext context) {
    return const Column(children: [
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
    ]);
  }

}
