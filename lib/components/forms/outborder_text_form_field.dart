
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutBorderTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final int? maxLines;
  final TextEditingController? controller;
  final bool? enabled;
  final Widget? suffixWidget;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Widget? icon;

  OutBorderTextFormField(
      {this.labelText,
      this.initialValue,
      this.hintText,
      this.maxLines = 1,
      this.enabled,
      this.controller,
      this.suffixWidget,
      this.obscureText,
      this.keyboardType,
        this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText ?? ''),
        if (labelText != null)
          SizedBox(
            height: 8.h,
          ),
        Container(
          width: double.maxFinite,
          height:maxLines==1? 50:null,
          child: Stack(
            children: [
              Align(
                child: TextFormField(
                  keyboardType: keyboardType,
                  obscureText:obscureText??false,
                  enabled: enabled,
                  initialValue: initialValue,
                  controller: controller,
                  maxLines: maxLines,
                  decoration: InputDecoration(
                      prefixIcon: icon,
                      prefixIconConstraints: BoxConstraints(maxWidth: 35,maxHeight: 22,),
                      labelText: '',
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 2,
                        vertical: 6,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: hintText),
                ),
                alignment: Alignment.center,
              ),
              if (suffixWidget != null)
                Align(
                  child: Container(
                    child: suffixWidget,
                    margin: EdgeInsets.only(right: 10.w),
                  ),
                  alignment: Alignment.centerRight,
                )
            ],
          ),
        )
      ],
    );
  }
}
