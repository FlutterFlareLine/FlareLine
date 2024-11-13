library flareline_uikit;

import 'package:flareline_uikit/components/sidebar/side_bar.dart';
import 'package:flareline_uikit/core/theme/flareline_colors.dart';
import 'package:flutter/material.dart';

import 'package:flareline_uikit/components/breaktab.dart';
import 'package:flutter_svg/flutter_svg.dart';
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

  double get logoFontSize => 30;

  Color get sideBarDarkColor => FlarelineColors.darkBackground;

  Color get sideBarLightColor => Colors.white;

  Color? get backgroundColor => null;

  double? get sideBarWidth => null;

  String sideBarAsset(BuildContext context) {
    return 'assets/routes/menu_route_en.json';
  }

  bool isDarkTheme(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  EdgeInsetsGeometry? get padding =>
      const EdgeInsets.symmetric(horizontal: 20, vertical: 16);

  String? get logoImageAsset => null;

  Widget? logoWidget(BuildContext context) {
    bool isDark = isDarkTheme(context);
    if (logoImageAsset != null) {
      if (logoImageAsset!.endsWith('svg')) {
        return SvgPicture.asset(
          logoImageAsset!,
          height: 32,
        );
      }
      return Image.asset(
        logoImageAsset!,
        width: 32,
        height: 32,
      );
    }
    return SvgPicture.asset(
      'assets/logo/logo_${isDark ? 'white' : 'dark'}.svg',
      height: 32,
    );
  }

  Widget? footerWidget(BuildContext context) {
    return null;
  }

  Widget? toolbarWidget(BuildContext context, bool showDrawer) {
    return null;
  }

  Widget? breakTabRightWidget(BuildContext context) {
    return null;
  }

  String breakTabTitle(BuildContext context) {
    return '';
  }

  Widget? breakTabWidget(BuildContext context) {
    return null;
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
                if (showSideBar) sideBarWidget(context),
                Expanded(child: rightContentWidget(context))
              ],
            );
          }

          return rightContentWidget(context);
        },
      ),
      drawer: sideBarWidget(context),
    );
  }

  Widget sideBarWidget(BuildContext context) {
    return SideBarWidget(
      key: UniqueKey(),
      isDark: isDarkTheme(context),
      darkBg: sideBarDarkColor,
      lightBg: sideBarLightColor,
      appName: appName,
      sideBarAsset: sideBarAsset(context),
      width: sideBarWidth,
      logoWidget: logoWidget(context),
      footerWidget: footerWidget(context),
      logoFontSize: logoFontSize,
    );
  }

  Widget rightContentWidget(BuildContext context) {
    Widget contentWidget = Column(
      children: [
        if (showTitle)
          SizedBox(
            height: 50,
            child: breakTabWidget(context) ??
                BreakTab(
                  breakTabTitle(context),
                  rightWidget: breakTabRightWidget(context),
                ),
          ),
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
