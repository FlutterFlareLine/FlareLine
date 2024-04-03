import 'package:flutter/material.dart';

import 'package:flareline/pages/dashboard/analytics_widget.dart';
import 'package:flareline/pages/dashboard/channel_widget.dart';
import 'package:flareline/pages/dashboard/grid_card.dart';
import 'package:flareline/pages/dashboard/revenue_widget.dart';
import 'package:flareline/pages/layout.dart';

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
