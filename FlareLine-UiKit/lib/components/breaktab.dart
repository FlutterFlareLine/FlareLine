library flareline_uikit;

import 'package:flutter/material.dart';


class BreakTab extends StatelessWidget {
  final String title;
  final Widget? rightWidget;

  BreakTab(this.title, {super.key, this.rightWidget});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )),
      rightWidget ?? (Row(
        children: [
          InkWell(
            child: const Text(
              'Dashboard',
              style: TextStyle(fontSize: 14),
            ),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/');
            },
          ),
          const SizedBox(
            width: 6,
          ),
          const Text('/'),
          const SizedBox(
            width: 6,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 14, color: Colors.blue),
          )
        ],
      )),
    ]);
  }
}
