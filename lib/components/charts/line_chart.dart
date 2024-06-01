import 'package:flareline/core/theme/global_colors.dart';
import 'package:flareline/pages/form/select_widget.dart';
import 'package:flareline/provider/theme_provider.dart';
import 'package:flareline_uikit/service/base_provider.dart';
import 'package:flareline_uikit/widget/base/base_stless_widget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartWidget extends BaseStlessWidget<LineChartProvider> {
  final String title;

  final List<Map<String, dynamic>> datas;

  final bool? isDropdownToggle;

  LineChartWidget(
      {super.key,
      required this.title,
      required this.datas,
      this.isDropdownToggle});

  @override
  Widget bodyWidget(
      BuildContext context, LineChartProvider viewModel, Widget? child) {
    return Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            SfCartesianChart(
              plotAreaBorderWidth: 0,
              title: ChartTitle(
                  text: title,
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  alignment: ChartAlignment.near),
              legend:
                  const Legend(isVisible: true, position: LegendPosition.top),
              primaryXAxis: const CategoryAxis(),
              primaryYAxis: const NumericAxis(
                  labelFormat: '{value}%',
                  axisLine: AxisLine(width: 0),
                  majorTickLines: MajorTickLines(color: Colors.transparent)),
              series: _getDefaultLineSeries(context, viewModel),
              tooltipBehavior: TooltipBehavior(
                  enable: true,
                  textStyle: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? GlobalColors.darkBlackText
                          : GlobalColors.gray)),
            ),
            if (!(isDropdownToggle ?? false)) dateToggleWidget(context),
            if (isDropdownToggle ?? false) dropdownDateToggleWidget(context)
          ],
        ));
  }

  @override
  LineChartProvider viewModelBuilder(BuildContext context) {
    return LineChartProvider(context);
  }

  Widget dropdownDateToggleWidget(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          width: 140,
          child: SelectWidget(
            selectionList: ['Daily', 'Monthly', 'Yearly'],
          ),
        ));
  }

  Widget dateToggleWidget(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
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
  List<SplineSeries<dynamic, String>> _getDefaultLineSeries(
      BuildContext context, LineChartProvider viewModel) {
    return datas.map((item) {
      return SplineSeries<dynamic, String>(
          dataSource: item['data'],
          xValueMapper: (dynamic sales, _) => sales['x'],
          yValueMapper: (dynamic sales, _) => sales['y'],
          name: item['name'],
          color: item['color'],
          // isVisibleInLegend: false,
          markerSettings: const MarkerSettings(isVisible: false));
    }).toList();
  }
}

class LineChartProvider extends BaseProvider {
  LineChartProvider(super.context);
}
