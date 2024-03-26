import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:free_flutter_admin_dashboard/components/buttons/button_widget.dart';
import 'package:free_flutter_admin_dashboard/components/card/white_card.dart';
import 'package:free_flutter_admin_dashboard/components/forms/form_file_picker.dart';
import 'package:free_flutter_admin_dashboard/components/forms/outborder_text_form_field.dart';
import 'package:free_flutter_admin_dashboard/pages/layout.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormLayoutPage extends LayoutWidget {
  FormLayoutPage();

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
        SizedBox(
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
        SizedBox(
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
        padding: EdgeInsets.only(left: 10),
        alignment: Alignment.centerLeft,
        child: Text(title),
      ),
      Divider(
        height: 1,
      ),
      Padding(padding: EdgeInsets.all(16), child: childWidget)
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
                            hintText: AppLocalizations.of(context)!.firstNameHint)),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: OutBorderTextFormField(
                            labelText: AppLocalizations.of(context)!.lastName,
                            hintText: AppLocalizations.of(context)!.lastNameHint))
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                OutBorderTextFormField(
                    labelText: AppLocalizations.of(context)!.email, hintText: AppLocalizations.of(context)!.emailHint),
                SizedBox(
                  height: 16,
                ),
                OutBorderTextFormField(
                    labelText: AppLocalizations.of(context)!.subject, hintText: AppLocalizations.of(context)!.subjectHint),
                SizedBox(
                  height: 16,
                ),
                OutBorderTextFormField(
                    labelText: AppLocalizations.of(context)!.subject, hintText: AppLocalizations.of(context)!.selectSubjectHint),
                SizedBox(
                  height: 16,
                ),
                OutBorderTextFormField(
                  labelText: AppLocalizations.of(context)!.message,
                  hintText: AppLocalizations.of(context)!.messageHint,
                  maxLines: 5,
                ),
                SizedBox(
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
        SizedBox(
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
                labelText: AppLocalizations.of(context)!.email, hintText: AppLocalizations.of(context)!.emailHint),
            SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
                labelText: AppLocalizations.of(context)!.password, hintText: AppLocalizations.of(context)!.passwordHint),
            SizedBox(
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
                Spacer(),
                Text(AppLocalizations.of(context)!.forgetPwd)
              ],
            ),
            SizedBox(
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
                labelText: AppLocalizations.of(context)!.fullName, hintText:AppLocalizations.of(context)!.fullNameHint),
            SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
                labelText: AppLocalizations.of(context)!.email, hintText:AppLocalizations.of(context)!.emailHint),
            SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
                labelText: AppLocalizations.of(context)!.password, hintText: AppLocalizations.of(context)!.passwordHint),
            SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
                labelText: AppLocalizations.of(context)!.retypePassword, hintText: AppLocalizations.of(context)!.retypePasswordHint),
            SizedBox(
              height: 16,
            ),
            ButtonWidget(btnText: AppLocalizations.of(context)!.signUp)
          ])),
    );
  }
}
