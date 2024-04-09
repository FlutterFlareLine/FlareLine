
import 'package:flutter/material.dart';
import 'package:flareline/themes/global_colors.dart';


class ButtonWidget extends StatelessWidget {
  String btnText;
  GestureTapCallback? onTap;
  bool? isPrimary;
  Color? color;
  double? borderRadius;
  double? borderWidth;
  Color? borderColor;
  Color? textColor;
  Widget? iconWidget;

  ButtonWidget(
      {required this.btnText,
      this.isPrimary,
      this.onTap,
      this.color,
      this.borderRadius,
      this.borderColor,
      this.textColor,
      this.iconWidget});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: borderColor != null
                ? Border.all(color: borderColor!, width: borderWidth ?? 0)
                : null,
            color: color ??
                ((isPrimary ?? true)
                    ? Theme.of(context).primaryColor
                    : stroke),
            borderRadius: BorderRadius.circular(borderRadius ?? 4)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(iconWidget!=null)
              iconWidget!,
            if(iconWidget!=null)
              SizedBox(width: 5,),
            Text(
              btnText,
              style:
                  TextStyle(color: textColor ?? ((isPrimary??true)?Colors.white:text), fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
