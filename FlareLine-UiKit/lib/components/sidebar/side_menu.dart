import 'package:flareline_uikit/core/theme/flareline_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:window_location_href/window_location_href.dart';

class SideMenuWidget extends StatelessWidget {
  dynamic e;
  bool? isDark;

  ValueNotifier<String> expandedMenuName;

  SideMenuWidget({super.key, this.e, this.isDark, required this.expandedMenuName});

  void setExpandedMenuName(String menuName) {
    if (expandedMenuName.value == menuName) {
      expandedMenuName.value = '';
    } else {
      expandedMenuName.value = menuName;
    }
  }

  bool isSelectedPath(BuildContext context, String path) {
    if (kIsWeb) {
      String? location = href;
      if (location != null) {
        var uri = Uri.dataFromString(location);
        String? routePath = uri.path;

        return routePath.endsWith(path);
      }
    }

    String? routePath = ModalRoute
        .of(context)
        ?.settings
        ?.name;
    return routePath == path;
  }

  @override
  Widget build(BuildContext context) {
    isDark ?? false;
    return _itemMenuWidget(context, e, isDark!);
  }

  Widget _itemMenuWidget(BuildContext context, e, bool isDark) {
    String itemMenuName = e['menuName'] ?? '';
    List? childList = e['childList'];

    bool isSelected = childList != null && childList.isNotEmpty
        ? false
        : isSelectedPath(context, e['path'] ?? '');

    return Column(children: [
      InkWell(
        child: Container(
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
            decoration: BoxDecoration(
              gradient: isSelected
                  ? (isDark
                  ? const LinearGradient(
                begin: Alignment(1.00, -0.03),
                end: Alignment(-1, 0.03),
                colors: [Color(0x0C316AFF), Color(0x38306AFF)],
              )
                  : const LinearGradient(
                begin: Alignment(1.00, -0.03),
                end: Alignment(-1, 0.03),
                colors: [
                  FlarelineColors.background,
                  FlarelineColors.gray
                ],
              ))
                  : null,
            ),
            child: Row(
              children: [
                if (e['icon'] != null)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset(
                      e['icon'],
                      width: 18,
                      height: 18,
                      color:
                      isDark ? Colors.white : FlarelineColors.darkBlackText,
                    ),
                  ),
                Expanded(
                    child: Text(
                      itemMenuName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: isDark
                              ? Colors.white
                              : FlarelineColors.darkBlackText),
                    )),
                if (childList != null && childList.isNotEmpty)
                  ValueListenableBuilder(
                      valueListenable: expandedMenuName,
                      builder: (ctx, menuName, child) {
                        bool expanded = menuName == itemMenuName;
                        return Icon(
                          expanded
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: isDark
                              ? Colors.white
                              : FlarelineColors.darkBlackText,
                        );
                      })
              ],
            )),
        onTap: () {
          if (childList != null && childList.isNotEmpty) {
            setExpandedMenuName(itemMenuName);
          } else {
            setExpandedMenuName('');
            pushOrJump(context, e);
          }
        },
      ),
      const SizedBox(
        height: 10,
      ),
      if (childList != null && childList.isNotEmpty)
        ValueListenableBuilder(
            valueListenable: expandedMenuName,
            builder: (ctx, menuName, child) {
              return Visibility(
                  visible: menuName == itemMenuName,
                  child: Column(
                    children: childList
                        .map((e) => _itemSubMenuWidget(context, e, isDark))
                        .toList(),
                  ));
            })
    ]);
  }

  Widget _itemSubMenuWidget(BuildContext context, e, bool isDark) {
    bool isSelected = isSelectedPath(context, e['path'] ?? '');
    String itemMenuName = e['menuName'] ?? '';
    return InkWell(
      child: Container(
        padding: const EdgeInsets.only(left: 50, top: 10, bottom: 10),
        color: isSelected
            ? (isDark ? FlarelineColors.darkBackground : FlarelineColors.gray)
            : Colors.transparent,
        child: Row(
          children: [
            Expanded(
                child: Text(
                  itemMenuName,
                  style: TextStyle(
                      color: isDark ? Colors.white : FlarelineColors
                          .darkBlackText),
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
    if (Scaffold
        .of(context)
        .isDrawerOpen) {
      Scaffold.of(context).closeDrawer();
    }

    String path = e['path'];

    String? routePath = ModalRoute
        .of(context)
        ?.settings
        ?.name;

    if (path == routePath) {
      return;
    }
    Navigator.of(context).pushNamed(path);
  }
}
