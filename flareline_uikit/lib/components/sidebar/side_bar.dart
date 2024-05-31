library flareline_uikit;

import 'dart:convert';

import 'package:flareline_uikit/components/sidebar/side_menu.dart';
import 'package:flareline_uikit/core/theme/flareline_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SideBarWidget extends StatelessWidget {
  final double? width;
  final String? appName;
  final String? sideBarAsset;
  final Widget? logoWidget;
  final bool? isDark;
  final Color? darkBg;
  final Color? lightBg;

  const SideBarWidget({super.key,
    this.darkBg,
    this.lightBg,
    this.width,
    this.appName,
    this.sideBarAsset,
    this.logoWidget,
    this.isDark});

  @override
  Widget build(BuildContext context) {
    isDark ?? false;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      color: (isDark! ? darkBg : Colors.white),
      width: width ?? 280,
      child: Column(children: [
        _logoWidget(context, isDark!),
        const SizedBox(
          height: 30,
        ),
        Expanded(child: _sideListWidget(context, isDark!))
      ]),
    );
  }

  _logoWidget(BuildContext context, bool isDark) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        if (logoWidget != null) logoWidget!,
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
              appName ?? '',
              style: TextStyle(
                  color: isDark ? Colors.white : FlarelineColors.darkBlackText,
                  fontSize: 32),
            ))
      ],
    );
  }

  Widget _sideListWidget(BuildContext context, bool isDark) {
    if (sideBarAsset == null) {
      return const SizedBox.shrink();
    }
    return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString(sideBarAsset!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData) {
                return const SizedBox.shrink();
              }

              // Decode the JSON
              List listMenu = json.decode(snapshot.data.toString());
              return ListView.separated(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  itemBuilder: (ctx, index) {
                    return itemBuilder(ctx, index, listMenu, isDark);
                  },
                  separatorBuilder: separatorBuilder,
                  itemCount: listMenu.length);
            }));
  }

  Widget itemBuilder(BuildContext context, int index, List listMenu,
      bool isDark) {
    var groupElement = listMenu.elementAt(index);
    List menuList = groupElement['menuList'];
    String groupName = groupElement['groupName'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (groupName != null && groupName.isNotEmpty)
          Text(
            groupElement['groupName'],
            style: TextStyle(
                fontSize: 20,
                color: isDark ? Colors.white60 : FlarelineColors.darkBlackText),
          ),
        if (groupName != null && groupName.isNotEmpty)
          const SizedBox(
            height: 10,
          ),
        Column(
          children: menuList.map((e) => SideMenuWidget(e: e,isDark:isDark)).toList(),
        ),
        const SizedBox(
          height: 10,
        ),
        if (index < listMenu.length - 1) const Divider(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const Divider(
      height: 10,
      color: Colors.transparent,
    );
  }
}
