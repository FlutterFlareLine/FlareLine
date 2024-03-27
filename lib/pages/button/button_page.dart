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
                color: primary,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: primary,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: primary,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: Colors.white,
                borderRadius: 5,
                borderColor: primary,
                textColor: primary,
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
                color: green,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: green,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: green,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: Colors.white,
                borderRadius: 5,
                borderColor: green,
                textColor: green,
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
                color: dark,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: dark,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: dark,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: Colors.white,
                borderRadius: 5,
                borderColor: dark,
                textColor: dark,
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
                color: primary,
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
                color: primary,
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
                color: primary,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(
                  Icons.email_outlined,
                  color: primary,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                color: Colors.white,
                borderRadius: 5,
                borderColor: primary,
                textColor: primary,
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
                color: green,
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
                color: green,
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
                color: green,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(
                  Icons.shopping_cart_checkout,
                  color: green,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                color: Colors.white,
                borderRadius: 5,
                borderColor: green,
                textColor: green,
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
                color: dark,
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
                color: dark,
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
                color: dark,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 150,
              child: ButtonWidget(
                iconWidget: Icon(
                  Icons.favorite_border,
                  color: dark,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                color: Colors.white,
                borderRadius: 5,
                borderColor: dark,
                textColor: dark,
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
