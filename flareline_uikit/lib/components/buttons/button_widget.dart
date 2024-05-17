library flareline_uikit;

import 'package:flareline_uikit/core/theme/flareline_colors.dart';
import 'package:flutter/material.dart';

enum ButtonType {
  normal('normal'),
  primary('primary'),
  success('success'),
  info('info'),
  warn('warn'),
  danger('danger'),
  dark('dark');

  const ButtonType(this.type);

  final String type;
}

class ButtonWidget extends StatelessWidget {
  final String btnText;
  final GestureTapCallback? onTap;
  final Color? color;
  final double? borderRadius;
  final double? borderWidth;
  final Color? borderColor;
  final Color? textColor;
  final Widget? iconWidget;
  final String? type;
  final double? height;

  const ButtonWidget(
      {required this.btnText,
      this.onTap,
      this.color,
      this.borderRadius,
      this.borderColor,
      this.textColor,
      this.iconWidget,
      this.type,
      this.borderWidth,
      this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: height ?? 40,
        alignment: Alignment.center,
        decoration: buildBoxDecoration(context),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconWidget != null) iconWidget!,
            if (iconWidget != null && btnText != '')
              const SizedBox(
                width: 5,
              ),
            if (btnText != '')
              Text(
                btnText,
                style: TextStyle(
                    color: textColor ??
                        (type != null ? Colors.white : ButtonColors.normal),
                    fontSize: 14),
              )
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
        border: (borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth ?? 0)
            : (type == null
                ? Border.all(color: ButtonColors.normal, width: 1)
                : null)),
        color: color ?? getTypeColor(type),
        borderRadius: BorderRadius.circular(borderRadius ?? 4));
  }

  Color getTypeColor(String? type) {
    if (type == ButtonType.primary.type) {
      return ButtonColors.primary;
    }
    if (type == ButtonType.success.type) {
      return ButtonColors.success;
    }
    if (type == ButtonType.info.type) {
      return ButtonColors.info;
    }
    if (type == ButtonType.warn.type) {
      return ButtonColors.warn;
    }
    if (type == ButtonType.danger.type) {
      return ButtonColors.danger;
    }
    if (type == ButtonType.dark.type) {
      return ButtonColors.dark;
    }
    return Colors.white;
  }
}
