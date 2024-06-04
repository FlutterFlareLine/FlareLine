import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/card/title_card.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flareline/flutter_gen/app_localizations.dart';

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
                btnText: 'Default',
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Default',
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Default',
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Default',
                color: Colors.white,
                borderRadius: 5,
                borderColor: GlobalColors.normal,
                textColor: GlobalColors.normal,
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
                btnText: 'Primary',
                borderRadius: 0,
                type: ButtonType.primary.type,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Primary',
                borderRadius: 5,
                type: ButtonType.primary.type,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Primary',
                borderRadius: 30,
                type: ButtonType.primary.type,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Primary',
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
                btnText: 'Success',
                type: ButtonType.success.type,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Success',
                type: ButtonType.success.type,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Success',
                type: ButtonType.success.type,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Success',
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
                btnText: 'Info',
                type: ButtonType.info.type,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Info',
                type: ButtonType.info.type,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Info',
                type: ButtonType.info.type,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Info',
                color: Colors.white,
                borderRadius: 5,
                borderColor: GlobalColors.info,
                textColor: GlobalColors.info,
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
                btnText: 'Warn',
                type: ButtonType.warn.type,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Warn',
                type: ButtonType.warn.type,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Warn',
                type: ButtonType.warn.type,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Warn',
                color: Colors.white,
                borderRadius: 5,
                borderColor: GlobalColors.warn,
                textColor: GlobalColors.warn,
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
                btnText: 'Danger',
                type: ButtonType.danger.type,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Danger',
                type: ButtonType.danger.type,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Danger',
                type: ButtonType.danger.type,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Danger',
                color: Colors.white,
                borderRadius: 5,
                borderColor: GlobalColors.danger,
                textColor: GlobalColors.danger,
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
                btnText: 'Dark',
                type: ButtonType.dark.type,
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Dark',
                type: ButtonType.dark.type,
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Dark',
                type: ButtonType.dark.type,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 100,
              child: ButtonWidget(
                btnText: 'Dark',
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
                  color: GlobalColors.normal,
                ),
                btnText: 'Default With Icon',
                borderRadius: 0,
              ),
            ),
            SizedBox(
              width: 180,
              child: ButtonWidget(
                iconWidget: const Icon(
                  Icons.email_outlined,
                  color: GlobalColors.normal,
                ),
                btnText: 'Default With Icon',
                borderRadius: 5,
              ),
            ),
            SizedBox(
              width: 180,
              child: ButtonWidget(
                iconWidget: const Icon(
                  Icons.email_outlined,
                  color: GlobalColors.normal,
                ),
                btnText: 'Default With Icon',
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 180,
              child: ButtonWidget(
                iconWidget: const Icon(
                  Icons.email_outlined,
                  color: GlobalColors.normal,
                ),
                btnText: 'Default With Icon',
                color: Colors.white,
                borderRadius: 5,
                borderColor: GlobalColors.normal,
                textColor: GlobalColors.normal,
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
                  Icons.email_outlined,
                  color: Colors.white,
                ),
                btnText: 'Primary With Icon',
                type: ButtonType.primary.type,
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
                btnText: 'Primary With Icon',
                type: ButtonType.primary.type,
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
                btnText: 'Primary With Icon',
                type: ButtonType.primary.type,
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
                btnText: 'Primary With Icon',
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
                btnText: 'Success With Icon',
                type: ButtonType.success.type,
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
                btnText: 'Success With Icon',
                type: ButtonType.success.type,
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
                btnText: 'Success With Icon',
                type: ButtonType.success.type,
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
                btnText: 'Success With Icon',
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
                iconWidget: const Icon(
                  Icons.shopping_cart_checkout,
                  color: Colors.white,
                ),
                btnText: 'Info With Icon',
                type: ButtonType.info.type,
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
                btnText: 'Info With Icon',
                type: ButtonType.info.type,
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
                btnText: 'Info With Icon',
                type: ButtonType.info.type,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 180,
              child: ButtonWidget(
                iconWidget: const Icon(
                  Icons.shopping_cart_checkout,
                  color: GlobalColors.info,
                ),
                btnText: 'Info With Icon',
                color: Colors.white,
                borderRadius: 5,
                borderColor: GlobalColors.info,
                textColor: GlobalColors.info,
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
                btnText: 'Warn With Icon',
                type: ButtonType.warn.type,
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
                btnText: 'Warn With Icon',
                type: ButtonType.warn.type,
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
                btnText: 'Warn With Icon',
                type: ButtonType.warn.type,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 180,
              child: ButtonWidget(
                iconWidget: const Icon(
                  Icons.shopping_cart_checkout,
                  color: GlobalColors.warn,
                ),
                btnText: 'Warn With Icon',
                color: Colors.white,
                borderRadius: 5,
                borderColor: GlobalColors.warn,
                textColor: GlobalColors.warn,
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
                btnText: 'Danger With Icon',
                type: ButtonType.danger.type,
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
                btnText: 'Danger With Icon',
                type: ButtonType.danger.type,
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
                btnText: 'Danger With Icon',
                type: ButtonType.danger.type,
                borderRadius: 30,
              ),
            ),
            SizedBox(
              width: 180,
              child: ButtonWidget(
                iconWidget: const Icon(
                  Icons.shopping_cart_checkout,
                  color: GlobalColors.danger,
                ),
                btnText: 'Danger With Icon',
                color: Colors.white,
                borderRadius: 5,
                borderColor: GlobalColors.danger,
                textColor: GlobalColors.danger,
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
                btnText: 'Dark With Icon',
                type: ButtonType.dark.type,
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
                btnText: 'Dark With Icon',
                type: ButtonType.dark.type,
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
                btnText: 'Dark With Icon',
                type: ButtonType.dark.type,
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
                btnText: 'Dark With Icon',
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
