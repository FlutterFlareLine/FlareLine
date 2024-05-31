import 'package:flareline/components/toolbar/toolbar.dart';
import 'package:flareline_uikit/widget/flareline_layout.dart';
import 'package:flutter/material.dart';

abstract class CrmLayout extends FlarelineLayoutWidget {
  const CrmLayout({super.key});

  @override
  Color get sideBarDarkColor => Color(0xFF040710);

  @override
  String get appName => 'ezyCRM';

  @override
  String get sideBarAsset => 'assets/crm/menu_route_en.json';

  @override
  String? get logoImageAsset => 'assets/crm/crm.png';

  @override
  Widget? logoWidget(BuildContext context) {
    // TODO: implement logoWidget
    return Image.asset(
      logoImageAsset!,
      width: 46,
      height: 46,
    );
  }

  @override
  bool isDarkTheme(BuildContext context) {
    // TODO: implement isDarkTheme
    return true;
  }

  @override
  Widget? toolbarWidget(BuildContext context, bool showDrawer) {
    return ToolBarWidget(
      showMore: showDrawer,
    );
  }
}
