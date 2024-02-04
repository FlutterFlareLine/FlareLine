import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_flutter_admin_dashboard/components/forms/form_file_picker.dart';
import 'package:free_flutter_admin_dashboard/pages/layout.dart';
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
      children: [
        Expanded(child: _leftWidget(context)),
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
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
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
                FormFilePicker(title: 'Attach file',),
                SizedBox(
                  height: 16.h,
                ),
                FormFilePicker(
                  title: 'Select Image',
                  allowExtention: ['jpg','jpeg','png','gif'],
                ),
              ])),
        )
      ],
    );
  }

  _rightWidget(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Column(
          children: [],
        ));
  }
}
