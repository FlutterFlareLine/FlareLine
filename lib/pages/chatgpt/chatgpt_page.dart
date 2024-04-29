import 'package:dart_openai/src/core/models/model/model.dart';
import 'package:flareline/components/buttons/button_widget.dart';
import 'package:flareline/components/card/common_card.dart';
import 'package:flareline/components/forms/checkbox_widget.dart';
import 'package:flareline/components/forms/outborder_text_form_field.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flareline/pages/chatgpt/chatgpt_provider.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/pages/setting/open_ai_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:markdown_widget/markdown_widget.dart';
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
                        child: SingleChildScrollView(
                            child: MarkdownBlock(
                                data: ctx.watch<ChatGptProvider>().text))),
                    if (ctx.watch<ChatGptProvider>().isLoading)
                      Center(
                        child: SizedBox(
                          child: CircularProgressIndicator(),
                          width: 100,
                          height: 100,
                        ),
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
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: OutBorderTextFormField(
                            hintText: 'Message ChatGPT...',
                            controller: ctx.read<ChatGptProvider>().controller,
                            textInputAction: TextInputAction.send,
                            onFieldSubmitted: (value){
                              ctx.read<ChatGptProvider>().send(context);
                            },
                            suffixWidget: InkWell(
                              child: Icon(Icons.send),
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
}
