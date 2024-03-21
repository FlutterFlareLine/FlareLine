import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutBorderTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final int? maxLines;
  final TextEditingController? controller;
  final bool? enabled;

  OutBorderTextFormField({this.labelText, this.initialValue, this.hintText, this.maxLines = 1, this.enabled, this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText ?? ''),
        if (labelText != null)
          SizedBox(
            height: 10.h,
          ),
        TextFormField(
          enabled: enabled,
          initialValue: initialValue,
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
              labelText: '',
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: hintText),
        )
      ],
    );
  }
}
