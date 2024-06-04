import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline_uikit/components/forms/outborder_text_form_field.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/flutter_gen/app_localizations.dart';

class ResetPwdWidget extends LayoutWidget {
  const ResetPwdWidget({super.key});

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Center(
      child: CommonCard(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Row(children: [
          Expanded(
              child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.appName,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(AppLocalizations.of(context)!.slogan),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 200,
                height: 300,
                child: SvgPicture.asset('assets/signin/main.svg',
                    semanticsLabel: ''),
              )
            ],
          )),
          const VerticalDivider(
            width: 1,
          ),
          Expanded(child: _formWidget(context))
        ]),
      ),
    );
  }

  @override
  Widget contentMobileWidget(BuildContext context) {
    return Center(
      child: CommonCard(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: _formWidget(context),
      ),
    );
  }

  Widget _formWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.resetPwd,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(AppLocalizations.of(context)!.emailReceiveResetLink),
          const SizedBox(
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
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
            btnText: AppLocalizations.of(context)!.sendPwdResetLink,
            type: ButtonType.primary.type,
            onTap: () {
              Navigator.of(context).popAndPushNamed("/");
            },
          ),
        ],
      ),
    );
  }

  @override
  bool get isPage => true;

  @override
  bool get showTitle => false;

  @override
  bool get isAlignCenter => true;
}
