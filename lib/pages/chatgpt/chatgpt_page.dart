import 'package:flareline_uikit/components/forms/outborder_text_form_field.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flareline/entity/conversation_entity.dart';
import 'package:flareline/entity/message_entity.dart';
import 'package:flareline/entity/user_entity.dart';
import 'package:flareline/pages/chatgpt/chatgpt_provider.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/pages/setting/open_ai_setting.dart';
import 'package:flareline/provider/store_provider.dart';
import 'package:flareline_uikit/widget/base/base_stless_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChatGptPage extends LayoutWidget {
  const ChatGptPage({super.key});

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

  @override
  // TODO: implement backgroundColor
  Color? get backgroundColor => const Color(0xFF2b2b35);

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return ContentPage();
  }

  @override
  String breakTabTitle(BuildContext context) {
    return 'ChatGpt';
  }
}

class ContentPage extends BaseStlessWidget<ChatGptProvider> {
  final double margin = 180;

  @override
  Widget bodyWidget(
      BuildContext context, ChatGptProvider viewModel, Widget? child) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              _gptMessageWidget(context, viewModel),
              Visibility(
                visible: viewModel.showConversation,
                child: _conversationWidget(context, viewModel),
              ),
              Align(
                child: _toolsWidget(context, viewModel),
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
          child: Column(children: [
            Visibility(
              visible: viewModel.showSettings,
              child: const Column(
                children: [
                  OpenAiSetting(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            OutBorderTextFormField(
              hintText: 'Message ChatGPT...',
              controller: viewModel.controller,
              textInputAction: TextInputAction.send,
              textStyle: const TextStyle(color: Colors.white),
              focusColor: GlobalColors.success,
              onFieldSubmitted: (value) {
                viewModel.send(context);
              },
              suffixWidget: InkWell(
                child: Icon(
                  Icons.send,
                  color: viewModel.isLoading
                      ? GlobalColors.border
                      : GlobalColors.success,
                ),
                onTap: () {
                  viewModel.send(context);
                },
              ),
            ),
          ]),
        ),
      ],
    );
  }

  @override
  ChatGptProvider viewModelBuilder(BuildContext context) {
    return ChatGptProvider(context);
  }

  _gptMessageWidget(BuildContext ctx, ChatGptProvider viewModel) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return itemBuilder(context, index, viewModel);
        },
        itemCount: viewModel.messageCount,
      ),
    );
  }

  Widget itemBuilder(
      BuildContext context, int index, ChatGptProvider viewModel) {
    MessageEntity messageEntity = viewModel.getItemMessage(index);

    return Column(
      crossAxisAlignment: messageEntity.isUser
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(
          messageEntity.isUser ? 'Question:' : 'GPT Answer:',
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: messageEntity.isUser
                    ? GlobalColors.success
                    : const Color(0xFF45454e),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  messageEntity.content,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                if (!messageEntity.isUser)
                  const SizedBox(
                    height: 18,
                  ),
                if (!messageEntity.isUser)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                              viewModel.hasCopied
                                  ? Icons.check
                                  : Icons.copy_rounded,
                              color: GlobalColors.success,
                              size: 16,
                              key: UniqueKey()),
                        ),
                        onTap: () async {
                          context
                              .read<ChatGptProvider>()
                              .copy(context, messageEntity.content);
                        },
                      ),
                      // SizedBox(width: 10,),
                      // InkWell(
                      //   child: AnimatedSwitcher(
                      //     child: Icon(
                      //         Icons.wordpress,
                      //         key: UniqueKey()),
                      //     duration: Duration(milliseconds: 200),
                      //   ),
                      //   onTap: () async {
                      //
                      //   },
                      // ),
                    ],
                  )
              ],
            )),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _conversationWidget(BuildContext ctx, ChatGptProvider viewModel) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: const Color(0xFF45454e).withOpacity(0.8),
      margin: EdgeInsets.symmetric(horizontal: margin * 2),
      child: Stack(
        children: [
          ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: margin,vertical: 20),
            itemBuilder: (context, index) {
              return conversationItemBuilder(context, index, viewModel);
            },
            itemCount: viewModel.conversationCount,
            separatorBuilder: _dividerBuilder,
          ),
          IconButton(
              onPressed: () {
                viewModel.toggleConversation(ctx);
              },
              icon: const Icon(Icons.close, color: Colors.white,))
        ],
      ),
    );
  }

  Widget conversationItemBuilder(
      BuildContext context, int index, ChatGptProvider viewModel) {
    ConversationEntity conversationEntity = viewModel.getConversation(index);
    String? title =
        conversationEntity.title ?? conversationEntity.latestMessage?.content;
    if (title == 'New Chat' && conversationEntity.latestMessage != null) {
      title = conversationEntity.latestMessage!.content;
    }
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: GlobalColors.lightGray, width: 1),
            borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 10),
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
              DateFormat('yyyy-MM-dd HH:mm:ss')
                  .format(conversationEntity.timestamp),
              style: const TextStyle(fontSize: 10, color: Colors.white),
            )
          ],
        ),
      ),
      onTap: () {
        viewModel.toggleConversation(context);
        viewModel.setConversationEntity(context, conversationEntity);
      },
    );
  }

  Widget _dividerBuilder(BuildContext context, int index) {
    return const Divider(
      height: 10,
      color: Colors.transparent,
    );
  }

  _toolsWidget(BuildContext ctx, ChatGptProvider viewModel) {
    UserEntity? loginUser = ctx.watch<StoreProvider>().user;
    String avatar = loginUser != null ? (loginUser.avatar ?? '') : '';

    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
          color: const Color(0xFF45454e),
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
            onTap: () {
              Navigator.of(ctx).pop();
            },
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: GlobalColors.border,
            indent: 20,
            endIndent: 20,
          ),
          const SizedBox(
            height: 10,
          ),
          IconButton(
              onPressed: () {
                ctx.read<ChatGptProvider>().startNewChat(ctx);
              },
              icon: const Icon(
                Icons.add_circle_outline,
                color: Colors.white,
                size: 30,
              )),
          const SizedBox(
            height: 10,
          ),
          IconButton(
              onPressed: () {
                viewModel.toggleConversation(ctx);
              },
              icon: const Icon(
                Icons.history,
                color: Colors.white,
                size: 30,
              )),
          const SizedBox(
            height: 10,
          ),
          IconButton(
              onPressed: () {
                viewModel.toggleSetting(ctx);
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 30,
              )),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: GlobalColors.border,
            indent: 20,
            endIndent: 20,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            child: CircleAvatar(
              backgroundImage: (avatar != null && avatar.isNotEmpty
                      ? NetworkImage(avatar)
                      : const AssetImage('assets/user/user-02.png'))
                  as ImageProvider,
              radius: 20,
            ),
            onTap: () {
              Navigator.of(ctx).pushNamed('/profile');
            },
          )
        ],
      ),
    );
  }
}
