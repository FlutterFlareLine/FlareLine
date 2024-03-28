import 'package:flutter/material.dart';

import 'package:flareline/components/card/white_card.dart';

class TitleCard extends StatelessWidget {
  final String title;
  final Widget childWidget;

  const TitleCard({super.key, required this.title, required this.childWidget});

  @override
  Widget build(BuildContext context) {
    return WhiteCard(child: _titleWidget(title, childWidget));
  }

  _titleWidget(String title, Widget childWidget) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 50,
        padding: EdgeInsets.only(left: 10),
        alignment: Alignment.centerLeft,
        child: Text(title),
      ),
      Divider(
        height: 1,
      ),
      Padding(padding: EdgeInsets.all(16), child: childWidget)
    ]);
  }
}
