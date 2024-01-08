import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      padding: EdgeInsets.all(12.w),
      child: Column(
        children: [
          Row(
            children: [Text('Profit this week')],
          ),
          SizedBox(
            height: 16.h,
          ),
          Expanded(
              child: Container(
            child: ChangeNotifierProvider(
              create: (context) => _BarChartProvider(),
              builder: (ctx, child) => _buildDefaultLineChart(ctx),
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildDefaultLineChart(BuildContext context) {
    return SfCircularChart(
      title: ChartTitle(text: ''),
      legend:
          Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
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
          xValueMapper: (_ChartData data, _) => data.x as String,
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
    _ChartData('M', 21, 28),
    _ChartData('T', 24, 44),
    _ChartData('W', 36, 48),
    _ChartData('T', 38, 50),
    _ChartData('F', 54, 66),
    _ChartData('S', 57, 78),
    _ChartData('S', 70, 84)
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
