import 'package:flutter/material.dart';


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
          color: Colors.white, borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0.0, 5.0), //阴影xy轴偏移量
                blurRadius: 8.0, //阴影模糊程度
                spreadRadius: 1 //阴影扩散程度
            )
          ]
      ),
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
