
import 'package:flareline_uikit/components/toolbar/toolbar.dart';
import 'package:flareline_uikit/service/localization_provider.dart';
import 'package:flareline_uikit/widget/flareline_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class LayoutWidget extends FlarelineLayoutWidget {
  const LayoutWidget({super.key});

  @override
  String sideBarAsset(BuildContext context) {
    return 'assets/routes/menu_route_${context.watch<LocalizationProvider>().languageCode}.json';
  }

  @override
  Widget? toolbarWidget(BuildContext context, bool showDrawer) {
    return ToolBarWidget(
      showMore: showDrawer,
      showChangeTheme: true,
      userInfoWidget: _userInfoWidget(context),
    );
  }

  Widget _userInfoWidget(BuildContext context) {

    return const Row(
      children: [
        Column(
          children: [
            Text('Demo'),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        CircleAvatar(
          backgroundImage:AssetImage('assets/user/user-02.png'),
          radius: 22,
        )
      ],
    );
  }
}
