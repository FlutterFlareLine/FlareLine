import 'package:flutter/material.dart';
import 'package:flareline/components/chats.dart';
import 'package:flareline/components/tables/TopChannel.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ChannelWidget extends StatelessWidget {
  const ChannelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _channels();
  }

  _channels() {
    return ScreenTypeLayout.builder(
      desktop: _channelsWeb,
      mobile: _channelMobile,
      tablet: _channelMobile,
    );
  }

  Widget _channelsWeb(BuildContext context) {
    return SizedBox(
        height: 450,
        child: Row(
          children: [
            const Expanded(
              flex: 2,
              child: TopChannelWidget(),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(flex: 1, child: ChatsWidget()),
          ],
        ));
  }

  Widget _channelMobile(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 380,
          child: TopChannelWidget(),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
            height: 380,
            child: ChatsWidget()),
      ],
    );
  }
}
