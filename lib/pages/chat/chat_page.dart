import 'package:flareline/components/card/common_card.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatPage extends LayoutWidget{
  const ChatPage({super.key});

  @override
  // TODO: implement isContentScroll
  bool get isContentScroll => false;

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 180,child: _conversationWidget(context),),
        SizedBox(width: 10,),
        Expanded(child: _chatMsgWidget(context))
      ],
    );
  }

  Widget _conversationWidget(BuildContext context) {
    return CommonCard(
      child: Text('conversation'),
    );
  }

  Widget  _chatMsgWidget(BuildContext context) {
    return CommonCard(child: Text('chat'),);
  }

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'Chat';
  }
}