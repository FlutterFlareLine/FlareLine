
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flareline/components/buttons/button_widget.dart';
import 'package:flareline/components/card/white_card.dart';
import 'package:flareline/components/forms/outborder_text_form_field.dart';
import 'package:flareline/pages/layout.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormLayoutPage extends LayoutWidget {
  FormLayoutPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    return AppLocalizations.of(context)!.formLayoutPageTitle;
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _leftWidget(context)),
        const SizedBox(
          width: 16,
        ),
        Expanded(child: _rightWidget(context))
      ],
    );
  }

  @override
  Widget contentMobileWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _leftWidget(context),
        const SizedBox(
          height: 16,
        ),
        _rightWidget(context)
      ],
    );
  }

  _titleWidget(String title, Widget childWidget) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 50,
        padding: const EdgeInsets.only(left: 10),
        alignment: Alignment.centerLeft,
        child: Text(title),
      ),
      const Divider(
        height: 1,
      ),
      Padding(padding: const EdgeInsets.all(16), child: childWidget)
    ]);
  }

  ValueNotifier<String> dateNotifier = ValueNotifier("");

  ValueNotifier<bool> checkNotifier = ValueNotifier(false);
  ValueNotifier<bool> checkNotifier1 = ValueNotifier(false);
  ValueNotifier<bool> checkNotifier3 = ValueNotifier(false);

  _leftWidget(BuildContext context) {
    return Column(
      children: [
        WhiteCard(
          child: _titleWidget(
              AppLocalizations.of(context)!.contactForm,
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  children: [
                    Expanded(
                        child: OutBorderTextFormField(
                            labelText: AppLocalizations.of(context)!.firstName,
                            hintText:
                                AppLocalizations.of(context)!.firstNameHint)),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: OutBorderTextFormField(
                            labelText: AppLocalizations.of(context)!.lastName,
                            hintText:
                                AppLocalizations.of(context)!.lastNameHint))
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                OutBorderTextFormField(
                    labelText: AppLocalizations.of(context)!.email,
                    hintText: AppLocalizations.of(context)!.emailHint),
                const SizedBox(
                  height: 16,
                ),
                OutBorderTextFormField(
                    labelText: AppLocalizations.of(context)!.subject,
                    hintText: AppLocalizations.of(context)!.subjectHint),
                const SizedBox(
                  height: 16,
                ),
                OutBorderTextFormField(
                    labelText: AppLocalizations.of(context)!.subject,
                    hintText: AppLocalizations.of(context)!.selectSubjectHint),
                const SizedBox(
                  height: 16,
                ),
                OutBorderTextFormField(
                  labelText: AppLocalizations.of(context)!.message,
                  hintText: AppLocalizations.of(context)!.messageHint,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 16,
                ),
                ButtonWidget(btnText: AppLocalizations.of(context)!.sendMessage)
              ])),
        ),
      ],
    );
  }

  _rightWidget(BuildContext context) {
    return Column(
      children: [
        _signInWidget(context),
        const SizedBox(
          height: 20,
        ),
        _signUpWidget(context)
      ],
    );
  }

  Widget _signInWidget(BuildContext context) {
    return WhiteCard(
      child: _titleWidget(
          AppLocalizations.of(context)!.signInForm,
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            OutBorderTextFormField(
                labelText: AppLocalizations.of(context)!.email,
                hintText: AppLocalizations.of(context)!.emailHint),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
                labelText: AppLocalizations.of(context)!.password,
                hintText: AppLocalizations.of(context)!.passwordHint),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                ValueListenableBuilder(
                    valueListenable: checkNotifier1,
                    builder: (ctx, res, widget) {
                      return Checkbox(
                        value: res,
                        activeColor: Colors.red, //选中时的颜色
                        onChanged: (value) {
                          checkNotifier1.value = value ?? false;
                        },
                      );
                    }),
                Text(AppLocalizations.of(context)!.rememberMe),
                const Spacer(),
                Text(AppLocalizations.of(context)!.forgetPwd)
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            ButtonWidget(btnText: AppLocalizations.of(context)!.signIn)
          ])),
    );
  }

  Widget _signUpWidget(BuildContext context) {
    return WhiteCard(
      child: _titleWidget(
          AppLocalizations.of(context)!.signUpForm,
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            OutBorderTextFormField(
                labelText: AppLocalizations.of(context)!.fullName,
                hintText: AppLocalizations.of(context)!.fullNameHint),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
                labelText: AppLocalizations.of(context)!.email,
                hintText: AppLocalizations.of(context)!.emailHint),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
                labelText: AppLocalizations.of(context)!.password,
                hintText: AppLocalizations.of(context)!.passwordHint),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
                labelText: AppLocalizations.of(context)!.retypePassword,
                hintText: AppLocalizations.of(context)!.retypePasswordHint),
            const SizedBox(
              height: 16,
            ),
            ButtonWidget(btnText: AppLocalizations.of(context)!.signUp)
          ])),
    );
  }
}
