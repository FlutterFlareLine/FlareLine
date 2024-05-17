library flareline_uikit;
import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/core/theme/flareline_colors.dart';
import 'package:flutter/material.dart';

class ModalDialog {
  static show(
      {required BuildContext context,
      String? title,
      Widget? child,
      Widget? footer,
      GestureTapCallback? onCancelTap,
      GestureTapCallback? onSaveTap}) {
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
                      width: MediaQuery.of(context).size.width * 0.6,
                      color: Colors.white,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (title != null)
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                title,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          SingleChildScrollView(
                            child: child,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          if (footer != null)
                            footer
                          else
                            Row(
                              children: [
                                const Spacer(),
                                SizedBox(
                                  width: 120,
                                  child: ButtonWidget(
                                    btnText: 'Cancel',
                                    textColor: FlarelineColors.darkBlackText,
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
