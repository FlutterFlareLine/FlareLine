import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CircularhartWidget extends StatelessWidget {
  CircularhartWidget({super.key});

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
          const Row(
            children: [
              Text(
                'Visitors Analytics',
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
      palette: <Color>[Color(0xFF316AFF), Color(0xFF01B7F9), Color(0xFF5ABE1C), Color(0xFF12E3D7),Color(0xFFFE8111)],
      legend:
          const Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
      series: _getDefaultColumnSeries(context),
      tooltipBehavior: context.read<_BarChartProvider>().tooltipBehavior,
    );
  }

  List<DoughnutSeries<_ChartData, String>> _getDefaultColumnSeries(
      BuildContext context) {
    List<_ChartData> chartData =
        context.watch<_BarChartProvider>().chartData ?? [];

    return <DoughnutSeries<_ChartData, String>>[
      DoughnutSeries<_ChartData, String>(
          explode: false,
          dataSource: chartData,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          dataLabelMapper: (_ChartData data, _) => '${data.y}%',
          dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            labelPosition: ChartDataLabelPosition.outside,
          ))
    ];
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.y2);
  final String x;
  final double y;
  final double y2;
}

class _BarChartProvider extends ChangeNotifier {
  List<_ChartData>? chartData = <_ChartData>[
    _ChartData('Mon', 21, 28),
    _ChartData('Tus', 24, 44),
    _ChartData('Wen', 36, 48),
    _ChartData('Thr', 38, 50),
    _ChartData('Thr', 38, 50),
  ];

  TooltipBehavior tooltipBehavior =
      TooltipBehavior(enable: true, header: '', canShowMarker: false);

  void init() {}

  @override
  void dispose() {
    chartData?.clear();
    super.dispose();
  }
}
