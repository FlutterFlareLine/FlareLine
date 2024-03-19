import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_flutter_admin_dashboard/components/buttons/primary_btn.dart';
import 'package:free_flutter_admin_dashboard/components/forms/form_file_picker.dart';
import 'package:free_flutter_admin_dashboard/pages/layout.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:getwidget/getwidget.dart';

class SettingsPage extends LayoutWidget {
  SettingsPage();

  @override
  String title() {
    return 'Settings';
  }

  @override
  Widget contentWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _leftWidget(context),
        SizedBox(
          height: 16.w,
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
        Card(
          color: Colors.white,
          child: _titleWidget(
              'Personal Information',
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Full Name',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'Enter your full name'),
                    )),
                    SizedBox(
                      width: 12.w,
                    ),
                    Expanded(
                        child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Phone Number',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'Enter your phone number'),
                    ))
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Email Address',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Enter your email address'),
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Username',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Enter your username'),
                ),
                SizedBox(
                  height: 16.h,
                ),
                TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                      labelText: 'BIO',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Type your BIO'),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        width: 60.w,
                        child: PrimaryButton(
                          btnText: 'Cancel',
                          isPrimary: false,
                        )),
                    SizedBox(width: 12.w,),
                    SizedBox(
                        width: 60.w, child: PrimaryButton(btnText: 'Save')),
                  ],
                )
              ])),
        ),
      ],
    );
  }

  DropzoneViewController? dropzoneViewController;

  _rightWidget(BuildContext context) {
    return Card(
      color: Colors.white,
      child: _titleWidget(
          'Your Photo',
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://nextjs-demo.tailadmin.com/_next/image?url=%2Fimages%2Fuser%2Fuser-01.png&w=256&q=75'),
                  radius: 22,
                ),
                Column(
                  children: [
                    Text('Edit your photo'),
                    Row(
                      children: [
                        Text('Delete'),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text('Update')
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 16.h,),
            Container(
              color: Colors.lightBlueAccent.shade100,
              child: Stack(
                children: [
                  DropzoneView(
                    operation: DragOperation.copy,
                    cursor: CursorType.grab,
                    onCreated: (DropzoneViewController ctrl) => dropzoneViewController = ctrl,
                    onLoaded: () => print('Zone loaded'),
                    onError: (String? ev) => print('Error: $ev'),
                    onHover: () => print('Zone hovered'),
                    onDrop: (dynamic ev) => print('Drop: $ev'),
                    onDropMultiple: (List<dynamic>? ev) => print('Drop multiple: $ev'),
                    onLeave: () => print('Zone left'),
                  ),
                  Center(child: Column(
                    children: [
                      SizedBox(height: 20.h,),
                      Icon(Icons.upload),
                      SizedBox(height: 10.h,),
                      Text('Click to upload or drag and drop'),
                      SizedBox(height: 10.h,),
                      Text('SVG,PNG,JPG or GIF'),
                      SizedBox(height: 10.h,),
                      Text('max,800 X 800px'),
                      SizedBox(height: 20.h,),
                    ],
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 60.w,
                  child: PrimaryButton(
                    btnText: 'Cancel',
                    isPrimary: false,
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                SizedBox(width: 60.w, child: PrimaryButton(btnText: 'Save')),
              ],
            )
          ])),
    );
  }
}
