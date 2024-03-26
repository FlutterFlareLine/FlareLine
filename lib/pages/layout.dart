import 'package:flutter/material.dart';

import 'package:free_flutter_admin_dashboard/components/breaktab.dart';
import 'package:responsive_builder/responsive_builder.dart';

abstract class LayoutWidget extends StatelessWidget {
  bool get isPage => false;

  bool get showTitle => true;

  String title(){
    return '';
  }

  Widget contentDesktopWidget(BuildContext context);

  Widget contentMobileWidget(BuildContext context) {
    return contentDesktopWidget(context);
  }

  @override
  Widget build(BuildContext context) {
    Widget contentWidget = Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: SingleChildScrollView(
          child: Column(
        children: [
          if (showTitle) BreakTab(title()),
          if (showTitle)
            SizedBox(
              height: 10,
            ),
          ScreenTypeLayout.builder(
            desktop: contentDesktopWidget,
            mobile: contentMobileWidget,
            tablet: contentMobileWidget,
          )
        ],
      )),
    );
    return isPage
        ? Scaffold(
            body: contentWidget,
          )
        : contentWidget;
  }
}
