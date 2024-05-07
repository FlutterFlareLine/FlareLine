import 'package:flareline/components/card/common_card.dart';
import 'package:flareline/components/forms/outborder_text_form_field.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flareline/entity/conversation_entity.dart';
import 'package:flareline/entity/message_entity.dart';
import 'package:flareline/pages/chatgpt/chatgpt_provider.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/pages/setting/open_ai_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

class ChatGptPage extends LayoutWidget {
  @override
  // TODO: implement isContentScroll
  bool get isContentScroll => false;

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
                    CommonCard(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: _conversationWidget(ctx),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: VerticalDivider(
                                width: 1,
                                color: GlobalColors.border,
                              ),
                            ),
                            Expanded(child: _gptMessageWidget(ctx))
                          ],
                        )),
                    Align(
                      child: Container(
                        child: IconButton(
                            onPressed: () {
                              ctx.read<ChatGptProvider>().startNewChat(ctx);
                            },
                            icon: Icon(Icons.add_circle_outline)),
                        margin: EdgeInsets.all(10),
                      ),
                      alignment: Alignment.topRight,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Icon(Icons.settings),
                          onTap: () {
                            ctx.read<ChatGptProvider>().toggleSetting(ctx);
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: OutBorderTextFormField(
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
                        )
                      ],
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
    return ListView.builder(
      itemBuilder: itemBuilder,
      itemCount: ctx.watch<ChatGptProvider>().messageCount,
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
    return ListView.separated(
      itemBuilder: conversationItemBuilder,
      itemCount: ctx.watch<ChatGptProvider>().conversationCount,
      separatorBuilder: _dividerBuilder,
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
            Text(title ?? ''),
            Text(DateFormat('yyyy-MM-dd HH:mm:ss')
                .format(conversationEntity.timestamp),style: TextStyle(fontSize: 10),)
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 8),
      ),
      onTap: () {
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
}
