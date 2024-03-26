import 'package:flutter/material.dart';

import 'package:free_flutter_admin_dashboard/components/card/white_card.dart';
import 'package:provider/provider.dart';

class ChatsWidget extends StatelessWidget {
  const ChatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chats',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              Expanded(
                  child: ChangeNotifierProvider(
                create: (context) => _DataProvider(),
                builder: (ctx, child) => _buildWidget(ctx),
              )),
            ],
          ),
        ));
  }

  _buildWidget(BuildContext context) {
    return FutureBuilder<List<Conversation>>(
        future: context.read<_DataProvider>().loadData(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.data == null) {
            return Text('loading');
          }

          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (c, index) {
              return itemBuilder(c, index, snapshot.data!.elementAt(index));
            },
            itemCount: snapshot.data!.length,
          );
        }));
  }

  Widget itemBuilder(
      BuildContext context, int index, Conversation conversation) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 44,
            height: 44,
            child: Stack(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets${conversation.avatar}'),
                  radius: 22,
                ),
                Align(
                  child: ClipOval(
                    child: Container(
                      color: Colors.red,
                      width: 10,
                      height: 10,
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                )
              ],
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(conversation.name),
              SizedBox(
                height: 5,
              ),
              Text(
                conversation.text,
                style: TextStyle(fontSize: 8),
              ),
            ],
          )),
          Container(
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(25)),
            constraints: BoxConstraints(minWidth: 30),
            child: Text(
              '${conversation.dot > 999 ? '+99' : conversation.dot}',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class Conversation {
  Conversation(
      {required String name,
      required String avatar,
      required String text,
      required int time,
      required int textCount,
      required int dot}) {
    this.name = name;
    this.avatar = avatar;
    this.text = text;
    this.time = time;
    this.textCount = textCount;
    this.dot = dot;
  }

  late String avatar;

  late String name;

  late String text;

  late int time;

  late int textCount;

  late int dot;
}

class _DataProvider extends ChangeNotifier {
  List<Conversation> employees = <Conversation>[];

  List<Conversation> chatData = [
    Conversation(
      avatar: "/user/user-01.png",
      name: "Devid Heilo",
      text: "How are you?",
      time: 12,
      textCount: 3,
      dot: 3,
    ),
    Conversation(
      avatar: "/user/user-02.png",
      name: "Henry Fisher",
      text: "Waiting for you!",
      time: 12,
      textCount: 0,
      dot: 1,
    ),
    Conversation(
      avatar: "/user/user-04.png",
      name: "Jhon Doe",
      text: "What's up?",
      time: 32,
      textCount: 0,
      dot: 3,
    ),
    Conversation(
      avatar: "/user/user-05.png",
      name: "Jane Doe",
      text: "Great",
      time: 32,
      textCount: 2,
      dot: 66,
    ),
    Conversation(
      avatar: "/user/user-01.png",
      name: "Jhon Doe",
      text: "How are you?",
      time: 32,
      textCount: 0,
      dot: 3,
    ),
    Conversation(
      avatar: "/user/user-03.png",
      name: "Jhon Doe",
      text: "How are you?",
      time: 32,
      textCount: 3,
      dot: 6549,
    ),
  ];

  Future<List<Conversation>> loadData() async {
    await Future.delayed(Duration(seconds: 2));

    employees = chatData;

    return employees;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
