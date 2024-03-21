import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhiteCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final bool? isAutoHeight;

  WhiteCard({this.child, this.padding, this.isAutoHeight});

  @override
  Widget build(BuildContext context) {
    Widget card = Container(
      padding: padding,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: child,
    );
    return (isAutoHeight ?? false)
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [card],
          )
        : card;
  }
}
