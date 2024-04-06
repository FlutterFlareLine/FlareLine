import 'package:flareline/components/badge/anim_badge.dart';
import 'package:flareline/components/forms/outborder_text_form_field.dart';
import 'package:flareline/provider/theme_provider.dart';
import 'package:flareline/themes/global_theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flareline/components/buttons/button_widget.dart';
import 'package:flareline/provider/localization_provider.dart';
import 'package:flareline/themes/global_colors.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ToolBarWidget extends StatelessWidget {
  const ToolBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _toolsBarWidget(context);
  }

  _toolsBarWidget(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        ResponsiveBuilder(builder: (context, sizingInformation) {
          // Check the sizing information here and return your UI
          if (sizingInformation.deviceScreenType != DeviceScreenType.desktop) {
            return InkWell(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200, width: 1)),
                alignment: Alignment.center,
                child: const Icon(Icons.more_vert),
              ),
              onTap: () {
                if (Scaffold.of(context).isDrawerOpen) {
                  Scaffold.of(context).closeDrawer();
                  return;
                }
                Scaffold.of(context).openDrawer();
              },
            );
          }

          return const SizedBox();
        }),
        ResponsiveBuilder(builder: (context, sizingInformation) {
          // Check the sizing information here and return your UI
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
            return const SizedBox(
              width: 280,
              child: OutBorderTextFormField(
                icon: Icon(
                  Icons.search_rounded,
                  color: Color(
                    0xFF68738D,
                  ),
                  size: 24,
                ),
                hintText: 'Search or type keyword',
              ),
            );
          }

          return const SizedBox();
        }),
        const Spacer(),
        ToggleWidget(),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: stroke, shape: BoxShape.circle),
                  child: SvgPicture.asset('assets/toolbar/alarm.svg',
                      width: 18, height: 18)),
              const Align(
                child: AnimBadge(),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: stroke, shape: BoxShape.circle),
                  child: SvgPicture.asset('assets/toolbar/message.svg',
                      width: 18, height: 18)),
              const Align(
                child: AnimBadge(),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        const Column(
          children: [
            Text('Taylor'),
            Text('Developer'),
          ],
        ),
        const SizedBox(
          width: 5,
        ),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/user/user-10.png'),
          radius: 22,
        ),
        InkWell(
          child: Container(
            margin: const EdgeInsets.only(left: 6),
            child: const Icon(Icons.arrow_drop_down),
          ),
          onTap: () async {
            await showMenu(
                color: Colors.white,
                context: context,
                position: RelativeRect.fromLTRB(
                    MediaQuery.of(context).size.width - 100, 80, 0, 0),
                items: <PopupMenuItem<String>>[
                  const PopupMenuItem<String>(
                      value: 'value01', child: Text('My Profile')),
                  const PopupMenuItem<String>(
                      value: 'value02', child: Text('My Contacts')),
                  const PopupMenuItem<String>(
                      value: 'value03', child: Text('About Settings')),
                  PopupMenuItem<String>(
                      enabled: false,
                      value: 'value04',
                      child: _languagesWidget(context)),
                  const PopupMenuItem<String>(
                      value: 'value05', child: Text('Log out'))
                ]);
          },
        )
      ]),
    );
  }

  Widget _languagesWidget(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: AppLocalizations.supportedLocales.map((e) {
        return SizedBox(
          width: 50,
          height: 20,
          child:
              Consumer<LocalizationProvider>(builder: (ctx, provider, child) {
            return ButtonWidget(
              btnText: e.languageCode,
              isPrimary: e.languageCode == provider.languageCode,
              onTap: () {
                context.read<LocalizationProvider>().locale = e;
              },
            );
          }),
        );
      }).toList(),
    );
  }
}

class ToggleWidget extends StatelessWidget {
  ToggleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeProvider>().isDark;
    return InkWell(
      child: Container(
          padding: EdgeInsets.all(2),
          width: 78,
          decoration: BoxDecoration(
              color: stroke, borderRadius: BorderRadius.circular(25)),
          child: Row(
            children: [
              Expanded(
                  child: CircleAvatar(
                child: SvgPicture.asset('assets/toolbar/sun.svg',
                    width: 24,
                    height: 24,
                    color: isDark ? darkTextBody : primary),
                backgroundColor: isDark ? Colors.transparent : Colors.white,
              )),
              Expanded(
                  child: CircleAvatar(
                child: SvgPicture.asset('assets/toolbar/moon.svg',
                    width: 24,
                    height: 24,
                    color: isDark ? primary : darkTextBody),
                backgroundColor: isDark ? Colors.white : Colors.transparent,
              )),
            ],
          )),
      onTap: () {
        context.read<ThemeProvider>().isDark =
            !context.read<ThemeProvider>().isDark;
      },
    );
  }
}
