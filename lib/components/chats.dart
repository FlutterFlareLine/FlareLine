
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flareline/flutter_gen/app_localizations.dart';
import 'package:flareline_uikit/components/badge/anim_badge.dart';
import 'package:flutter/material.dart';

import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:provider/provider.dart';

class ChatsWidget extends StatelessWidget {
  const ChatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonCard(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Chats',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
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
            return Text(AppLocalizations.of(context)!.loading);
          }

          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
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
      padding: const EdgeInsets.symmetric(vertical: 8),
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
                  alignment: Alignment.bottomRight,
                  child: AnimBadge(
                    glowColor: conversation.badgeColor,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(conversation.name),
              const SizedBox(
                height: 5,
              ),
              Text(
                conversation.text,
                style: const TextStyle(fontSize: 8),
              ),
            ],
          )),
          Container(
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(25)),
            constraints: const BoxConstraints(minWidth: 30),
            child: Text(
              '${conversation.dot > 999 ? '+99' : conversation.dot}',
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class Conversation {
  Conversation(
      {required this.name,
      required this.avatar,
      required this.text,
      required this.time,
      required this.textCount,
      required this.dot,
      this.badgeColor});

  late String avatar;

  late String name;

  late String text;

  late int time;

  late int textCount;

  late int dot;

  Color? badgeColor;
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
        badgeColor: GlobalColors.danger),
    Conversation(
        avatar: "/user/user-02.png",
        name: "Henry Fisher",
        text: "Waiting for you!",
        time: 12,
        textCount: 0,
        dot: 1,
        badgeColor: GlobalColors.success),
    Conversation(
        avatar: "/user/user-04.png",
        name: "Jhon Doe",
        text: "What's up?",
        time: 32,
        textCount: 0,
        dot: 3,
        badgeColor: GlobalColors.warn),
    Conversation(
        avatar: "/user/user-05.png",
        name: "Jane Doe",
        text: "Great",
        time: 32,
        textCount: 2,
        dot: 66,
        badgeColor: GlobalColors.primary),
    Conversation(
        avatar: "/user/user-01.png",
        name: "Jhon Doe",
        text: "How are you?",
        time: 32,
        textCount: 0,
        dot: 3,
        badgeColor: Colors.yellowAccent),
    Conversation(
        avatar: "/user/user-03.png",
        name: "Jhon Doe",
        text: "How are you?",
        time: 32,
        textCount: 3,
        dot: 6549,
        badgeColor: Colors.pink),
  ];

  Future<List<Conversation>> loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    employees = chatData;

    return employees;
  }
}
