import 'package:flareline/components/toolbar/toolbar.dart';
import 'package:flareline/entity/user_entity.dart';
import 'package:flareline/provider/login_status_provider.dart';
import 'package:flareline_uikit/widget/flareline_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class LayoutWidget extends FlarelineLayoutWidget {
  const LayoutWidget({super.key});

  @override
  Widget? toolbarWidget(BuildContext context, bool showDrawer) {
    return ToolBarWidget(
      showMore: showDrawer,
      showChangeTheme: true,
      userInfoWidget: _userInfoWidget(context),
    );
  }

  Widget _userInfoWidget(BuildContext context) {
    UserEntity? loginUser = context.watch<LoginStatusProvider>().user;
    String showName = loginUser != null ? (loginUser.displayName ?? '') : '';
    String? avatar = loginUser?.avatar;
    return Row(
      children: [
        Column(
          children: [
            Text(showName),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        if (avatar != null)
          CircleAvatar(
            backgroundImage: NetworkImage(avatar),
            radius: 22,
          )
      ],
    );
  }
}
