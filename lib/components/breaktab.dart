import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BreakTab extends StatelessWidget {
  final String title;

  BreakTab(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Text(
          title,
          style: TextStyle(fontSize: 14.sp),
        ),
        Spacer(),
        InkWell(
          child: Text(
            'Dashboard',
            style: TextStyle(fontSize: 10.sp),
          ),
          onTap: () {
            Navigator.of(context).popAndPushNamed('/');
          },
        ),
        SizedBox(
          width: 6.w,
        ),
        Text('/'),
        SizedBox(
          width: 6.w,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 10.sp, color: Colors.blue),
        ),
      ]),
    );
  }
}
