import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_flutter_admin_dashboard/components/forms/form_file_picker.dart';
import 'package:free_flutter_admin_dashboard/pages/layout.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
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

  _leftWidget(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.white,
          child: _titleWidget(
              'Input Fields',
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Default Input',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Default Input'),
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Active Input',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Active Input'),
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                      labelText: 'Disabled label',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Disabled label'),
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
                  TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Default textarea',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Default textarea'),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFormField(
                    maxLines: 5,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Active textarea',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Active textarea'),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  TextFormField(
                    enabled: false,
                    maxLines: 5,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Disabled textarea',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        hintText: 'Disabled textarea'),
                  )
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
                            return GFCheckbox(
                              size: GFSize.SMALL,
                              activeBgColor: GFColors.DANGER,
                              onChanged: (value) {
                                checkNotifier.value = value;
                              },
                              value: res,
                            );
                          }),
                      SizedBox(
                        height: 16,
                      ),
                      GFCheckbox(
                        value: false,
                        onChanged: (r) {},
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CupertinoCheckbox(
                        value: false,
                        onChanged: (r) {},
                      )
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
        ]);
  }
}
