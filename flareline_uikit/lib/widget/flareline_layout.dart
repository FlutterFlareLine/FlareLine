library flareline_uikit;

import 'package:flareline_uikit/components/sidebar/side_bar.dart';
import 'package:flutter/material.dart';

import 'package:flareline_uikit/components/breaktab.dart';
import 'package:responsive_builder/responsive_builder.dart';

abstract class FlarelineLayoutWidget extends StatelessWidget {
  const FlarelineLayoutWidget({super.key});

  String get appName => 'Flareline';

  bool get showTitle => true;

  bool get isAlignCenter => false;

  bool get showSideBar => true;

  bool get showToolBar => true;

  bool get showDrawer => false;

  bool get isContentScroll => true;

  Color? get backgroundColor => null;

  EdgeInsetsGeometry? get padding =>
      const EdgeInsets.symmetric(horizontal: 20, vertical: 16);

  Widget? toolbarWidget(BuildContext context, bool showDrawer) {
    return null;
  }

  String breakTabTitle(BuildContext context) {
    return '';
  }

  Widget contentDesktopWidget(BuildContext context);

  Widget contentMobileWidget(BuildContext context) {
    return contentDesktopWidget(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          // Check the sizing information here and return your UI
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return Row(
              children: [
                if (showSideBar)
                  SideBarWidget(
                    appName: appName,
                  ),
                Expanded(child: rightContentWidget(context))
              ],
            );
          }

          return rightContentWidget(context);
        },
      ),
      drawer: const SideBarWidget(),
    );
  }

  Widget rightContentWidget(BuildContext context) {
    Widget contentWidget = Column(
      children: [
        if (showTitle) BreakTab(breakTabTitle(context)),
        if (showTitle)
          const SizedBox(
            height: 10,
          ),
        isContentScroll
            ? ScreenTypeLayout.builder(
                desktop: contentDesktopWidget,
                mobile: contentMobileWidget,
                tablet: contentMobileWidget,
              )
            : Expanded(
                child: ScreenTypeLayout.builder(
                desktop: contentDesktopWidget,
                mobile: contentMobileWidget,
                tablet: contentMobileWidget,
              ))
      ],
    );

    return Column(children: [
      if (showToolBar)
        toolbarWidget(
              context,
              showDrawer,
            ) ??
            SizedBox.shrink(),
      if (showToolBar)
        const SizedBox(
          height: 16,
        ),
      Expanded(
          child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        alignment: isAlignCenter ? Alignment.center : null,
        padding: padding,
        child: isContentScroll
            ? SingleChildScrollView(child: contentWidget)
            : contentWidget,
      ))
    ]);
  }
}
