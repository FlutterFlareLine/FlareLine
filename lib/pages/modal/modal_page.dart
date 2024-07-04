import 'package:flareline/core/theme/global_colors.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/card/title_card.dart';
import 'package:flareline_uikit/components/modal/modal_dialog.dart';
import 'package:flareline_uikit/utils/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ModalPage extends LayoutWidget {
  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'Modal';
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Column(
      children: [
        TitleCard(title: 'Modal Toast', childWidget: _dialogWidgets(context)),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  _dialogWidgets(BuildContext context) {
    return Column(
      children: [
        ButtonWidget(
          btnText: 'Simple Modal',
          color: Colors.white,
          borderRadius: 5,
          borderColor: GlobalColors.normal,
          textColor: GlobalColors.normal,
          onTap: () {
            ModalDialog.show(
                context: context,
                title: 'Simple Modal',
                showFooter: false,
                modalType: ModalType.small,
                showTitleDivider: true,
                child: const Text(
                    'FlareLine is a free and open-source admin dashboard template built on Flutter providing developers with everything they need to create a feature-rich and data-driven: back-end, dashboard, or admin panel solution for any sort of web/mac/windows/android/iOS project.'));
          },
        ),
        const SizedBox(
          height: 20,
        ),
        ButtonWidget(
          btnText: 'Modal with footer',
          color: Colors.white,
          borderRadius: 5,
          borderColor: GlobalColors.normal,
          textColor: GlobalColors.normal,
          onTap: () {
            ModalDialog.show(
                context: context,
                title: 'Modal with footer',
                showFooter: true,
                modalType: ModalType.small,
                showTitleDivider: true,
                onCancelTap: () {
                  SnackBarUtil.showSnack(context, 'Canceled');
                },
                onSaveTap: () {
                  SnackBarUtil.showSuccess(context, 'Success');
                },
                child: const Text(
                    'FlareLine is a free and open-source admin dashboard template built on Flutter providing developers with everything they need to create a feature-rich and data-driven: back-end, dashboard, or admin panel solution for any sort of web/mac/windows/android/iOS project.'));
          },
        ),
        const SizedBox(
          height: 20,
        ),
        ButtonWidget(
          btnText: 'Medium Modal',
          color: Colors.white,
          borderRadius: 5,
          borderColor: GlobalColors.normal,
          textColor: GlobalColors.normal,
          onTap: () {
            ModalDialog.show(
                context: context,
                title: 'Medium Modal',
                showFooter: false,
                modalType: ModalType.medium,
                showTitleDivider: true,
                child: const Text(
                    'FlareLine is a free and open-source admin dashboard template built on Flutter providing developers with everything they need to create a feature-rich and data-driven: back-end, dashboard, or admin panel solution for any sort of web/mac/windows/android/iOS project.'));
          },
        ),
        const SizedBox(
          height: 20,
        ),
        ButtonWidget(
          btnText: 'Large Modal',
          color: Colors.white,
          borderRadius: 5,
          borderColor: GlobalColors.normal,
          textColor: GlobalColors.normal,
          onTap: () {
            ModalDialog.show(
                context: context,
                title: 'Large Modal',
                showFooter: false,
                modalType: ModalType.large,
                showTitleDivider: true,
                child: const Text(
                    'FlareLine is a free and open-source admin dashboard template built on Flutter providing developers with everything they need to create a feature-rich and data-driven: back-end, dashboard, or admin panel solution for any sort of web/mac/windows/android/iOS project.'));
          },
        ),
        const SizedBox(
          height: 20,
        ),
        ButtonWidget(
          btnText: 'Large Modal Widget',
          color: Colors.white,
          borderRadius: 5,
          borderColor: GlobalColors.normal,
          textColor: GlobalColors.normal,
          onTap: () {
            ModalDialog.show(
                context: context,
                title: 'Large Modal',
                showFooter: false,
                modalType: ModalType.large,
                showTitleDivider: true,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,

                ));
          },
        ),
      ],
    );
  }
}
