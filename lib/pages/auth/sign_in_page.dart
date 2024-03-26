import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:free_flutter_admin_dashboard/components/buttons/button_widget.dart';
import 'package:free_flutter_admin_dashboard/components/card/white_card.dart';
import 'package:free_flutter_admin_dashboard/components/forms/outborder_text_form_field.dart';
import 'package:hexcolor/hexcolor.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        width: ScreenUtil().screenWidth * 0.8,
        child: WhiteCard(
          isAutoHeight: true,
          padding: EdgeInsets.symmetric(vertical: 60.h),
          child: Row(children: [
            Expanded(
                child: Column(
              children: [
                Text(
                  'XAdmin',
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text('Simple web, develop faster'),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  width: 200.w,
                  height: 300.h,
                  child: SvgPicture.asset('images/signin/main.svg',
                      semanticsLabel: ''),
                )
              ],
            )),
            VerticalDivider(
              width: 1,
              color: HexColor('#E2E8F0'),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Start for free'),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    'Sign In to XAdmin',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  OutBorderTextFormField(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                    suffixWidget: SvgPicture.asset(
                      'images/signin/email.svg',
                      width: 22,
                      height: 22,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  OutBorderTextFormField(
                    obscureText: true,
                    labelText: 'Password',
                    hintText: '6+ Characters, 1 Capital letter',
                    suffixWidget: SvgPicture.asset(
                      'images/signin/lock.svg',
                      width: 22,
                      height: 22,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  ButtonWidget(
                    btnText: 'Sign In',
                    onTap: () {
                      Navigator.of(context).popAndPushNamed("/");
                    },
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  ButtonWidget(
                    iconWidget: SvgPicture.asset(
                      'images/brand/brand-01.svg',
                      width: 20.w,
                      height: 20.w,
                    ),
                    btnText: 'Sign in with Google',
                    onTap: () {
                      Navigator.of(context).popAndPushNamed("/");
                    },
                    isPrimary: false,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have any account?'),
                      InkWell(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.blue),
                        ),
                        onTap: () {
                          Navigator.of(context).popAndPushNamed('/signUp');
                        },
                      )
                    ],
                  )
                ],
              ),
            ))
          ]),
        ),
      )),
    );
  }
}
