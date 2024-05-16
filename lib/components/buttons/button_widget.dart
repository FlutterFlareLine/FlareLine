import 'package:flutter/material.dart';
import 'package:flareline/core/theme/global_colors.dart';

enum ButtonType {
  NORMAL('normal'),
  PRIMARY('primary'),
  SUCCESS('success'),
  INFO('info'),
  WARN('warn'),
  DANGER('danger'),
  DARK('dark'),
  ;

  const ButtonType(this.type);

  final String type;
}

class ButtonWidget extends StatelessWidget {
  String btnText;
  GestureTapCallback? onTap;
  // bool? isPrimary;
  Color? color;
  double? borderRadius;
  double? borderWidth;
  Color? borderColor;
  Color? textColor;
  Widget? iconWidget;
  String? type;

  ButtonWidget(
      {required this.btnText,
      // this.isPrimary,
      this.onTap,
      this.color,
      this.borderRadius,
      this.borderColor,
      this.textColor,
      this.iconWidget,
      this.type});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: 40,
        alignment: Alignment.center,
        decoration: buildBoxDecoration(context),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconWidget != null) iconWidget!,
            if (iconWidget != null)
              const SizedBox(
                width: 5,
              ),
            Text(
              btnText,
              style: TextStyle(
                  color: textColor ??
                      // ((isPrimary ?? true) ? Colors.white : GlobalColors.text),
                      (type!=null ? Colors.white : GlobalColors.text),
                  fontSize: 14),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
        border: borderColor != null
            ? Border.all(color: borderColor!, width: borderWidth ?? 0)
            : null,
        color: color ?? getTypeColor(type)
        // (type != null
        //     ? getTypeColor(type)
        //     : (((isPrimary ?? true)
        //         ? Theme.of(context).colorScheme.primary
        //         : GlobalColors.background)))
        ,
        borderRadius: BorderRadius.circular(borderRadius ?? 4));
  }

  Color getTypeColor(String? type) {
    if (type == ButtonType.PRIMARY.type) {
      return GlobalColors.primary;
    }
    if (type == ButtonType.SUCCESS.type) {
      return GlobalColors.success;
    }
    if (type == ButtonType.INFO.type) {
      return GlobalColors.info;
    }
    if (type == ButtonType.WARN.type) {
      return GlobalColors.warn;
    }
    if (type == ButtonType.DANGER.type) {
      return GlobalColors.danger;
    }
    if (type == ButtonType.DARK.type) {
      return GlobalColors.dark;
    }
    return GlobalColors.normal;
  }
}
