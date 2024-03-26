import 'package:flutter/material.dart';

import 'package:free_flutter_admin_dashboard/components/breaktab.dart';
import 'package:responsive_builder/responsive_builder.dart';

abstract class LayoutWidget extends StatelessWidget {
  const LayoutWidget({super.key});

  bool get isPage => false;

  bool get showTitle => true;

  String breakTabTitle(BuildContext context){
    return '';
  }

  Widget contentDesktopWidget(BuildContext context);

  Widget contentMobileWidget(BuildContext context) {
    return contentDesktopWidget(context);
  }

  @override
  Widget build(BuildContext context) {
    Widget contentWidget = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: SingleChildScrollView(
          child: Column(
        children: [
          if (showTitle) BreakTab(breakTabTitle(context)),
          if (showTitle)
            const SizedBox(
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
