import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  late String btnText;
  GestureTapCallback? onTap;
  late bool isPrimary;
  PrimaryButton({required String btnText, bool? isPrimary, GestureTapCallback? onTap}){
    this.btnText = btnText;
    this.isPrimary = isPrimary??true;
    this.onTap = onTap;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.maxFinite,
        height: 40.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isPrimary?Theme.of(context).primaryColor:Colors.black12,
            borderRadius: BorderRadius.circular(4)),
        child: Text(
          btnText,
          style: TextStyle(color: Colors.white, fontSize: 12.sp),
        ),
      ),
      onTap: onTap,
    );
  }
}
