import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:free_flutter_admin_dashboard/components/buttons/button_widget.dart';
import 'package:free_flutter_admin_dashboard/components/card/white_card.dart';
import 'package:free_flutter_admin_dashboard/components/forms/outborder_text_form_field.dart';
import 'package:free_flutter_admin_dashboard/pages/layout.dart';
import 'package:hexcolor/hexcolor.dart';

class SignInWidget extends LayoutWidget {
  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Center(
        child: Container(
          margin: EdgeInsets.only(left: 100,right: 100,top: 100),
      child: WhiteCard(
        isAutoHeight: true,
        padding: EdgeInsets.symmetric(vertical: 100),
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
            color: HexColor('#E2E8F0'),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: _signInFormWidget(context),
          ))
        ]),
      ),
    ));
  }

  @override
  Widget contentMobileWidget(BuildContext context) {
    return WhiteCard(
        isAutoHeight: true,
        padding: EdgeInsets.symmetric(vertical: 60,horizontal: 50),
        child: _signInFormWidget(context));
  }

  Widget _signInFormWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sign In',
          style: TextStyle(fontSize: 16),
        ),
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
        ButtonWidget(
          btnText: 'Sign In',
          onTap: () {
            Navigator.of(context).popAndPushNamed("/");
          },
        ),
        SizedBox(
          height: 12,
        ),
        ButtonWidget(
          iconWidget: SvgPicture.asset(
            'images/brand/brand-01.svg',
            width: 20,
            height: 20,
          ),
          btnText: 'Sign in with Google',
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
    );
  }

  @override
  // TODO: implement showTitle
  bool get showTitle => false;

  @override
  // TODO: implement isPage
  bool get isPage => true;
}
