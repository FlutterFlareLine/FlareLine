import 'package:flareline/pages/chatgpt/conversation_page.dart';
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
  // TODO: implement padding
  EdgeInsetsGeometry? get padding => null;

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
    return Row(
      children: [
        _buildLeftNavigation(context, viewModel),
        Expanded(
            child: Column(
          children: [
            SizedBox(height: 10,),
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  _gptMessageWidget(context, viewModel),
                  Visibility(
                    visible: viewModel.showConversation,
                    child: ConversationPage(
                      onVisibleChanged: (visible) {
                        viewModel.showConversation = visible;
                      },
                    ),
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
                SizedBox(
                  height: 10,
                )
              ]),
            ),
          ],
        ))
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
        Container(
          width: 48,
          height: 48,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: messageEntity.isUser
                  ? const Color(0xFF9aa37e)
                  : GlobalColors.success,
              borderRadius: BorderRadius.circular(4)),
          alignment: Alignment.center,
          child: Text(
            messageEntity.isUser ? 'ME' : 'AI',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
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
                      TextButton.icon(
                          onPressed: () async {
                            viewModel.copy(context, messageEntity.content);
                          },
                          icon: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            child: Icon(
                                viewModel.hasCopied
                                    ? Icons.check
                                    : Icons.copy_rounded,
                                color: GlobalColors.success,
                                size: 16,
                                key: UniqueKey()),
                          ),
                          label: const Text(
                            'Copy',
                            style: TextStyle(color: Colors.white),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton.icon(
                          onPressed: () async {},
                          icon: const Icon(
                            Icons.link,
                            color: GlobalColors.success,
                            size: 16,
                          ),
                          label: const Text(
                            'Copy Link',
                            style: TextStyle(color: Colors.white),
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton.icon(
                          onPressed: () async {},
                          icon: const Icon(
                            Icons.photo,
                            color: GlobalColors.success,
                            size: 16,
                          ),
                          label: const Text(
                            'Save Image',
                            style: TextStyle(color: Colors.white),
                          )),
                      const Spacer(),
                      TextButton.icon(
                          onPressed: () async {},
                          icon: const Icon(
                            Icons.refresh,
                            color: GlobalColors.success,
                            size: 16,
                          ),
                          label: const Text(
                            'Refresh',
                            style: TextStyle(color: Colors.white),
                          ))
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

  _buildLeftNavigation(BuildContext context, ChatGptProvider viewModel) {
    UserEntity? loginUser = context.watch<StoreProvider>().user;
    String avatar = loginUser != null ? (loginUser.avatar ?? '') : '';

    return NavigationRail(
      elevation: 1,
      backgroundColor: Color(0xFF45454e),
      leading: SizedBox(
        height: 100,
        child: InkWell(
          child: SvgPicture.asset(
            'assets/logo/logo_white.svg',
            width: 35,
            height: 35,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      trailing: Expanded(
        child: Column(
          children: [
            Spacer(),
            InkWell(
              child: CircleAvatar(
                backgroundImage: (avatar != null && avatar.isNotEmpty
                        ? NetworkImage(avatar)
                        : const AssetImage('assets/user/user-02.png'))
                    as ImageProvider,
                radius: 20,
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/profile');
              },
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      extended: false,
      onDestinationSelected: (index) {
        return _onDestinationSelected(context, index, viewModel);
      },
      destinations: viewModel.destinations,
      labelType: NavigationRailLabelType.all,
      selectedIndex: viewModel.selectedIndex,
      unselectedLabelTextStyle: TextStyle(color: Colors.white),
      selectedLabelTextStyle: TextStyle(color: GlobalColors.success),
      selectedIconTheme: IconThemeData(color: GlobalColors.success),
      unselectedIconTheme: IconThemeData(color: Colors.white),
      useIndicator: false,
    );
  }

  void _onDestinationSelected(
      BuildContext context, int index, ChatGptProvider viewModel) {
    viewModel.selectedIndex = index;
    if (index == 0) {
      viewModel.hideSetting(context);
      viewModel.hideConversation(context);
      viewModel.startNewChat(context);

    } else if (index == 1) {
      viewModel.toggleConversation(context);
      viewModel.hideSetting(context);
    } else if (index == 6) {
      viewModel.hideConversation(context);
      viewModel.toggleSetting(context);
    }
  }
}
