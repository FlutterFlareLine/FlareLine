import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        width: ScreenUtil().screenWidth * 0.8,
        height: ScreenUtil().screenHeight * 0.8,
        child: Card(
          color: Colors.white,
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
                    color: Colors.green,
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
                      'Sign In to XAdmin',
                      style: TextStyle(
                          fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
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
                    ElevatedButton(onPressed: () {}, child: Text('Sign In')),
                    SizedBox(
                      height: 12.h,
                    ),
                    ElevatedButton.icon(
                      icon: Icon(Icons.social_distance),
                      label: Text("Sign in with Google"),
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have any account?'),
                        Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.blue),
                        )
                      ],
                    )
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
