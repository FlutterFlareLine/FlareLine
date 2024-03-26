import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_flutter_admin_dashboard/components/buttons/button_widget.dart';
import 'package:free_flutter_admin_dashboard/components/card/white_card.dart';
import 'package:free_flutter_admin_dashboard/components/forms/form_file_picker.dart';
import 'package:free_flutter_admin_dashboard/components/forms/outborder_text_form_field.dart';
import 'package:free_flutter_admin_dashboard/pages/layout.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:getwidget/getwidget.dart';

class FormLayoutPage extends LayoutWidget {
  FormLayoutPage();

  @override
  String title() {
    return 'FormLayout';
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _leftWidget(context)),
        SizedBox(
          width: 16.w,
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
          height: 16.h,
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
              'Contact Form',
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  children: [
                    Expanded(
                        child: OutBorderTextFormField(
                            labelText: 'First name',
                            hintText: 'Enter your first name')),
                    SizedBox(
                      width: 12.w,
                    ),
                    Expanded(
                        child: OutBorderTextFormField(
                            labelText: 'Last name',
                            hintText: 'Enter your last name'))
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                OutBorderTextFormField(
                    labelText: 'Email', hintText: 'Enter your email address'),
                SizedBox(
                  height: 16.h,
                ),
                OutBorderTextFormField(
                    labelText: 'Subject', hintText: 'Enter your subject'),
                SizedBox(
                  height: 16.h,
                ),
                OutBorderTextFormField(
                    labelText: 'Subject', hintText: 'Select your subject'),
                SizedBox(
                  height: 16.h,
                ),
                OutBorderTextFormField(
                  labelText: 'Message',
                  hintText: 'Type your message',
                  maxLines: 5,
                ),
                SizedBox(
                  height: 16.h,
                ),
                ButtonWidget(btnText: 'Send Message')
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
          height: 20.h,
        ),
        _signUpWidget(context)
      ],
    );
  }

  Widget _signInWidget(BuildContext context) {
    return WhiteCard(
      child: _titleWidget(
          'Sign In Form',
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            OutBorderTextFormField(
                labelText: 'Email', hintText: 'Enter your email address'),
            SizedBox(
              height: 16.h,
            ),
            OutBorderTextFormField(
                labelText: 'Password', hintText: 'Enter password'),
            SizedBox(
              height: 16.h,
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
                Text('Remember me'),
                Spacer(),
                Text('Forget password?')
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            ButtonWidget(btnText: 'Sign In')
          ])),
    );
  }

  Widget _signUpWidget(BuildContext context) {
    return WhiteCard(
      child: _titleWidget(
          'Sign Up Form',
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            OutBorderTextFormField(
                labelText: 'Name', hintText: 'Enter your full name'),
            SizedBox(
              height: 16.h,
            ),
            OutBorderTextFormField(
                labelText: 'Email', hintText: 'Enter your email address'),
            SizedBox(
              height: 16.h,
            ),
            OutBorderTextFormField(
                labelText: 'Password', hintText: 'Enter password'),
            SizedBox(
              height: 16.h,
            ),
            OutBorderTextFormField(
                labelText: 'Re-type Password', hintText: 'Re-enter password'),
            SizedBox(
              height: 16.h,
            ),
            ButtonWidget(btnText: 'Sign Up')
          ])),
    );
  }

  ValueNotifier<String?> dropDownNotifier = ValueNotifier(null);

  Widget _dropDownWidget(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(20),
      child: DropdownButtonHideUnderline(
        child: ValueListenableBuilder(
            valueListenable: dropDownNotifier,
            builder: (ctx, res, widget) {
              return GFDropdown(
                borderRadius: BorderRadius.circular(5),
                border: const BorderSide(color: Colors.black12, width: 1),
                dropdownButtonColor: Colors.white,
                value: res,
                onChanged: (newValue) {
                  dropDownNotifier.value = newValue;
                },
                items: [
                  'FC Barcelona',
                  'Real Madrid',
                  'Villareal',
                  'Manchester City'
                ]
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
              );
            }),
      ),
    );
  }

  List<String> dropList = ['China', 'USA', 'England', "Russia", 'Japan'];

  Widget _multiSelectWidget(BuildContext context) {
    return GFMultiSelect(
      items: dropList,
      onSelect: (value) {
        print('selected $value ');
      },
      dropdownTitleTileText: 'Messi, Griezmann, Coutinho ',
      dropdownTitleTileMargin:
          EdgeInsets.only(top: 22, left: 18, right: 18, bottom: 5),
      dropdownTitleTilePadding: EdgeInsets.all(10),
      dropdownUnderlineBorder:
          const BorderSide(color: Colors.transparent, width: 2),
      dropdownTitleTileBorder:
          Border.all(color: Colors.grey.shade200, width: 1),
      dropdownTitleTileBorderRadius: BorderRadius.circular(5),
      expandedIcon: const Icon(
        Icons.keyboard_arrow_down,
        color: Colors.black54,
      ),
      collapsedIcon: const Icon(
        Icons.keyboard_arrow_up,
        color: Colors.black54,
      ),
      submitButton: Text('OK'),
      cancelButton: Text('Cancel'),
      dropdownTitleTileTextStyle:
          const TextStyle(fontSize: 14, color: Colors.black54),
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.all(6),
      type: GFCheckboxType.basic,
      activeBgColor: GFColors.SUCCESS,
      activeBorderColor: GFColors.SUCCESS,
      inactiveBorderColor: Colors.grey.shade200,
    );
  }
}
