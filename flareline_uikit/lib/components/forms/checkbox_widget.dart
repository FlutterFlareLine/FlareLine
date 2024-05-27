library flareline_uikit;

import 'package:flareline_uikit/core/theme/flareline_colors.dart';
import 'package:flutter/material.dart';

typedef ValueChanged<T, String> = void Function(T checked, String value);

class CheckBoxWidget extends StatelessWidget {
  final String? value;
  final String? text;
  final Color? checkedColor;
  final double? size;
  final bool? checked;
  final ValueChanged<bool?, String?>? onChanged;

  CheckBoxWidget(
      {super.key,
      this.text,
      this.checkedColor,
      this.size,
      this.checked,
      this.value,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    checkedColor ?? FlarelineColors.primary;
    return Row(mainAxisSize: MainAxisSize.min, children: [
      InkWell(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              color: (checked ?? false)
                  ? checkedColor
                  : FlarelineColors.background,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                  color: (checked ?? false)
                      ? checkedColor!
                      : FlarelineColors.darkBorder)),
          child: (checked ?? false)
              ? Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : SizedBox.shrink(),
        ),
        onTap: () {
          if (onChanged != null) {
            onChanged!(!(this.checked??false), value);
          }
        },
      ),
      const SizedBox(
        width: 10,
      ),
      Text(text ?? '')
    ]);
  }
}
