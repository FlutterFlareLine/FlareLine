import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter/material.dart';

enum TagType {
  Primary,
  Secondary,
  Success,
  Error,
  Warn;

  static TagType getTagType(String? tagType) {
    if (tagType == null) {
      return TagType.Success;
    }
    TagType? rez =
        TagType.values.where((element) => element.name == tagType).firstOrNull;
    return rez ?? TagType.Success;
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
      case TagType.Success:
        textColor = GlobalColors.success;
        break;
      case TagType.Error:
        textColor = GlobalColors.danger;
        break;
      case TagType.Warn:
        textColor = GlobalColors.warn;
        break;
      case TagType.Primary:
        textColor = GlobalColors.primary;
        break;
      case TagType.Secondary:
        textColor = GlobalColors.secondary;
        break;
      default:
        textColor = color ?? GlobalColors.danger;
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
