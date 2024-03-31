import 'package:flutter/material.dart';

import 'package:flareline/components/card/white_card.dart';
import 'package:flareline/pages/layout.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AlertPage extends LayoutWidget {
  const AlertPage({super.key});

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return WhiteCard(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          _itemAlert(
              borderColor: HexColor('#FBBF24'),
              color: HexColor('#FEF5DE'),
              icon: Image.asset(
                'assets/alert/icon_warn.png',
                width: 32,
              ),
              title: AppLocalizations.of(context)!.alertsTitle,
              content: AppLocalizations.of(context)!.alertsMessage,
              titleColor: HexColor('#9D5425'),
              contentColor: HexColor('#D0915C')),
          const SizedBox(
            height: 20,
          ),
          _itemAlert(
              borderColor: HexColor('#34D399'),
              color: HexColor('#E1F9F0'),
              icon: Image.asset(
                'assets/alert/icon_success.png',
                width: 32,
              ),
              title: AppLocalizations.of(context)!.alertsTitle,
              content: AppLocalizations.of(context)!.alertsMessage,
              titleColor: HexColor('#004434'),
              contentColor: HexColor('#637381')),
          const SizedBox(
            height: 20,
          ),
          _itemAlert(
              borderColor: HexColor('#F87171'),
              color: HexColor('#FEEAEA'),
              icon: Image.asset(
                'assets/alert/icon_fail.png',
                width: 32,
              ),
              title: AppLocalizations.of(context)!.alertsTitle,
              content: AppLocalizations.of(context)!.alertsMessage,
              titleColor: HexColor('#BC1C21'),
              contentColor: HexColor('#CD5D5D')),
        ],
      ),
    );
  }

  @override
  String breakTabTitle(BuildContext context) {
    return AppLocalizations.of(context)!.alertsPageTitle;
  }

  _itemAlert(
      {required Color borderColor,
      required Color color,
      required Widget icon,
      required String title,
      required String content,
      required Color titleColor,
      required Color contentColor}) {
    return Container(
      height: 150,
      color: color,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 4,
            height: double.maxFinite,
            color: borderColor,
          ),
          const SizedBox(
            width: 20,
          ),
          icon,
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: titleColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(content,
                    style: TextStyle(color: contentColor, fontSize: 12)),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
