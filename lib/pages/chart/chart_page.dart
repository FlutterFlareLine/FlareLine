
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline/components/charts/bar_chart.dart';
import 'package:flareline_uikit/components/charts/circular_chart.dart';
import 'package:flareline_uikit/components/charts/line_chart.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/flutter_gen/app_localizations.dart';

class ChartPage extends LayoutWidget {
  const ChartPage({super.key});

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350,
          child: CommonCard(
            child: LineChartWidget(
              title: 'Revenue',
              dropdownItems: ['Daily', 'Monthly', 'Yearly'],
              datas: [
                {
                  'name': 'Marketing Sales',
                  'color': Color(0xFFFE8111),
                  'data': [
                    {'x': 'Jan', 'y': 25},
                    {'x': 'Fed', 'y': 75},
                    {'x': 'Mar', 'y': 28},
                    {'x': 'Apr', 'y': 32},
                    {'x': 'May', 'y': 40},
                    {'x': 'Jun', 'y': 48},
                    {'x': 'Jul', 'y': 44},
                    {'x': 'Aug', 'y': 42},
                    {'x': 'Sep', 'y': 70},
                    {'x': 'Oct', 'y': 65},
                    {'x': 'Nov', 'y': 55},
                    {'x': 'Dec', 'y': 78}
                  ]
                },
                {
                  'name': 'Cases Sales',
                  'color': Color(0xFF01B7F9),
                  'data': [
                    {'x': 'Jan', 'y': 70},
                    {'x': 'Fed', 'y': 30},
                    {'x': 'Mar', 'y': 66},
                    {'x': 'Apr', 'y': 44},
                    {'x': 'May', 'y': 55},
                    {'x': 'Jun', 'y': 51},
                    {'x': 'Jul', 'y': 44},
                    {'x': 'Aug', 'y': 30},
                    {'x': 'Sep', 'y': 100},
                    {'x': 'Oct', 'y': 87},
                    {'x': 'Nov', 'y': 77},
                    {'x': 'Dec', 'y': 20}
                  ]
                },
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(height: 350, child: CommonCard(child: BarChartWidget())),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
            height: 350,
            child: CommonCard(
              child: CircularhartWidget(
                title: 'Visitors Analytics',
                palette: const [
                  GlobalColors.warn,
                  GlobalColors.secondary,
                  GlobalColors.primary
                ],
                chartData: const [
                  {
                    'x': 'Social Media',
                    'y': 33,
                  },
                  {
                    'x': 'Direct Search',
                    'y': 33,
                  },
                  {
                    'x': 'Others',
                    'y': 34,
                  },
                ],
              ),
            ))
      ],
    );
  }

  @override
  String breakTabTitle(BuildContext context) {
    return AppLocalizations.of(context)!.chartPageTitle;
  }
}
