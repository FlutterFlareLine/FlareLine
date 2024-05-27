import 'package:flareline/pages/layout.dart';
import 'package:flareline_uikit/components/card/title_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ToastPage extends LayoutWidget{
  const ToastPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'Toast';
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Column(
      children: [
        TitleCard(
            title: 'Message Toast', childWidget: _messageToast(context)),
        const SizedBox(
          height: 20,
        ),

      ],
    );
  }

  _messageToast(BuildContext context) {
    return Column(children: [

    ],);
  }

}