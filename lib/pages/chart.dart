import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_flutter_admin_dashboard/components/BarChart.dart';
import 'package:free_flutter_admin_dashboard/components/CircularChart.dart';
import 'package:free_flutter_admin_dashboard/components/LineChart.dart';
import 'package:free_flutter_admin_dashboard/pages/layout.dart';

class ChartPage extends LayoutWidget {
  @override
  Widget contentWidget(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350.h,
          child: Card(
            color: Colors.white,
            child: LineChartWidget(),
          ),
        ),
        SizedBox(height: 16.h),
        SizedBox(
            height: 350.h,
            child: Card(color: Colors.white, child: BarChartWidget())),
        SizedBox(
          height: 16.h,
        ),
        SizedBox(
            height: 350.h,
            child: Card(
              color: Colors.white,
              child: CircularhartWidget(),
            ))
      ],
    );
  }

  @override
  String title() {
    return 'Chart';
  }
}
