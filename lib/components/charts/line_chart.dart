import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartWidget extends StatelessWidget {
  LineChartWidget({super.key});

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
            SizedBox(
              width: double.maxFinite,
              height: 60.h,
              child: Row(children: [
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total Revenue'),
                              Text(
                                '12.04.2022 - 12.05.2022',
                                style: TextStyle(fontSize: 10.sp),
                              )
                            ],
                          ),
                          leading: ValueListenableBuilder(
                              valueListenable: selectedOption,
                              builder: (ctx, option, widget) {
                                return Radio<int>(
                                  value: 1,
                                  groupValue: option,
                                  activeColor: Colors
                                      .red, // Change the active radio button color here
                                  fillColor: MaterialStateProperty.all(Colors
                                      .red), // Change the fill color when selected
                                  splashRadius:
                                      20, // Change the splash radius when clicked
                                  onChanged: (int? value) {
                                    selectedOption.value = value!;
                                  },
                                );
                              })),
                    ),
                    Expanded(
                      child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total Sales'),
                              Text(
                                '12.04.2022 - 12.05.2022',
                                style: TextStyle(fontSize: 10.sp),
                              )
                            ],
                          ),
                          leading: ValueListenableBuilder(
                              valueListenable: selectedOption,
                              builder: (ctx, option, widget) {
                                return Radio<int>(
                                  value: 2,
                                  groupValue: option,
                                  activeColor: Colors
                                      .red, // Change the active radio button color here
                                  fillColor: MaterialStateProperty.all(Colors
                                      .red), // Change the fill color when selected
                                  splashRadius:
                                      20, // Change the splash radius when clicked
                                  onChanged: (int? value) {
                                    selectedOption.value = value!;
                                  },
                                );
                              })),
                    ),
                  ],
                )),
                Container(
                  width: 200.w,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    MaterialButton(
                      onPressed: () {},
                      child: Text('Day'),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Text('Week'),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Text('Month'),
                    )
                  ]),
                )
              ]),
            ),
            Expanded(
                child: Container(
              child: ChangeNotifierProvider(
                create: (context) => _LineChartProvider(),
                builder: (ctx, child) => _buildDefaultLineChart(ctx),
              ),
            ))
          ],
        ));
  }

  SfCartesianChart _buildDefaultLineChart(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      title: ChartTitle(text: ''),
      legend:
          Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
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
  List<LineSeries<_ChartData, num>> _getDefaultLineSeries(
      BuildContext context) {
    List<_ChartData> chartData =
        context.watch<_LineChartProvider>().chartData ?? [];
    return <LineSeries<_ChartData, num>>[
      LineSeries<_ChartData, num>(
          dataSource: chartData,
          xValueMapper: (_ChartData sales, _) => sales.x,
          yValueMapper: (_ChartData sales, _) => sales.y,
          name: 'Germany',
          markerSettings: const MarkerSettings(isVisible: true)),
      LineSeries<_ChartData, num>(
          dataSource: chartData,
          name: 'England',
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
    _ChartData(2006, 24, 44),
    _ChartData(2007, 36, 48),
    _ChartData(2008, 38, 50),
    _ChartData(2009, 54, 66),
    _ChartData(2010, 57, 78),
    _ChartData(2011, 70, 84)
  ];

  void init() {}

  @override
  void dispose() {
    chartData?.clear();
    super.dispose();
  }
}
