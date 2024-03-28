import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flareline/components/sidebar/side_menu.dart';
import 'package:flareline/themes/global_colors.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SideBarWidger extends StatelessWidget {
  SideBarWidger({super.key});

  late List listMenu;

  @override
  Widget build(BuildContext context) {
    listMenu = List.from([
      {
        'groupName': AppLocalizations.of(context)!.groupMenu,
        'menuList': [
          {
            'icon': 'assets/sidebar/dashboard.svg',
            'menuName': AppLocalizations.of(context)!.dashboard,
            'childList': [
              {
                'menuName': AppLocalizations.of(context)!.eCommerce,
                'path': '/dashboard'
              },
            ]
          },
          {
            'icon': 'assets/sidebar/calendar.svg',
            'menuName': AppLocalizations.of(context)!.calendar,
            'path': '/calendar'
          },
          {
            'icon': 'assets/sidebar/profile.svg',
            'menuName': AppLocalizations.of(context)!.profile,
            'path': '/profile'
          },
          {
            'icon': 'assets/sidebar/forms.svg',
            'menuName': AppLocalizations.of(context)!.forms,
            'childList': [
              {
                'menuName': AppLocalizations.of(context)!.formElements,
                'path': '/formElements'
              },
              {
                'menuName': AppLocalizations.of(context)!.formLayoutPageTitle,
                'path': '/formLayout'
              },
            ]
          },
          {
            'icon': 'assets/sidebar/table.svg',
            'menuName': AppLocalizations.of(context)!.tables,
            'path': '/tables'
          },
          {
            'icon': 'assets/sidebar/setting.svg',
            'menuName': AppLocalizations.of(context)!.settings,
            'path': '/settings'
          },
        ]
      },
      {
        'groupName': AppLocalizations.of(context)!.others,
        'menuList': [
          {
            'icon': 'assets/sidebar/chart.svg',
            'menuName': AppLocalizations.of(context)!.chart,
            'childList': [
              {
                'menuName': AppLocalizations.of(context)!.basicChart,
                'path': '/basicChart'
              },
            ]
          },
          {
            'icon': 'assets/sidebar/ui.svg',
            'menuName': AppLocalizations.of(context)!.uiElements,
            'childList': [
              {
                'menuName': AppLocalizations.of(context)!.alerts,
                'path': '/alerts'
              },
              {
                'menuName': AppLocalizations.of(context)!.buttons,
                'path': '/buttons'
              },
            ]
          },
          {
            'icon': 'assets/sidebar/auth.svg',
            'menuName': AppLocalizations.of(context)!.authentication,
            'childList': [
              {
                'menuName': AppLocalizations.of(context)!.signIn,
                'path': '/signIn',
                'blank': true
              },
              {
                'menuName': AppLocalizations.of(context)!.signUp,
                'path': '/signUp',
                'blank': true
              },
              {
                'menuName': AppLocalizations.of(context)!.resetPwd,
                'path': '/resetPwd',
                'blank': true
              },
            ]
          },
        ]
      }
    ]);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      color: sideBar,
      width: 280,
      child: Column(children: [
        _logoWidget(context),
        const SizedBox(
          height: 30,
        ),
        Expanded(child: _sideListWidget(context))
      ]),
    );
  }

  _logoWidget(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 8,
        ),
        SvgPicture.asset(
          'assets/logo/logo-icon.svg',
          height: 32,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          AppLocalizations.of(context)!.appName,
          style: const TextStyle(color: Colors.white, fontSize: 32),
        ))
      ],
    );
  }

  _sideListWidget(BuildContext context) {
    return ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView.separated(
            padding: const EdgeInsets.only(left: 20,right: 10),
            itemBuilder: itemBuilder,
            separatorBuilder: separatorBuilder,
            itemCount: listMenu.length));
  }

  Widget itemBuilder(BuildContext context, int index) {
    var groupElement = listMenu.elementAt(index);
    List menuList = groupElement['menuList'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          groupElement['groupName'],
          style: const TextStyle(fontSize: 18, color: Colors.white60),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: menuList.map((e) => SideMenuWidget(e: e)).toList(),
        )
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
