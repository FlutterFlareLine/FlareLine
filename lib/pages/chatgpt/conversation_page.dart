import 'package:flareline/core/theme/global_colors.dart';
import 'package:flareline/entity/conversation_entity.dart';
import 'package:flareline/entity/message_entity.dart';
import 'package:flareline/provider/store_provider.dart';
import 'package:flareline/utils/firebase_store_utils.dart';
import 'package:flareline_uikit/core/event/global_event.dart';
import 'package:flareline_uikit/service/base_provider.dart';
import 'package:flareline_uikit/widget/base/base_stless_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ConversationPage extends BaseStlessWidget<ConversationViewModel> {
  ValueChanged<bool>? onVisibleChanged;

  ConversationPage({super.key, this.onVisibleChanged});

  @override
  Widget bodyWidget(
      BuildContext context, ConversationViewModel viewModel, Widget? child) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: const Color(0xFF45454e).withOpacity(0.8),
      margin: const EdgeInsets.symmetric(horizontal: 360),
      child: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 180, vertical: 20),
            itemBuilder: (context, index) {
              return conversationItemBuilder(context, index, viewModel);
            },
            itemCount: viewModel.conversationCount,
            separatorBuilder: _dividerBuilder,
          ),
          IconButton(
              onPressed: () {
                if (onVisibleChanged != null) {
                  onVisibleChanged!(false);
                }
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  Widget conversationItemBuilder(
      BuildContext context, int index, ConversationViewModel viewModel) {
    ConversationEntity conversationEntity = viewModel.getConversation(index);
    String title =
        conversationEntity.title ?? '';

    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: GlobalColors.lightGray, width: 1),
            borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  maxLines: 1,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  DateFormat('yyyy-MM-dd HH:mm:ss').format(
                      DateTime.fromMillisecondsSinceEpoch(
                          conversationEntity.timestamp)),
                  style: const TextStyle(fontSize: 10, color: Colors.white),
                )
              ],
            )),
            IconButton(
                onPressed: () {
                  viewModel.deleteConversation(context, conversationEntity.id);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ))
          ],
        ),
      ),
      onTap: () {
        if (onVisibleChanged != null) {
          onVisibleChanged!(false);
        }
        GlobalEvent.eventBus
            .fire(EventInfo(conversationEntity, 'showConversation'));
      },
    );
  }

  Widget _dividerBuilder(BuildContext context, int index) {
    return const Divider(
      height: 10,
      color: Colors.transparent,
    );
  }

  @override
  ConversationViewModel viewModelBuilder(BuildContext context) {
    return ConversationViewModel(context);
  }
}

class ConversationViewModel extends BaseProvider {
  ConversationViewModel(super.context);

  List<ConversationEntity> conversationList = [];

  int get conversationCount => conversationList.length;

  ConversationEntity getConversation(int index) {
    return conversationList.elementAt(index);
  }

  @override
  void init(BuildContext context) {
    fetchConversations(context);
  }

  fetchConversations(BuildContext ctx) async {
    String email = ctx.read<StoreProvider>().email;
    if(email==''){
      return;
    }
    final query = await FirebaseStoreUtils.db
        .collection('conversation')
        .where('belongUid', isEqualTo: email)
        .orderBy("timestamp", descending: true)
        .get();
    if (query.docs.isEmpty) {
      conversationList.clear();
      notifyListeners();
      return;
    }
    if (query.docs.isNotEmpty) {
      conversationList.clear();
      List<ConversationEntity> list = query.docs.map((element) {
        ConversationEntity entity = ConversationEntity.fromJson(element.data());
        return entity;
      }).toList();
      conversationList.addAll(list);

      conversationList.forEach((element) async {
        final queryMessage = await FirebaseStoreUtils.db
            .collection('messages')
            .where('belongUid', isEqualTo: email)
            .where('conversationId', isEqualTo: element.id)
            .orderBy("timestamp",descending: true)
            .limitToLast(1)
            .get();
        if (queryMessage.docs.isNotEmpty) {
          Map<String, dynamic> msgMap = queryMessage.docs.elementAt(0).data();

          MessageEntity msg = MessageEntity.fromJson(msgMap);
          element.latestMessage = msg;

          if(element.title==null||element.title==''||element.title?.trim()==''){

            element.title = element.latestMessage?.content;
          }
        }
      });
      notifyListeners();
    }
  }

  deleteConversation(BuildContext ctx, String id) {
    FirebaseStoreUtils.delete('conversation', id)
        .then((value) => fetchConversations(ctx));
  }
}
