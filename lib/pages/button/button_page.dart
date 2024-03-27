import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:free_flutter_admin_dashboard/components/buttons/button_widget.dart';
import 'package:free_flutter_admin_dashboard/components/card/title_card.dart';
import 'package:free_flutter_admin_dashboard/pages/layout.dart';
import 'package:free_flutter_admin_dashboard/themes/global_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonPage extends LayoutWidget {
  const ButtonPage({super.key});

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Column(
      children: [
        TitleCard(
            title: AppLocalizations.of(context)!.normalButton, childWidget: _normalButtonsWidget(context)),
        const SizedBox(
          height: 20,
        ),
        TitleCard(
            title: AppLocalizations.of(context)!.buttonWithIcon,
            childWidget: _iconButtonsWidget(context)),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }

  @override
  String breakTabTitle(BuildContext context) {
    return AppLocalizations.of(context)!.buttonsPageTitle;
  }

  Widget _normalButtonsWidget(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Wrap(
          spacing: 20,
          runSpacing: 16,
          children: [
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: primaryButtonColor,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: primaryButtonColor,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: primaryButtonColor,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: Colors.white,
                borderRadius: 5,
                borderColor: primaryButtonColor,
                textColor: primaryButtonColor,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Wrap(
          spacing: 20,
          runSpacing: 16,
          children: [
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: secondButtonColor,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: secondButtonColor,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: secondButtonColor,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: Colors.white,
                borderRadius: 5,
                borderColor: secondButtonColor,
                textColor: secondButtonColor,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Wrap(
          spacing: 20,
          runSpacing: 16,
          children: [
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: thirdButtonColor,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: thirdButtonColor,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: thirdButtonColor,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: Colors.white,
                borderRadius: 5,
                borderColor: thirdButtonColor,
                textColor: thirdButtonColor,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _iconButtonsWidget(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Wrap(
          spacing: 20,
          runSpacing: 16,
          children: [
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                color: primaryButtonColor,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                color: primaryButtonColor,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                color: primaryButtonColor,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(
                  Icons.email_outlined,
                  color: primaryButtonColor,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                color: Colors.white,
                borderRadius: 5,
                borderColor: primaryButtonColor,
                textColor: primaryButtonColor,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Wrap(
          spacing: 20,
          runSpacing: 16,
          children: [
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(
                  Icons.shopping_cart_checkout,
                  color: Colors.white,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                color: secondButtonColor,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(
                  Icons.shopping_cart_checkout,
                  color: Colors.white,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                color: secondButtonColor,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(
                  Icons.shopping_cart_checkout,
                  color: Colors.white,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                color: secondButtonColor,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(
                  Icons.shopping_cart_checkout,
                  color: secondButtonColor,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                color: Colors.white,
                borderRadius: 5,
                borderColor: secondButtonColor,
                textColor: secondButtonColor,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Wrap(
          spacing: 20,
          runSpacing: 16,
          children: [
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                color: thirdButtonColor,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                color: thirdButtonColor,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                color: thirdButtonColor,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(
                  Icons.favorite_border,
                  color: thirdButtonColor,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                color: Colors.white,
                borderRadius: 5,
                borderColor: thirdButtonColor,
                textColor: thirdButtonColor,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
