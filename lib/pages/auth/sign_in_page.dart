import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:free_flutter_admin_dashboard/components/buttons/button_widget.dart';
import 'package:free_flutter_admin_dashboard/components/card/white_card.dart';
import 'package:free_flutter_admin_dashboard/components/forms/outborder_text_form_field.dart';
import 'package:free_flutter_admin_dashboard/pages/layout.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInWidget extends LayoutWidget {
  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Center(
        child: Container(
      margin: EdgeInsets.only(left: 100, right: 100, top: 100),
      child: WhiteCard(
        isAutoHeight: true,
        padding: EdgeInsets.symmetric(vertical: 100),
        child: Row(children: [
          Expanded(
              child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.appName,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              Text(AppLocalizations.of(context)!.slogan),
              SizedBox(
                height: 16,
              ),
              Container(
                width: 200,
                height: 300,
                child: SvgPicture.asset('assets/signin/main.svg',
                    semanticsLabel: ''),
              )
            ],
          )),
          VerticalDivider(
            width: 1,
            color: HexColor('#E2E8F0'),
          ),
          Expanded(
            child: _signInFormWidget(context),
          )
        ]),
      ),
    ));
  }

  @override
  Widget contentMobileWidget(BuildContext context) {
    return WhiteCard(
        isAutoHeight: true,
        padding: EdgeInsets.symmetric(vertical: 60),
        child: _signInFormWidget(context));
  }

  Widget _signInFormWidget(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.signIn,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            OutBorderTextFormField(
              labelText: AppLocalizations.of(context)!.email,
              hintText: AppLocalizations.of(context)!.emailHint,
              keyboardType: TextInputType.emailAddress,
              suffixWidget: SvgPicture.asset(
                'assets/signin/email.svg',
                width: 22,
                height: 22,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
              obscureText: true,
              labelText: AppLocalizations.of(context)!.password,
              hintText: AppLocalizations.of(context)!.passwordHint,
              suffixWidget: SvgPicture.asset(
                'assets/signin/lock.svg',
                width: 22,
                height: 22,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ButtonWidget(
              btnText: AppLocalizations.of(context)!.signIn,
              onTap: () {
                Navigator.of(context).popAndPushNamed("/");
              },
            ),
            SizedBox(
              height: 12,
            ),
            ButtonWidget(
              iconWidget: SvgPicture.asset(
                'assets/brand/brand-01.svg',
                width: 20,
                height: 20,
              ),
              btnText: AppLocalizations.of(context)!.signInWithGoogle,
              onTap: () {
                Navigator.of(context).popAndPushNamed("/");
              },
              isPrimary: false,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.dontHaveAccount),
                InkWell(
                  child: Text(
                    AppLocalizations.of(context)!.signUp,
                    style: TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    Navigator.of(context).popAndPushNamed('/signUp');
                  },
                )
              ],
            )
          ],
        ));
  }

  @override
  // TODO: implement showTitle
  bool get showTitle => false;

  @override
  // TODO: implement isPage
  bool get isPage => true;
}
