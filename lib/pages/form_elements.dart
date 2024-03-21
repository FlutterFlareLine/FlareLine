import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_flutter_admin_dashboard/components/forms/form_file_picker.dart';
import 'package:free_flutter_admin_dashboard/components/forms/outborder_text_form_field.dart';
import 'package:free_flutter_admin_dashboard/pages/layout.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:getwidget/getwidget.dart';

class FormElementsPage extends LayoutWidget {
  FormElementsPage();

  @override
  String title() {
    return 'FormElements';
  }

  @override
  Widget contentWidget(BuildContext context) {
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
        Card(
          color: Colors.white,
          child: _titleWidget(
              'Input Fields',
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                OutBorderTextFormField(
                    labelText: 'Default Input', hintText: 'Default Input'),
                SizedBox(
                  height: 16.h,
                ),
                OutBorderTextFormField(
                    labelText: 'Active Input', hintText: 'Active Input'),
                SizedBox(
                  height: 16.h,
                ),
                OutBorderTextFormField(
                  labelText: 'Disabled label',
                  hintText: 'Disabled label',
                  enabled: false,
                )
              ])),
        ),
        SizedBox(
          height: 16,
        ),
        Card(
          color: Colors.white,
          child: _titleWidget(
              'Toggle switch input',
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Switch(value: false, onChanged: (r) {}),
                SizedBox(
                  height: 16,
                ),
                SwitchListTile(
                  title: Text('Switch Label'),
                  value: false,
                  onChanged: (r) {},
                ),
                SizedBox(
                  height: 16,
                ),
                GFToggle(
                  onChanged: (val) {},
                  value: true,
                  type: GFToggleType.ios,
                ),
                SizedBox(
                  height: 16,
                ),
                GFToggle(
                  onChanged: (val) {},
                  value: true,
                  type: GFToggleType.square,
                ),
                SizedBox(
                  height: 16,
                ),
                GFToggle(
                  onChanged: (val) {},
                  value: true,
                  type: GFToggleType.custom,
                ),
              ])),
        ),
        SizedBox(
          height: 16,
        ),
        Card(
          color: Colors.white,
          child: _titleWidget(
              'Time and date',
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date Picker'),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: () async {
                              List<DateTime?>? results =
                                  await showCalendarDatePicker2Dialog(
                                context: context,
                                config:
                                    CalendarDatePicker2WithActionButtonsConfig(),
                                dialogSize: const Size(325, 400),
                                borderRadius: BorderRadius.circular(15),
                              );
                              print(results);
                              dateNotifier.value =
                                  (results != null && results!.length > 0
                                      ? (results
                                              .elementAt(0)
                                              ?.toLocal()
                                              .toString()
                                              .substring(0, 10) ??
                                          '')
                                      : "");
                            },
                            child: ValueListenableBuilder(
                                valueListenable: dateNotifier,
                                builder: (c, val, child) {
                                  return Container(
                                      alignment: Alignment.centerLeft,
                                      height: 45,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              color: Colors.grey, width: 1)),
                                      child: Text(val));
                                }))
                      ],
                    )),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Select date'),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: () async {
                              List<DateTime?>? results =
                                  await showCalendarDatePicker2Dialog(
                                context: context,
                                config:
                                    CalendarDatePicker2WithActionButtonsConfig(),
                                dialogSize: const Size(325, 400),
                                borderRadius: BorderRadius.circular(15),
                              );
                              print(results);
                              dateNotifier.value =
                                  (results != null && results!.length > 0
                                      ? (results
                                              .elementAt(0)
                                              ?.toLocal()
                                              .toString()
                                              .substring(0, 10) ??
                                          '')
                                      : "");
                            },
                            child: ValueListenableBuilder(
                                valueListenable: dateNotifier,
                                builder: (c, val, child) {
                                  return Container(
                                      alignment: Alignment.centerLeft,
                                      height: 45,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              color: Colors.grey, width: 1)),
                                      child: Text(val));
                                }))
                      ],
                    )),
                  ])),
        ),
        SizedBox(
          height: 16,
        ),
        Card(
          color: Colors.white,
          child: _titleWidget(
              'File upload',
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                FormFilePicker(
                  title: 'Attach file',
                ),
                SizedBox(
                  height: 16.h,
                ),
                FormFilePicker(
                  title: 'Select Image',
                  allowExtention: ['jpg', 'jpeg', 'png', 'gif'],
                ),
              ])),
        )
      ],
    );
  }

  _rightWidget(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Card(
            color: Colors.white,
            child: _titleWidget(
                'Textarea Fields',
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  OutBorderTextFormField(
                    labelText: 'Default textarea',
                    hintText: 'Default textarea',
                    maxLines: 5,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  OutBorderTextFormField(
                      maxLines: 5,
                      labelText: 'Active textarea',
                      hintText: 'Active textarea'),
                  SizedBox(
                    height: 16.h,
                  ),
                  OutBorderTextFormField(
                      enabled: false,
                      maxLines: 5,
                      labelText: 'Disabled textarea',
                      hintText: 'Disabled textarea')
                ])),
          ),
          SizedBox(
            height: 16,
          ),
          Card(
            color: Colors.white,
            child: _titleWidget(
                'Checkbox and radio',
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ValueListenableBuilder(
                          valueListenable: checkNotifier,
                          builder: (ctx, res, widget) {
                            return Container(
                              child: GFCheckbox(
                                size: GFSize.SMALL,
                                activeBgColor: GFColors.DANGER,
                                onChanged: (value) {
                                  checkNotifier.value = value;
                                },
                                value: res,
                              ),
                            );
                          }),
                      SizedBox(
                        height: 16,
                      ),
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
                      SizedBox(
                        height: 16,
                      ),
                      ValueListenableBuilder(
                          valueListenable: checkNotifier3,
                          builder: (ctx, res, widget) {
                            return CupertinoCheckbox(
                              value: res,
                              onChanged: (r) {
                                checkNotifier3.value = r ?? false;
                              },
                            );
                          })
                    ])),
          ),
          SizedBox(
            height: 16,
          ),
          Card(
            color: Colors.white,
            child: _titleWidget(
                'Select input',
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Select country'),
                  SizedBox(
                    height: 12.h,
                  ),
                  _dropDownWidget(context),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text('Multiselect Dropdown'),
                  SizedBox(
                    height: 12.h,
                  ),
                  _multiSelectWidget(context)
                ])),
          ),
        ]);
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
