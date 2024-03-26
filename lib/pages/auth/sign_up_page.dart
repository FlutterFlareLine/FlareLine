import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:free_flutter_admin_dashboard/components/buttons/button_widget.dart';
import 'package:free_flutter_admin_dashboard/components/card/white_card.dart';
import 'package:free_flutter_admin_dashboard/components/forms/outborder_text_form_field.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 100),
          padding: EdgeInsets.only(top: 60),
          child: WhiteCard(
            isAutoHeight: true,
            padding: EdgeInsets.symmetric(vertical: 60),
            child: Row(children: [
              Expanded(
                  child: Column(
                children: [
                  Text(
                    'XAdmin',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text('Simple web, develop faster'),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: 200,
                    height: 300,
                    child: SvgPicture.asset('images/signin/main.svg',
                        semanticsLabel: ''),
                  )
                ],
              )),
              VerticalDivider(
                width: 1,
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Start for free'),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Sign Up to XAdmin',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
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
                      height: 16,
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
                      height: 20,
                    ),
                    OutBorderTextFormField(
                      obscureText: true,
                      labelText: 'Re-type Password',
                      hintText: 'Re-enter your password',
                      suffixWidget: SvgPicture.asset(
                        'images/signin/lock.svg',
                        width: 22,
                        height: 22,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonWidget(
                      btnText: 'Create Account',
                      onTap: () {
                        Navigator.of(context).popAndPushNamed("/");
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    ButtonWidget(
                      btnText: 'Sign up with Google',
                      onTap: () {
                        Navigator.of(context).popAndPushNamed("/");
                      },
                      isPrimary: false,
                    ),
                    SizedBox(
                      height: 20,
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
