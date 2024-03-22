import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:free_flutter_admin_dashboard/components/buttons/primary_btn.dart';
import 'package:free_flutter_admin_dashboard/components/card/white_card.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: ScreenUtil().screenWidth * 0.8,
          padding: EdgeInsets.only(top: 60.h),
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
                width: 1.w,
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
                      'Sign Up to XAdmin',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16.h,
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
                      height: 16.h,
                    ),
                    Text('Password'),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.grey.shade200,
                        suffixIcon: Icon(Icons.password),
                        hintStyle: TextStyle(fontSize: 10.sp),
                        // labelText: 'Type to search...',
                        hintText: '6+ Characters, 1 Capital letter',
                        // helperText: 'Type to search...',
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text('Re-type Password'),
                    SizedBox(
                      height: 8.h,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.grey.shade200,
                        suffixIcon: Icon(Icons.password),
                        hintStyle: TextStyle(fontSize: 10.sp),
                        // labelText: 'Type to search...',
                        hintText: 'Re-enter your password',
                        // helperText: 'Type to search...',
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    PrimaryButton(
                      btnText: 'Create Account',
                      onTap: () {
                        Navigator.of(context).popAndPushNamed("/");
                      },
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    PrimaryButton(
                      btnText: 'Sign up with Google',
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
                        Text('Already have an account?'),
                        InkWell(
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.blue),
                          ),
                          onTap: () {
                            Navigator.of(context).popAndPushNamed('/signIn');
                          },
                        )
                      ],
                    )
                  ],
                ),
              ))
            ]),
          ),
        ),
      ),
    );
  }
}
