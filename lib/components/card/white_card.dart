import 'package:flutter/material.dart';


class WhiteCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final bool? isAutoHeight;
  final double? width;
  final double? height;

  WhiteCard({this.child, this.padding, this.isAutoHeight,this.width, this.height});

  @override
  Widget build(BuildContext context) {
    Widget card = Container(
      padding: padding,
      width: width,
      height: height,
      alignment: Alignment.center,
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
    return card;
  }
}
