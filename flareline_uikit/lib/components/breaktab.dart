library flareline_uikit;
import 'package:flutter/material.dart';


class BreakTab extends StatelessWidget {
  final String title;

  BreakTab(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        title,
        style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
      ),
      const Spacer(),
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
      ),
    ]);
  }
}
