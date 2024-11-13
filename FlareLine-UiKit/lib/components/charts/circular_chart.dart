import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularhartWidget extends StatelessWidget {
  final String title;
  final LegendPosition? position;
  final LegendItemOrientation? orientation;
  final List<Map<String, dynamic>> chartData;
  final List<Color>? palette;

  CircularhartWidget(
      {super.key,
      required this.title,
      required this.chartData,
      this.position,
      this.orientation,
      this.palette});

  @override
  Widget build(BuildContext context) {
    return _lineChart(context);
  }

  ValueNotifier<int> selectedOption = ValueNotifier(1);

  _lineChart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
              child: ChangeNotifierProvider(
            create: (context) => _BarChartProvider(),
            builder: (ctx, child) => _buildDefaultLineChart(ctx),
          ))
        ],
      ),
    );
  }

  Widget _buildDefaultLineChart(BuildContext context) {
    return SfCircularChart(
      title: const ChartTitle(text: ''),
      palette: palette,
      legend: Legend(
          isVisible: true,
          position: position ?? LegendPosition.auto,
          overflowMode: LegendItemOverflowMode.wrap,
          orientation: orientation ?? LegendItemOrientation.auto),
      series: _getDefaultColumnSeries(context),
      tooltipBehavior: context.read<_BarChartProvider>().tooltipBehavior,
    );
  }

  List<DoughnutSeries<dynamic, String>> _getDefaultColumnSeries(
      BuildContext context) {
    return [
      DoughnutSeries<dynamic, String>(
          explode: false,
          dataSource: chartData,
          xValueMapper: (dynamic data, _) => data['x'],
          yValueMapper: (dynamic data, _) => data['y'],
          dataLabelMapper: (dynamic data, _) => '${data['y']}%',
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            labelPosition: ChartDataLabelPosition.inside,
          ))
    ];
  }
}

class _BarChartProvider extends ChangeNotifier {
  TooltipBehavior tooltipBehavior =
      TooltipBehavior(enable: false, header: '', canShowMarker: false);

  void init() {}

  @override
  void dispose() {
    super.dispose();
  }
}
