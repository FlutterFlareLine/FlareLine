import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flareline/components/buttons/button_widget.dart';
import 'package:flareline/components/card/title_card.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/core/theme/global_colors.dart';
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
                borderRadius: 0,
                type: ButtonType.PRIMARY.type,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                borderRadius: 5,
                type: ButtonType.PRIMARY.type,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                borderRadius: 30,
                type: ButtonType.PRIMARY.type,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: Colors.white,
                borderRadius: 5,
                borderColor: Theme.of(context).colorScheme.primary,
                textColor: Theme.of(context).colorScheme.primary,
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
                type: ButtonType.SUCCESS.type,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                type: ButtonType.SUCCESS.type,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                type: ButtonType.SUCCESS.type,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: Colors.white,
                borderRadius: 5,
                borderColor: GlobalColors.success,
                textColor: GlobalColors.success,
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
                type: ButtonType.DARK.type,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                type: ButtonType.DARK.type,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                type: ButtonType.DARK.type,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: AppLocalizations.of(context)!.btnName,
                color: Colors.white,
                borderRadius: 5,
                borderColor: GlobalColors.dark,
                textColor: GlobalColors.dark,
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
              width: 180,
              child: ButtonWidget(
                iconWidget: const Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                type: ButtonType.PRIMARY.type,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 180,
              child: ButtonWidget(
                iconWidget: const Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                type: ButtonType.PRIMARY.type,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 180,
              child: ButtonWidget(
                iconWidget: const Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                type: ButtonType.PRIMARY.type,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 180,
              child: ButtonWidget(
                iconWidget: const Icon(
                  Icons.email_outlined,
                  color: GlobalColors.primary,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                color: Colors.white,
                borderRadius: 5,
                borderColor: GlobalColors.primary,
                textColor: GlobalColors.primary,
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
              width: 180,
              child: ButtonWidget(
                iconWidget: const Icon(
                  Icons.shopping_cart_checkout,
                  color: Colors.white,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                type: ButtonType.SUCCESS.type,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 180,
              child: ButtonWidget(
                iconWidget: const Icon(
                  Icons.shopping_cart_checkout,
                  color: Colors.white,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                type: ButtonType.SUCCESS.type,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 180,
              child: ButtonWidget(
                iconWidget: const Icon(
                  Icons.shopping_cart_checkout,
                  color: Colors.white,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                type: ButtonType.SUCCESS.type,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 180,
              child: ButtonWidget(
                iconWidget: const Icon(
                  Icons.shopping_cart_checkout,
                  color: GlobalColors.success,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                color: Colors.white,
                borderRadius: 5,
                borderColor: GlobalColors.success,
                textColor: GlobalColors.success,
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
              width: 180,
              child: ButtonWidget(
                iconWidget: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                type: ButtonType.DARK.type,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 180,
              child: ButtonWidget(
                iconWidget: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                type: ButtonType.DARK.type,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 180,
              child: ButtonWidget(
                iconWidget: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                type: ButtonType.DARK.type,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 180,
              child: ButtonWidget(
                iconWidget: Icon(
                  Icons.favorite_border,
                  color: GlobalColors.dark,
                ),
                btnText: AppLocalizations.of(context)!.buttonWithIcon,
                color: Colors.white,
                borderRadius: 5,
                borderColor: GlobalColors.dark,
                textColor: GlobalColors.dark,
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
