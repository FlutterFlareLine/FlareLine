import 'package:flutter/material.dart';


class BreakTab extends StatelessWidget {
  final String title;

  BreakTab(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Text(
          title,
          style: TextStyle(fontSize: 14),
        ),
        Spacer(),
        InkWell(
          child: Text(
            'Dashboard',
            style: TextStyle(fontSize: 10),
          ),
          onTap: () {
            Navigator.of(context).popAndPushNamed('/');
          },
        ),
        SizedBox(
          width: 6,
        ),
        Text('/'),
        SizedBox(
          width: 6,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 10, color: Colors.blue),
        ),
      ]),
    );
  }
}
