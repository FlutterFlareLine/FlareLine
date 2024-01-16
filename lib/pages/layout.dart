import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_flutter_admin_dashboard/pages/breaktab.dart';

abstract class LayoutWidget extends StatelessWidget {
  String title();

  Widget contentWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.w),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          BreakTab(title()),
          SizedBox(
            height: 10.h,
          ),
          Expanded(child: contentWidget(context))
        ],
      ),
    );
  }
}
