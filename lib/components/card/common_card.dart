import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;

  CommonCard(
      {super.key,
      this.child,
      this.padding,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: padding,
        alignment: Alignment.center,
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
