import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final String? title;

  const CommonCard(
      {super.key,
      this.child,
      this.padding,
      this.width,
      this.height,
      this.title});

  @override
  Widget build(BuildContext context) {
    Widget childWidget = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          padding: padding,
          alignment: Alignment.center,
          width: width,
          height: height,
          child: child,
        ));
    return Card(
      child: title != null
          ? _titleWidget(
              title ?? '',
              childWidget,
            )
          : childWidget,
    );
  }

  _titleWidget(String title, Widget childWidget) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 50,
        padding: const EdgeInsets.only(left: 10),
        alignment: Alignment.centerLeft,
        child: Text(title),
      ),
      const Divider(
        height: 1,
      ),
      Padding(padding: const EdgeInsets.all(16), child: childWidget)
    ]);
  }
}
