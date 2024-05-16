import 'package:flareline/components/card/common_card.dart';
import 'package:flareline/components/forms/outborder_text_form_field.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flareline/entity/conversation_entity.dart';
import 'package:flareline/entity/message_entity.dart';
import 'package:flareline/entity/user_entity.dart';
import 'package:flareline/pages/chatgpt/chatgpt_provider.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/pages/setting/open_ai_setting.dart';
import 'package:flareline/provider/store_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:provider/provider.dart';

class ChatGptPage extends LayoutWidget {
  @override
  // TODO: implement isContentScroll
  bool get isContentScroll => false;

  @override
  // TODO: implement showSideBar
  bool get showSideBar => false;

  @override
  // TODO: implement showToolBar
  bool get showToolBar => false;

  @override
  // TODO: implement showTitle
  bool get showTitle => false;

  final double margin = 180;

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return ChangeNotifierProvider(
        create: (ctx) => ChatGptProvider(ctx),
        builder: (ctx, widget) {
          return Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    _gptMessageWidget(ctx),
                    Visibility(
                      child: _conversationWidget(ctx),
                      visible: ctx.watch<ChatGptProvider>().showConversation,
                    ),
                    Align(
                      child: _toolsWidget(ctx),
                      alignment: Alignment.centerLeft,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: margin),
                alignment: Alignment.center,
                child: CommonCard(
                  padding: const EdgeInsets.all(16),
                  child: Column(children: [
                    Visibility(
                      child: Column(
                        children: [
                          const OpenAiSetting(),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      visible: ctx.watch<ChatGptProvider>().showSettings,
                    ),
                    OutBorderTextFormField(
                      hintText: 'Message ChatGPT...',
                      controller: ctx.read<ChatGptProvider>().controller,
                      textInputAction: TextInputAction.send,
                      onFieldSubmitted: (value) {
                        ctx.read<ChatGptProvider>().send(context);
                      },
                      suffixWidget: InkWell(
                        child: Icon(
                          Icons.send,
                          color: ctx.watch<ChatGptProvider>().isLoading
                              ? GlobalColors.border
                              : GlobalColors.primary,
                        ),
                        onTap: () {
                          ctx.read<ChatGptProvider>().send(context);
                        },
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          );
        });
  }

  @override
  String breakTabTitle(BuildContext context) {
    return 'ChatGpt';
  }

  _gptMessageWidget(BuildContext ctx) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: ListView.builder(
        itemBuilder: itemBuilder,
        itemCount: ctx.watch<ChatGptProvider>().messageCount,
      ),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    MessageEntity messageEntity =
        context.read<ChatGptProvider>().getItemMessage(index);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          messageEntity.isUser ? 'Question:' : 'GPT Answer:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        MarkdownBlock(data: messageEntity.content),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _conversationWidget(BuildContext ctx) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: Stack(
        children: [
          ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: margin),
            itemBuilder: conversationItemBuilder,
            itemCount: ctx.watch<ChatGptProvider>().conversationCount,
            separatorBuilder: _dividerBuilder,
          ),
          IconButton(
              onPressed: () {
                ctx.read<ChatGptProvider>().toggleConversation(ctx);
              },
              icon: Icon(Icons.close))
        ],
      ),
    );
  }

  Widget conversationItemBuilder(BuildContext context, int index) {
    ConversationEntity conversationEntity =
        context.read<ChatGptProvider>().getConversation(index);
    String? title =
        conversationEntity.title ?? conversationEntity.latestMessage?.content;
    if (title == 'New Chat' && conversationEntity.latestMessage != null) {
      title = conversationEntity.latestMessage!.content;
    }
    return InkWell(
      child: Container(
        child: Column(
          children: [
            Text(
              title ?? '',
              maxLines: 1,
              style: TextStyle(
                fontSize: 12,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              DateFormat('yyyy-MM-dd HH:mm:ss')
                  .format(conversationEntity.timestamp),
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 8),
      ),
      onTap: () {
        context.read<ChatGptProvider>().toggleConversation(context);
        context
            .read<ChatGptProvider>()
            .setConversationEntity(context, conversationEntity);
      },
    );
  }

  Widget _dividerBuilder(BuildContext context, int index) {
    return Divider(
      height: 1,
      color: GlobalColors.border,
    );
  }

  _toolsWidget(BuildContext ctx) {
    UserEntity? loginUser = ctx.watch<StoreProvider>().user;
    String avatar = loginUser != null ? (loginUser.avatar ?? '') : '';

    return Container(
      width: 80,
      padding: EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
          color: GlobalColors.dark,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: GlobalColors.gray, width: 1)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            child: SvgPicture.asset(
              'assets/logo/logo_white.svg',
              width: 35,
              height: 35,
            ),
            onTap: (){
              Navigator.of(ctx).pop();
            },
          ),
          SizedBox(
            height: 10,
          ),
          Divider(color: GlobalColors.border,indent: 20,endIndent: 20,),
          SizedBox(
            height: 10,
          ),
          IconButton(
              onPressed: () {
                ctx.read<ChatGptProvider>().startNewChat(ctx);
              },
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.white,
                size: 30,
              )),
          SizedBox(
            height: 10,
          ),
          IconButton(
              onPressed: () {
                ctx.read<ChatGptProvider>().toggleConversation(ctx);
              },
              icon: Icon(
                Icons.history,
                color: Colors.white,
                size: 30,
              )),
          SizedBox(
            height: 10,
          ),
          IconButton(
              onPressed: () {
                ctx.read<ChatGptProvider>().toggleSetting(ctx);
              },
              icon: Icon(
                Icons.settings,
                color: Colors.white,
                size: 30,
              )),
          SizedBox(
            height: 10,
          ),
          Divider(color: GlobalColors.border,indent: 20,endIndent: 20,),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: CircleAvatar(
              backgroundImage: (avatar != null && avatar.isNotEmpty
                  ? NetworkImage(avatar)
                  : AssetImage('assets/user/user-02.png')) as ImageProvider,
              radius: 20,
            ),
            onTap: (){
              Navigator.of(ctx).pushNamed('/profile');
            },
          )
        ],
      ),
    );
  }
}
