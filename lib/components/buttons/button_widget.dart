import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      child: Container(
        width: double.maxFinite,
        height: 40.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: borderColor != null
                ? Border.all(color: borderColor!, width: borderWidth ?? 0)
                : null,
            color: color ??
                ((isPrimary ?? true)
                    ? Theme.of(context).primaryColor
                    : Colors.black12),
            borderRadius: BorderRadius.circular(borderRadius ?? 4)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(iconWidget!=null)
              iconWidget!,
            if(iconWidget!=null)
              SizedBox(width: 5.w,),
            Text(
              btnText,
              style:
                  TextStyle(color: textColor ?? Colors.white, fontSize: 12.sp),
            )
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
