import 'package:flareline/themes/global_colors.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartWidget extends StatelessWidget {
  LineChartWidget({super.key});

  ValueNotifier<int> selectedOption = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return _lineChart(context);
  }

  _lineChart(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            ChangeNotifierProvider(
              create: (context) => _LineChartProvider(),
              builder: (ctx, child) => _buildDefaultLineChart(ctx),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    color: gray,
                    child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      MaterialButton(
                        onPressed: () {},
                        child: const Text('Day'),
                        color: Theme.of(context).appBarTheme.backgroundColor
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Text('Week', style: TextStyle(color: Theme.of(context).appBarTheme.backgroundColor),),
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Text('Month', style: TextStyle(color: Theme.of(context).appBarTheme.backgroundColor)),
                      )
                    ]),
                  )
                ],
              ),
            )
          ],
        ));
  }

  SfCartesianChart _buildDefaultLineChart(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: const ChartTitle(text: 'Revenue', textStyle: TextStyle(fontWeight: FontWeight.bold), alignment: ChartAlignment.near),
      legend: const Legend(isVisible: true, position: LegendPosition.top),
      primaryXAxis: const NumericAxis(
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          interval: 1,
          majorGridLines: MajorGridLines(width: 1)),
      primaryYAxis: const NumericAxis(
          labelFormat: '{value}%',
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(color: Colors.transparent)),
      series: _getDefaultLineSeries(context),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// The method returns line series to chart.
  List<SplineSeries<_ChartData, num>> _getDefaultLineSeries(
      BuildContext context) {
    List<_ChartData> chartData =
        context.watch<_LineChartProvider>().chartData ?? [];
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

class _LineChartProvider extends ChangeNotifier {
  List<_ChartData>? chartData = <_ChartData>[
    _ChartData(2005, 21, 28),
    _ChartData(2006, 120, 44),
    _ChartData(2007, 30, 150),
    _ChartData(2008, 38, 50),
    _ChartData(2009, 25, 200),
    _ChartData(2010, 60, 78),
    _ChartData(2011, 46, 84)
  ];

  void init() {}

  @override
  void dispose() {
    chartData?.clear();
    super.dispose();
  }
}
