library flareline_uikit;
import 'package:flareline_uikit/core/theme/flareline_colors.dart';
import 'package:flutter/material.dart';

enum TagType {
  primary,
  secondary,
  success,
  error,
  warn;

  static TagType getTagType(String? tagType) {
    if (tagType == null) {
      return TagType.success;
    }
    TagType? rez =
        TagType.values.where((element) => element.name == tagType).firstOrNull;
    return rez ?? TagType.success;
  }
}

class TagWidget extends StatelessWidget {
  final String text;
  final Color? color;
  final TagType? tagType;
  final double? fontSize;

  const TagWidget(
      {super.key, required this.text, this.color, this.tagType, this.fontSize});

  Color? getTextColor() {
    Color? textColor;
    switch (tagType) {
      case TagType.success:
        textColor = ButtonColors.success;
        break;
      case TagType.error:
        textColor = ButtonColors.danger;
        break;
      case TagType.warn:
        textColor = ButtonColors.warn;
        break;
      case TagType.primary:
        textColor = ButtonColors.primary;
        break;
      case TagType.secondary:
        textColor = ButtonColors.secondary;
        break;
      default:
        textColor = color ?? ButtonColors.danger;
    }
    return textColor;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: getTextColor(), fontSize: fontSize ?? 11),
    );
  }
}
