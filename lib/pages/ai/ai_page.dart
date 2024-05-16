import 'dart:convert';

import 'package:flareline/components/card/common_card.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/provider/main_provider.dart';
import 'package:flareline/provider/theme_provider.dart';
import 'package:flareline/utils/firebase_storage_utils.dart';
import 'package:flareline/utils/firebase_store_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AIPage extends LayoutWidget {
  const AIPage({super.key});

  bool get isContentScroll => false;

  @override
  String breakTabTitle(BuildContext context) {
    return 'AI';
  }

  _sideListWidget(BuildContext context, bool isDark) {
    return CommonCard(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: FutureBuilder(
            future:
                FirebaseStoreUtils.listDicChildren('dictionary', 'aiConfigKey'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData) {
                return const SizedBox.shrink();
              }

              // Decode the JSON
              List<Map<String, dynamic>> listMenu = snapshot.data ?? [];

              return itemBuilder(context, listMenu, isDark);
            }));
  }

  Widget itemBuilder(BuildContext context, List listMenu, bool isDark) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Wrap(
        runSpacing: 20,
        spacing: 20,
        alignment: WrapAlignment.start,
        children: listMenu.map((e) => GridMenuWidget(e: e)).toList(),
      ),
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const Divider(
      height: 10,
      color: Colors.transparent,
    );
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return _sideListWidget(context, context.watch<ThemeProvider>().isDark);
  }
}

class GridMenuWidget extends StatelessWidget {
  dynamic e;

  GridMenuWidget({super.key, this.e});

  @override
  Widget build(BuildContext context) {
    return _itemMenuWidget(context, e);
  }

  Widget _itemMenuWidget(BuildContext context, e) {
    bool isDark = context.watch<ThemeProvider>().isDark;
    String configValue = e['configValue'];
    String text = e['text'];

    String? url;
    String? desc;
    Map<String, dynamic>? configValueJson;
    try {
      configValueJson = jsonDecode(configValue);
      if (configValueJson != null) {
        url = configValueJson['url'];
        desc = configValueJson['desc'];
      }
    } catch (e) {}

    return InkWell(
      child: Container(
          alignment: Alignment.topLeft,
          width: 450,
          height: 220,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                color: GlobalColors.lightGray,
                child: e['image'] != null
                    ? Image.network(
                        e['image'],
                        width: 60,
                        height: 60,
                      )
                    : SizedBox.shrink(),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isDark ? Colors.white : GlobalColors.darkBlackText,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    url ?? configValue,
                    style: TextStyle(
                        color: isDark ? Colors.white : GlobalColors.success,
                        fontSize: 12),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    desc==null||desc=='' ? text:desc,
                    softWrap: true,
                    style: TextStyle(
                        color:
                        isDark ? Colors.white : GlobalColors.darkTextBody,
                        fontSize: 12),
                  )
                ],
              ),)
            ],
          )),
      onTap: () {
        pushOrJump(context, url);
      },
    );
  }

  pushOrJump(BuildContext context, url) async {
    if (url.startsWith('http')) {
      if (!await launchUrl(Uri.parse(url))) {
        throw Exception('Could not launch $url');
      }
      return;
    }

    String? routePath = ModalRoute.of(context)?.settings?.name;

    if (url == routePath) {
      return;
    }

    Navigator.of(context).pushNamed(url);
  }
}
