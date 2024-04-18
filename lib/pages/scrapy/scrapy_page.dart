import 'package:flareline/pages/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScrapyPage extends LayoutWidget {
  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Text('Use OpenAI GPTBOT, Developing...');
  }

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'Scrapy';
  }
}
