import 'package:flutter/material.dart';

import 'package:free_flutter_admin_dashboard/components/breaktab.dart';
import 'package:free_flutter_admin_dashboard/themes/global_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

abstract class LayoutWidget extends StatelessWidget {
  const LayoutWidget({super.key});

  bool get isPage => false;

  bool get showTitle => true;

  bool get isAlignCenter => false;

  String breakTabTitle(BuildContext context) {
    return '';
  }

  Widget contentDesktopWidget(BuildContext context);

  Widget contentMobileWidget(BuildContext context) {
    return contentDesktopWidget(context);
  }

  @override
  Widget build(BuildContext context) {
    Widget contentWidget = Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: gray,
      alignment: isAlignCenter ? Alignment.center : null,
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
