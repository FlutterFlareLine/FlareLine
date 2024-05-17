import 'package:flutter/material.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline/components/charts/bar_chart.dart';
import 'package:flareline/components/charts/line_chart.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RevenueWidget extends StatelessWidget {
  const RevenueWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _revenueWidget();
  }

  Widget _revenueWidget() {
    return ScreenTypeLayout.builder(
      desktop: _revenueWidgetDesktop,
      mobile: _revenueWidgetMobile,
      tablet: _revenueWidgetMobile,
    );
  }

  Widget _revenueWidgetDesktop(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Row(
        children: [
          Expanded(
            child: _lineChart(),
            flex: 2,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: _barChart(),
            flex: 1,
          ),
        ],
      ),
    );
  }

  Widget _revenueWidgetMobile(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 360,
          child: _lineChart(),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 360,
          child: _barChart(),
        ),
      ],
    );
  }

  _lineChart() {
    return CommonCard(
      child: LineChartWidget(),
    );
  }

  _barChart() {
    return CommonCard(child: BarChartWidget());
  }
}
