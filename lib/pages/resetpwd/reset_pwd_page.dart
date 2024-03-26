import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:free_flutter_admin_dashboard/components/buttons/button_widget.dart';
import 'package:free_flutter_admin_dashboard/components/card/white_card.dart';
import 'package:free_flutter_admin_dashboard/components/forms/outborder_text_form_field.dart';

class ResetPwdWidget extends StatelessWidget {
  const ResetPwdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 100),
        child: WhiteCard(
          isAutoHeight: true,
          padding: EdgeInsets.symmetric(vertical: 60),
          child: Row(children: [
            Expanded(
                child: Column(
              children: [
                Text(
                  'XAdmin',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Reset Password',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                      'Enter your email address to receive a password reset link.'),
                  SizedBox(
                    height: 20,
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
                    height: 20,
                  ),
                  ButtonWidget(
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
      )),
    );
  }
}
