import 'package:flareline/core/theme/global_colors.dart';
import 'package:flareline/provider/theme_provider.dart';
import 'package:flareline_uikit/service/base_provider.dart';
import 'package:flareline_uikit/widget/base/base_stless_widget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartWidget extends BaseStlessWidget<LineChartProvider> {
  LineChartWidget({super.key});

  ValueNotifier<int> selectedOption = ValueNotifier(1);

  @override
  Widget bodyWidget(
      BuildContext context, LineChartProvider viewModel, Widget? child) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            SfCartesianChart(
              plotAreaBorderWidth: 0,
              title: const ChartTitle(
                  text: 'Revenue',
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                  alignment: ChartAlignment.near),
              legend:
                  const Legend(isVisible: true, position: LegendPosition.top),
              primaryXAxis: const NumericAxis(
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  interval: 1,
                  majorGridLines: MajorGridLines(width: 1)),
              primaryYAxis: const NumericAxis(
                  labelFormat: '{value}%',
                  axisLine: AxisLine(width: 0),
                  majorTickLines: MajorTickLines(color: Colors.transparent)),
              series: _getDefaultLineSeries(context, viewModel),
              tooltipBehavior: TooltipBehavior(
                  enable: true,
                  textStyle: TextStyle(
                      color: context.watch<ThemeProvider>().isDark
                          ? GlobalColors.darkBlackText
                          : GlobalColors.gray)),
            ),
            dateToggleWidget(context)
          ],
        ));
  }

  @override
  LineChartProvider viewModelBuilder(BuildContext context) {
    return LineChartProvider(context);
  }

  Widget dateToggleWidget(BuildContext context) {
    bool isDark = context.watch<ThemeProvider>().isDark;
    return Align(
      alignment: Alignment.topRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            color:
                isDark ? GlobalColors.darkBackgroundColor : GlobalColors.gray,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              MaterialButton(
                  onPressed: () {},
                  child: const Text('Day'),
                  color: Theme.of(context).appBarTheme.backgroundColor),
              MaterialButton(
                onPressed: () {},
                child: Text(
                  'Week',
                  style: TextStyle(
                      color: isDark
                          ? Colors.white
                          : GlobalColors.darkBackgroundColor),
                ),
              ),
              MaterialButton(
                onPressed: () {},
                child: Text('Month',
                    style: TextStyle(
                        color: isDark
                            ? Colors.white
                            : GlobalColors.darkBackgroundColor)),
              )
            ]),
          )
        ],
      ),
    );
  }

  /// The method returns line series to chart.
  List<SplineSeries<_ChartData, num>> _getDefaultLineSeries(
      BuildContext context, LineChartProvider viewModel) {
    List<_ChartData> chartData = viewModel.chartData ?? [];
    return <SplineSeries<_ChartData, num>>[
      SplineSeries<_ChartData, num>(
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          name: 'Germany',
          color: const Color(0xFF01B7F9),
          // isVisibleInLegend: false,
          markerSettings: const MarkerSettings(isVisible: true)),
      SplineSeries<_ChartData, num>(
          dataSource: chartData,
          name: 'England',
          color: const Color(0xFFFE8111),
          // isVisibleInLegend: false,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y2,
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.y2);

  final double x;
  final double y;
  final double y2;
}

class LineChartProvider extends BaseProvider {
  List<_ChartData>? chartData = <_ChartData>[
    _ChartData(2005, 21, 28),
    _ChartData(2006, 120, 44),
    _ChartData(2007, 30, 150),
    _ChartData(2008, 38, 50),
    _ChartData(2009, 25, 200),
    _ChartData(2010, 60, 78),
    _ChartData(2011, 46, 84)
  ];

  LineChartProvider(super.context);

  @override
  void dispose() {
    chartData?.clear();
    super.dispose();
  }
}
