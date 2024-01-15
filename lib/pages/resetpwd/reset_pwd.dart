import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:free_flutter_admin_dashboard/components/buttons/primary_btn.dart';

class ResetPwdWidget extends StatelessWidget {
  const ResetPwdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        width: ScreenUtil().screenWidth * 0.8,
        height: ScreenUtil().screenHeight * 0.8,
        child: Card(
          child: Padding(
            padding: EdgeInsets.only(
              top: 30.h,
            ),
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
                width: 1.w,
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100.h,
                    ),
                    Text(
                      'Reset Password',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                        'Enter your email address to receive a password reset link.'),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text('Email'),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.grey.shade200,
                        suffixIcon: Icon(Icons.email),

                        hintStyle: TextStyle(fontSize: 10.sp),
                        // labelText: 'Type to search...',
                        hintText: 'Enter your email',
                        // helperText: 'Type to search...',
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    PrimaryButton(
                      btnText: 'Send Password Reset Link',
                      onTap: () {
                        Navigator.of(context).popAndPushNamed("/");
                      },
                    ),
                  ],
                ),
              ))
            ]),
          ),
        ),
      )),
    );
  }
}
