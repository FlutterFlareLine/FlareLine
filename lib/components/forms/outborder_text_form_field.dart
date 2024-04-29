import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter/material.dart';

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
  final FormFieldValidator? validator;

  const OutBorderTextFormField(
      {super.key,
      this.labelText,
      this.initialValue,
      this.hintText,
      this.maxLines = 1,
      this.enabled,
      this.controller,
      this.suffixWidget,
      this.obscureText,
      this.keyboardType,
      this.icon,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) Text(labelText ?? ''),
        if (labelText != null)
          const SizedBox(
            height: 8,
          ),
        SizedBox(
          width: double.maxFinite,
          height: maxLines == 1 ? 50 : null,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: TextFormField(
                  keyboardType: keyboardType,
                  obscureText: obscureText ?? false,
                  enabled: enabled,
                  initialValue: initialValue,
                  controller: controller,
                  maxLines: maxLines,
                  validator: validator,
                  decoration: InputDecoration(
                    prefixIcon: icon,
                    prefixIconConstraints: BoxConstraints(
                      maxWidth: 35,
                      maxHeight: 35,
                    ),
                    labelText: '',
                    border: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: GlobalColors.border, width: 1)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: GlobalColors.border, width: 1)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: GlobalColors.primary, width: 1)),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: hintText,
                  ),
                ),
              ),
              if (suffixWidget != null)
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: suffixWidget,
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
