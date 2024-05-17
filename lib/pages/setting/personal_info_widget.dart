import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline_uikit/components/forms/outborder_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalInfoWidget extends StatelessWidget {
  const PersonalInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      title: AppLocalizations.of(context)!.personalInfo,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Expanded(
                child: OutBorderTextFormField(
                    icon: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: SvgPicture.asset(
                        'assets/icon/user.svg',
                        width: 22,
                        height: 22,
                      ),
                    ),
                    labelText: AppLocalizations.of(context)!.fullName,
                    hintText: AppLocalizations.of(context)!.fullNameHint)),
            const SizedBox(
              width: 12,
            ),
            Expanded(
                child: OutBorderTextFormField(
                    labelText: AppLocalizations.of(context)!.phoneNumber,
                    hintText: AppLocalizations.of(context)!.phoneNumberHint))
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        OutBorderTextFormField(
          labelText: AppLocalizations.of(context)!.email,
          hintText: AppLocalizations.of(context)!.emailHint,
          icon: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: SvgPicture.asset(
              'assets/signin/email.svg',
              width: 22,
              height: 22,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        OutBorderTextFormField(
            labelText: AppLocalizations.of(context)!.userName,
            hintText: AppLocalizations.of(context)!.userNameHint),
        const SizedBox(
          height: 16,
        ),
        OutBorderTextFormField(
          maxLines: 5,
          labelText: AppLocalizations.of(context)!.bio,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
                width: 60,
                child: ButtonWidget(
                  btnText: AppLocalizations.of(context)!.cancel,
                )),
            const SizedBox(
              width: 12,
            ),
            SizedBox(
                width: 60,
                child: ButtonWidget(
                  btnText: AppLocalizations.of(context)!.save,
                  type: ButtonType.primary.type,
                )),
          ],
        )
      ]),
    );
  }
}
