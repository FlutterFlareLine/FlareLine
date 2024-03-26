import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:free_flutter_admin_dashboard/components/buttons/button_widget.dart';
import 'package:free_flutter_admin_dashboard/components/card/title_card.dart';
import 'package:free_flutter_admin_dashboard/pages/layout.dart';
import 'package:free_flutter_admin_dashboard/themes/global_colors.dart';

class ButtonPage extends LayoutWidget {
  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Column(
      children: [
        TitleCard(
            title: 'Normal Button', childWidget: _normalButtonsWidget(context)),
        SizedBox(
          height: 20,
        ),
        TitleCard(
            title: 'Button With Icon',
            childWidget: _iconButtonsWidget(context)),
      ],
    );
  }

  @override
  String title() {
    return 'Buttons';
  }

  Widget _normalButtonsWidget(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Wrap(
          children: [
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Button',
                color: primaryButtonColor,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Button',
                color: primaryButtonColor,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Button',
                color: primaryButtonColor,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Button',
                color: Colors.white,
                borderRadius: 5,
                borderColor: primaryButtonColor,
                textColor: primaryButtonColor,
              ),
            )
          ],
        ),
        SizedBox(height: 16,),
        Wrap(
          children: [
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Button',
                color: secondButtonColor,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Button',
                color: secondButtonColor,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Button',
                color: secondButtonColor,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Button',
                color: Colors.white,
                borderRadius: 5,
                borderColor: secondButtonColor,
                textColor: secondButtonColor,
              ),
            )
          ],
        ),
        SizedBox(height: 16,),
        Wrap(
          children: [
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Button',
                color: thirdButtonColor,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Button',
                color: thirdButtonColor,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Button',
                color: thirdButtonColor,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Button',
                color: Colors.white,
                borderRadius: 5,
                borderColor: thirdButtonColor,
                textColor: thirdButtonColor,
              ),
            )
          ],
        ),
        SizedBox(height: 20,),
      ],
    );
  }

  Widget _iconButtonsWidget(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Wrap(
          children: [
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(Icons.email_outlined, color: Colors.white,),
                btnText: 'Button With Icon',
                color: primaryButtonColor,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(Icons.email_outlined, color: Colors.white,),
                btnText: 'Button With Icon',
                color: primaryButtonColor,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(Icons.email_outlined, color: Colors.white,),
                btnText: 'Button With Icon',
                color: primaryButtonColor,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(Icons.email_outlined, color: primaryButtonColor,),
                btnText: 'Button With Icon',
                color: Colors.white,
                borderRadius: 5,
                borderColor: primaryButtonColor,
                textColor: primaryButtonColor,
              ),
            )
          ],
        ),
        SizedBox(height: 16,),
        Wrap(
          children: [
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(Icons.shopping_cart_checkout, color: Colors.white,),
                btnText: 'Button With Icon',
                color: secondButtonColor,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(Icons.shopping_cart_checkout, color: Colors.white,),
                btnText: 'Button With Icon',
                color: secondButtonColor,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(Icons.shopping_cart_checkout, color: Colors.white,),
                btnText: 'Button With Icon',
                color: secondButtonColor,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(Icons.shopping_cart_checkout, color: secondButtonColor,),
                btnText: 'Button With Icon',
                color: Colors.white,
                borderRadius: 5,
                borderColor: secondButtonColor,
                textColor: secondButtonColor,
              ),
            )
          ],
        ),
        SizedBox(height: 16,),
        Wrap(
          children: [
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(Icons.favorite_border, color: Colors.white,),
                btnText: 'Button With Icon',
                color: thirdButtonColor,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(Icons.favorite_border, color: Colors.white,),
                btnText: 'Button With Icon',
                color: thirdButtonColor,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(Icons.favorite_border, color: Colors.white,),
                btnText: 'Button With Icon',
                color: thirdButtonColor,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(Icons.favorite_border, color: thirdButtonColor,),
                btnText: 'Button With Icon',
                color: Colors.white,
                borderRadius: 5,
                borderColor: thirdButtonColor,
                textColor: thirdButtonColor,
              ),
            )
          ],
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}
