import 'package:flutter/material.dart';
import 'package:free_flutter_admin_dashboard/components/card/white_card.dart';
import 'package:free_flutter_admin_dashboard/components/charts/circular_chart.dart';
import 'package:free_flutter_admin_dashboard/components/charts/map_chart.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AnalyticsWidget extends StatelessWidget {
  const AnalyticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _analytics();
  }

  _analytics() {
    return ScreenTypeLayout.builder(
      desktop: _analyticsWeb,
      mobile: _analyticsMobile,
      tablet: _analyticsMobile,
    );
  }

  Widget _analyticsWeb(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: WhiteCard(
              child: CircularhartWidget(),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 1,
            child: WhiteCard(
              child: MapChartWidget(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _analyticsMobile(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350,
          child: WhiteCard(
            child: CircularhartWidget(),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 350,
          child: WhiteCard(
            child: MapChartWidget(),
          ),
        ),
      ],
    );
  }
}
