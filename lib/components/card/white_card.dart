import 'package:flutter/material.dart';

class WhiteCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final bool? isAutoHeight;
  final double? width;
  final double? height;

  WhiteCard(
      {super.key,
      this.child,
      this.padding,
      this.isAutoHeight,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   padding: padding,
    //   width: width,
    //   height: height,
    //   alignment: Alignment.center,
    //   decoration: BoxDecoration(
    //       color: Colors.white, borderRadius: BorderRadius.circular(6),
    //       boxShadow: const [
    //         BoxShadow(
    //             color: Colors.black12,
    //             offset: Offset(0.0, 5.0),
    //             blurRadius: 8.0,
    //             spreadRadius: 1
    //         )
    //       ]
    //   ),
    //   child: child,
    // );
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
