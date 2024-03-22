import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_flutter_admin_dashboard/components/card/white_card.dart';

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
        height: 50.h,
        padding: EdgeInsets.only(left: 10.w),
        alignment: Alignment.centerLeft,
        child: Text(title),
      ),
      Divider(
        height: 1,
      ),
      Padding(padding: EdgeInsets.all(16.w), child: childWidget)
    ]);
  }
}
