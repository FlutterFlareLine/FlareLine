import 'package:flutter/material.dart';
import 'package:flareline/components/card/common_card.dart';
import 'package:flareline/components/charts/circular_chart.dart';
import 'package:flareline/components/charts/map_chart.dart';
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
            flex: 3,
            child: CommonCard(
              child: CircularhartWidget(),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 4,
            child: CommonCard(
              child: const MapChartWidget(),
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
          child: CommonCard(
            child: CircularhartWidget(),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 350,
          child: CommonCard(
            child: const MapChartWidget(),
          ),
        ),
      ],
    );
  }
}
