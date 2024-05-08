import 'package:flareline/components/buttons/button_widget.dart';
import 'package:flareline/core/theme/global_colors.dart';
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
                padding: EdgeInsets.all(20),
                child: Material(
                    type: MaterialType.transparency,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      color: Colors.white,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (title != null)
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(bottom: 16),
                              child: Text(
                                title,
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                              ),
                            ),
                          SingleChildScrollView(
                            child: child,
                          ),
                          SizedBox(height: 16,),
                          if (footer != null)
                            footer
                          else
                            Row(
                              children: [
                                Spacer(),
                                SizedBox(
                                  width: 120,
                                  child: ButtonWidget(
                                    btnText: 'Cancel',
                                    color: GlobalColors.gray,
                                    textColor: GlobalColors.darkBlackText,
                                    onTap: () {
                                      Navigator.of(context).pop();
                                      if (onCancelTap != null) {
                                        onCancelTap();
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(width: 20,),
                                SizedBox(
                                  width: 120,
                                  child: ButtonWidget(
                                    btnText: 'Save',
                                    onTap: onSaveTap,
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
