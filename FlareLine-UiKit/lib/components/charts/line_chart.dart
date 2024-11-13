import 'package:flareline_uikit/components/forms/select_widget.dart';
import 'package:flareline_uikit/core/mvvm/base_viewmodel.dart';
import 'package:flareline_uikit/core/mvvm/base_widget.dart';
import 'package:flareline_uikit/core/theme/flareline_colors.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartWidget extends BaseWidget<LineChartProvider> {
  final String title;

  final List<Map<String, dynamic>> datas;

  final bool? isDropdownToggle;

  final List<String> dropdownItems;

  final ValueChanged<String>? onDropdownChanged;

  LineChartWidget(
      {super.key,
      required this.title,
      required this.datas,
      this.isDropdownToggle,
      required this.dropdownItems,
      this.onDropdownChanged}) {
    if (dropdownItems.isNotEmpty) {
      valueNotifier = ValueNotifier(dropdownItems[0]);
    } else {
      valueNotifier = ValueNotifier('');
    }
  }

  late ValueNotifier<String> valueNotifier;

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
              legend: const Legend(
                  isVisible: true,
                  position: LegendPosition.top,
                  textStyle: TextStyle(fontWeight: FontWeight.normal)),
              primaryXAxis: const CategoryAxis(
                labelStyle: TextStyle(fontWeight: FontWeight.normal),
              ),
              primaryYAxis: const NumericAxis(
                  labelStyle: TextStyle(fontWeight: FontWeight.normal),
                  labelFormat: '{value}%',
                  axisLine: AxisLine(width: 0),
                  majorTickLines: MajorTickLines(color: Colors.transparent)),
              series: _getDefaultLineSeries(context, viewModel),
              tooltipBehavior: TooltipBehavior(
                  enable: true,
                  textStyle: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? FlarelineColors.darkBlackText
                          : FlarelineColors.gray)),
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
            selectionList: dropdownItems!,
            onDropdownChanged: (item) {
              if (onDropdownChanged != null) {
                onDropdownChanged!(item);
              }
            },
          ),
        ));
  }

  Widget dateToggleWidget(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Align(
      alignment: Alignment.topRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              color: isDark
                  ? FlarelineColors.darkBackground
                  : FlarelineColors.gray,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: dropdownItems!.map((item) {
                    return ValueListenableBuilder(
                        valueListenable: valueNotifier,
                        builder: (c, selectedValue, child) {
                          return InkWell(
                              onTap: () {
                                valueNotifier.value=item;
                                if (onDropdownChanged != null) {
                                  onDropdownChanged!(item);
                                }
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                      color: selectedValue == item
                                          ? Theme.of(context)
                                              .appBarTheme
                                              .backgroundColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(2),
                                      border: selectedValue == item
                                          ? Border.all(
                                              width: 1,
                                              color: FlarelineColors.border)
                                          : null),
                                  child: Text(
                                    '${item}',
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: (isDark
                                            ? Colors.white
                                            : FlarelineColors.darkBackground)),
                                  )));
                        });
                  }).toList()))
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

class LineChartProvider extends BaseViewModel {
  LineChartProvider(super.context);
}
