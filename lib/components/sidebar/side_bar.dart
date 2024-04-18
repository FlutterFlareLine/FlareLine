import 'dart:convert';

import 'package:flareline/provider/theme_provider.dart';
import 'package:flareline/core/theme/global_theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flareline/components/sidebar/side_menu.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SideBarWidger extends StatelessWidget {
  const SideBarWidger({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeProvider>().isDark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      color: isDark ? GlobalColors.sideBar : Colors.white,
      width: 280,
      child: Column(children: [
        _logoWidget(context, isDark),
        const SizedBox(
          height: 30,
        ),
        Expanded(child: _sideListWidget(context, isDark))
      ]),
    );
  }

  _logoWidget(BuildContext context, bool isDark) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        SvgPicture.asset(
          'assets/logo/logo_${isDark ? 'white' : 'dark'}.svg',
          height: 32,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          AppLocalizations.of(context)!.appName,
          style: TextStyle(
              color: isDark ? Colors.white : GlobalColors.darkTextBody,
              fontSize: 32),
        ))
      ],
    );
  }

  _sideListWidget(BuildContext context, bool isDark) {
    return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('assets/routes/menu_route_en.json'),
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

  Widget itemBuilder(
      BuildContext context, int index, List listMenu, bool isDark) {
    var groupElement = listMenu.elementAt(index);
    List menuList = groupElement['menuList'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          groupElement['groupName'],
          style: TextStyle(
              fontSize: 20,
              color: isDark ? Colors.white60 : GlobalColors.darkBlackText),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: menuList.map((e) => SideMenuWidget(e: e)).toList(),
        ),
        SizedBox(
          height: 10,
        ),
        if (index < listMenu.length - 1) Divider(),
        SizedBox(
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
