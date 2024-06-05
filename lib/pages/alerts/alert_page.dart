import 'package:flareline/core/theme/global_colors.dart';
import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/card/title_card.dart';
import 'package:flutter/material.dart';

import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline/pages/layout.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flareline/flutter_gen/app_localizations.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class AlertPage extends LayoutWidget {
  const AlertPage({super.key});

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Column(
      children: [
        TitleCard(
            title: AppLocalizations.of(context)!.alertTips,
            childWidget: Column(
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
            )),
        const SizedBox(
          height: 20,
        ),
        TitleCard(
            title: AppLocalizations.of(context)!.alertDialog,
            childWidget: Column(
              children: [
                ButtonWidget(
                  btnText: AppLocalizations.of(context)!.info,
                  type: ButtonType.info.type,
                  onTap: () {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.info,
                    ); //
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  btnText: AppLocalizations.of(context)!.success,
                  type: ButtonType.success.type,
                  onTap: () {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  btnText: AppLocalizations.of(context)!.warn,
                  type: ButtonType.warn.type,
                  onTap: () {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.warning,
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  btnText: AppLocalizations.of(context)!.danger,
                  type: ButtonType.danger.type,
                  onTap: () {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.error,
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  btnText: AppLocalizations.of(context)!.confirm,
                  type: ButtonType.dark.type,
                  onTap: () {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.confirm,
                    );
                  },
                ),

                const SizedBox(
                  height: 20,
                ),
              ],
            )),
        const SizedBox(
          height: 20,
        ),
        TitleCard(
            title: AppLocalizations.of(context)!.simpleAlert,
            childWidget: Column(
              children: [
                ButtonWidget(
                  btnText: AppLocalizations.of(context)!.info,
                  type: ButtonType.info.type,
                  onTap: () {
                    Alert(
                      context: context,
                      type: AlertType.info,
                      title: AppLocalizations.of(context)!.rflutterAlert,
                      desc: AppLocalizations.of(context)!.rflutterTip,
                      buttons: [
                        DialogButton(
                          child: Text(
                            AppLocalizations.of(context)!.cool,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();//
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  btnText: AppLocalizations.of(context)!.success,
                  type: ButtonType.success.type,
                  onTap: () {
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: AppLocalizations.of(context)!.rflutterAlert,
                      desc: AppLocalizations.of(context)!.rflutterTip,
                      buttons: [
                        DialogButton(
                          child: Text(
                            AppLocalizations.of(context)!.cool,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();//
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  btnText: AppLocalizations.of(context)!.warn,
                  type: ButtonType.warn.type,
                  onTap: () {
                    Alert(
                      context: context,
                      type: AlertType.warning,
                      title: AppLocalizations.of(context)!.rflutterAlert,
                      desc: AppLocalizations.of(context)!.rflutterTip,
                      buttons: [
                        DialogButton(
                          child: Text(
                            AppLocalizations.of(context)!.cool,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();//
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  btnText: AppLocalizations.of(context)!.danger,
                  type: ButtonType.danger.type,
                  onTap: () {
                    Alert(
                      context: context,
                      type: AlertType.error,
                      title: AppLocalizations.of(context)!.rflutterAlert,
                      desc: AppLocalizations.of(context)!.rflutterTip,
                      buttons: [
                        DialogButton(
                          child: Text(
                            AppLocalizations.of(context)!.cool,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();//
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  btnText: AppLocalizations.of(context)!.simple,
                  color: Colors.white,
                  borderRadius: 5,
                  borderColor: GlobalColors.normal,
                  textColor: GlobalColors.normal,
                  onTap: () {
                    Alert(
                      context: context,
                      type: AlertType.none,
                      title: AppLocalizations.of(context)!.rflutterAlert,
                      desc: AppLocalizations.of(context)!.rflutterTip,
                      buttons: [
                        DialogButton(
                          child: Text(
                            AppLocalizations.of(context)!.cool,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                          color: GlobalColors.primary,
                        )
                      ],
                    ).show();//
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  btnText: AppLocalizations.of(context)!.simpleConfirm,
                  color: Colors.white,
                  borderRadius: 5,
                  borderColor: GlobalColors.normal,
                  textColor: GlobalColors.normal,
                  onTap: () {
                    Alert(
                      context: context,
                      type: AlertType.none,
                      title: AppLocalizations.of(context)!.rflutterAlert,
                      desc: AppLocalizations.of(context)!.rflutterTip,
                      buttons: [
                        DialogButton(
                          onPressed: () => Navigator.pop(context),
                          width: 60,
                          child:  Text(
                            AppLocalizations.of(context)!.cancel,
                            style: TextStyle(color: GlobalColors.primary, fontSize: 14),
                          ),
                        ),
                        DialogButton(
                          onPressed: () => Navigator.pop(context),
                          width: 60,
                          color: GlobalColors.primary,
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            AppLocalizations.of(context)!.confirm,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        )
                      ],
                    ).show();//
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  btnText: AppLocalizations.of(context)!.seeDetail,
                  type: ButtonType.dark.type,
                  onTap: () async {
                    String url = 'https://quickalert.belovance.com/';
                    Uri uri = Uri.parse(url);
                    if (await canLaunchUrl(uri)) {
                      launchUrl(uri);
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )),
        const SizedBox(
          height: 20,
        ),
      ],
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
