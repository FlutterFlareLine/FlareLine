import 'package:flareline/components/sidebar/side_bar.dart';
import 'package:flareline/components/toolbar/toolbar.dart';
import 'package:flutter/material.dart';

import 'package:flareline/components/breaktab.dart';
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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: ResponsiveBuilder(builder: (context, sizingInformation) {
        // Check the sizing information here and return your UI
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return Row(
            children: [SideBarWidger(), rightContentWidget(contentWidget)],
          );
        }

        return rightContentWidget(contentWidget);
      }),
    );
  }

  Widget rightContentWidget(Widget contentWidget) {
    return Expanded(
        child: Column(children: [
      const ToolBarWidget(),
      const SizedBox(
        height: 16,
      ),
      Expanded(child: contentWidget)
    ]));
  }
}
