library flareline_uikit;
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flutter/material.dart';


class TitleCard extends StatelessWidget {
  final String title;
  final Widget childWidget;

  const TitleCard({super.key, required this.title, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return CommonCard(child: _titleWidget(title, childWidget));
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
