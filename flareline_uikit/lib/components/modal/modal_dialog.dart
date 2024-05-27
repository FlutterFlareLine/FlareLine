library flareline_uikit;

import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/core/theme/flareline_colors.dart';
import 'package:flutter/material.dart';

enum ModalType { small, medium, large }

class ModalDialog {
  static show(
      {required BuildContext context,
      String? title,
      bool? showTitle = false,
      bool? showTitleDivider = false,
      Widget? child,
      Widget? footer,
      bool? showFooter,
      ModalType modalType = ModalType.large,
      GestureTapCallback? onCancelTap,
      GestureTapCallback? onSaveTap}) {
    double? width;
    if (modalType == ModalType.large) {
      width = MediaQuery.of(context).size.width * 0.6;
    } else if (modalType == ModalType.medium) {
      width = MediaQuery.of(context).size.width * 0.4;
    } else if (modalType == ModalType.small) {
      width = MediaQuery.of(context).size.width * 0.28;
    }
    return showGeneralDialog(
        context: context,
        pageBuilder: (context, animation, secondaryAnimation) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Material(
                    type: MaterialType.transparency,
                    child: Container(
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (showTitle != null)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.center,
                              height: 50,
                              child: Stack(
                                children: [
                                  if (title != null)
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        child: Text(
                                          title,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      child: const Icon(Icons.close),
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          if (showTitleDivider ?? false)
                            const Divider(
                              thickness: 0,
                              height: 0.2,
                              color: FlarelineColors.darkBorder,
                            ),
                          SingleChildScrollView(
                            child: Padding(
                              child: child,
                              padding: const EdgeInsets.all(20),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          if (showFooter ?? true)
                            if (footer != null)
                              footer
                            else
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 20),
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    SizedBox(
                                      width: 120,
                                      child: ButtonWidget(
                                        btnText: 'Cancel',
                                        textColor:
                                            FlarelineColors.darkBlackText,
                                        onTap: () {
                                          Navigator.of(context).pop();
                                          if (onCancelTap != null) {
                                            onCancelTap();
                                          }
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 120,
                                      child: ButtonWidget(
                                        btnText: 'Save',
                                        onTap: onSaveTap,
                                        type: ButtonType.primary.type,
                                      ),
                                    )
                                  ],
                                ),
                              )
                        ],
                      ),
                    )),
              )
            ],
          );
        });
  }
}
