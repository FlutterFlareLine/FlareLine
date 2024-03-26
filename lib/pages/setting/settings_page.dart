import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:free_flutter_admin_dashboard/components/buttons/button_widget.dart';
import 'package:free_flutter_admin_dashboard/components/card/white_card.dart';
import 'package:free_flutter_admin_dashboard/components/forms/form_file_picker.dart';
import 'package:free_flutter_admin_dashboard/components/forms/outborder_text_form_field.dart';
import 'package:free_flutter_admin_dashboard/pages/layout.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SettingsPage extends LayoutWidget {
  SettingsPage();

  @override
  String title() {
    return 'Settings';
  }

  @override
  Widget contentWidget(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: _desktopWidget,
      mobile: _mobileWidget,
      tablet: _mobileWidget,
    );
  }

  Widget _desktopWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _leftWidget(context),
          flex: 3,
        ),
        SizedBox(
          width: 16.w,
        ),
        Expanded(
          child: _rightWidget(context),
          flex: 2,
        )
      ],
    );
  }

  Widget _mobileWidget(BuildContext context) {
    return Column(
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
            'Personal Information',
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: OutBorderTextFormField(
                                  icon: Container(
                                    child: SvgPicture.asset(
                                      'images/icon/user.svg',
                                      width: 22,
                                      height: 22,
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.w),
                                  ),
                                  labelText: 'Full Name',
                                  hintText: 'Enter your full name')),
                          SizedBox(
                            width: 12.w,
                          ),
                          Expanded(
                              child: OutBorderTextFormField(
                                  labelText: 'Phone Number',
                                  hintText: 'Enter your phone number'))
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      OutBorderTextFormField(
                        labelText: 'Email Address',
                        hintText: 'Enter your email address',
                        icon: Container(
                          child: SvgPicture.asset(
                            'images/signin/email.svg',
                            width: 22,
                            height: 22,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      OutBorderTextFormField(
                          labelText: 'Username',
                          hintText: 'Enter your username'),
                      SizedBox(
                        height: 16.h,
                      ),
                      OutBorderTextFormField(
                          maxLines: 5,
                          labelText: 'BIO',
                          icon: Container(
                            child: SvgPicture.asset(
                              'images/icon/edit.svg',
                              width: 22,
                              height: 22,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                          ),
                          hintText:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque posuere fermentum urna, eu condimentum mauris tempus ut. Donec fermentum blandit aliquet.'),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                              width: 60.w,
                              child: ButtonWidget(
                                btnText: 'Cancel',
                                isPrimary: false,
                              )),
                          SizedBox(
                            width: 12.w,
                          ),
                          SizedBox(
                              width: 60.w,
                              child: ButtonWidget(btnText: 'Save')),
                        ],
                      )
                    ])),
          ),
        ),
      ],
    );
  }

  DropzoneViewController? dropzoneViewController;

  _rightWidget(BuildContext context) {
    return WhiteCard(
        child: _titleWidget(
      'Your Photo',
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://nextjs-demo.tailadmin.com/_next/image?url=%2Fimages%2Fuser%2Fuser-01.png&w=256&q=75'),
                  radius: 22,
                ),
                SizedBox(
                  width: 8.w,
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
            SizedBox(
              height: 16.h,
            ),
            Container(
              color: HexColor('#EFF4FB'),
              child: Stack(
                children: [
                  DropzoneView(
                    operation: DragOperation.copy,
                    cursor: CursorType.grab,
                    onCreated: (DropzoneViewController ctrl) =>
                        dropzoneViewController = ctrl,
                    onLoaded: () => print('Zone loaded'),
                    onError: (String? ev) => print('Error: $ev'),
                    onHover: () => print('Zone hovered'),
                    onDrop: (dynamic ev) => print('Drop: $ev'),
                    onDropMultiple: (List<dynamic>? ev) =>
                        print('Drop multiple: $ev'),
                    onLeave: () => print('Zone left'),
                  ),
                  Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Icon(Icons.upload),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text('Click to upload or drag and drop'),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text('SVG,PNG,JPG or GIF'),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text('max,800 X 800px'),
                      SizedBox(
                        height: 20.h,
                      ),
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
                  child: ButtonWidget(
                    btnText: 'Cancel',
                    isPrimary: false,
                  ),
                ),
                SizedBox(
                  width: 12.w,
                ),
                SizedBox(width: 60.w, child: ButtonWidget(btnText: 'Save')),
              ],
            )
          ])),
    ));
  }
}
