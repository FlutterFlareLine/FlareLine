import 'package:flareline/provider/theme_provider.dart';
import 'package:flareline/routes.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flareline/provider/main_provider.dart';
import 'package:provider/provider.dart';

class SideMenuWidget extends StatelessWidget {
  dynamic e;

  SideMenuWidget({super.key, this.e});

  @override
  Widget build(BuildContext context) {
    return _itemMenuWidget(context, e);
  }

  Widget _itemMenuWidget(BuildContext context, e) {
    List? childList = e['childList'];
    bool isDark = context.watch<ThemeProvider>().isDark;
    bool isExpanded =
        context.watch<MainProvider>().isExpanded(e['menuName'], childList);
    bool isSelected = childList != null && childList.length > 0
        ? false
        : context.watch<MainProvider>().isSelectedPath(e['path'] ?? '');

    return Column(children: [
      InkWell(
        child: Container(
            padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
            color: isSelected ? (isDark?GlobalColors.darkBackgroundColor:GlobalColors.gray) : Colors.transparent,
            child: Row(
              children: [
                if (e['icon'] != null)
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(
                      e['icon'],
                      width: 18,
                      height: 18,
                      color: isDark ? Colors.white : GlobalColors.darkBlackText,
                    ),
                  ),
                Expanded(
                    child: Text(
                  e['menuName'],
                  style: TextStyle(
                      color: isDark
                          ? Colors.white
                          : GlobalColors.darkBlackText),
                )),
                if (childList != null && childList.isNotEmpty)
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: isDark ? Colors.white : GlobalColors.darkBlackText,
                  )
              ],
            )),
        onTap: () {
          if (childList != null && childList.isNotEmpty) {
            context.read<MainProvider>().setExpandedMenuName(e['menuName']);
          } else {
            context.read<MainProvider>().setExpandedMenuName('');
            pushOrJump(context, e);
          }
        },
      ),
      const SizedBox(
        height: 10,
      ),
      if (childList != null && childList.isNotEmpty)
        Visibility(
            visible: isExpanded,
            child: Column(
              children: childList
                  .map((e) => _itemSubMenuWidget(context, e, isDark))
                  .toList(),
            ))
    ]);
  }

  Widget _itemSubMenuWidget(BuildContext context, e, bool isDark) {
    bool isSelected =
        context.watch<MainProvider>().isSelectedPath(e['path'] ?? '');

    return InkWell(
      child: Container(
        padding: EdgeInsets.only(left: 50, top: 10, bottom: 10),
        color: isSelected ? (isDark?GlobalColors.darkBackgroundColor:GlobalColors.gray) : Colors.transparent,
        child: Row(
          children: [
            Expanded(
                child: Text(
              e['menuName'],
              style: TextStyle(
                  color: isDark
                      ? Colors.white
                      : GlobalColors.darkBlackText),
            )),
          ],
        ),
      ),
      onTap: () {
        pushOrJump(context, e);
      },
    );
  }

  pushOrJump(BuildContext context, e) {
    if (Scaffold.of(context).isDrawerOpen) {
      Scaffold.of(context).closeDrawer();
    }

    String path = e['path'];

    String? routePath = ModalRoute.of(context)?.settings?.name;

    if (path == routePath) {
      return;
    }
    Navigator.of(context).pushNamed(path);
  }
}
