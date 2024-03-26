import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_flutter_admin_dashboard/components/breaktab.dart';
import 'package:responsive_builder/responsive_builder.dart';

abstract class LayoutWidget extends StatelessWidget {
  String title();

  Widget contentDesktopWidget(BuildContext context);

  Widget contentMobileWidget(BuildContext context){
    return contentDesktopWidget(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: SingleChildScrollView(
          child: Column(
        children: [
          BreakTab(title()),
          SizedBox(
            height: 10.h,
          ),
          ScreenTypeLayout.builder(
            desktop: contentDesktopWidget,
            mobile: contentMobileWidget,
            tablet: contentMobileWidget,
          )
        ],
      )),
    );
  }
}
