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
            future: FirebaseStoreUtils.listDicChildren('dictionary', 'aiConfigKey'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  !snapshot.hasData) {
                return const SizedBox.shrink();
              }

              // Decode the JSON
              List<Map<String, dynamic>> listMenu = snapshot.data ?? [];
              // return ListView.separated(
              //     padding: const EdgeInsets.only(left: 20, right: 10),
              //     itemBuilder: (ctx, index) {
              //       return itemBuilder(ctx, index, listMenu, isDark);
              //     },
              //     separatorBuilder: separatorBuilder,
              //     itemCount: listMenu.length);
              return itemBuilder(context, 0, listMenu, isDark);
            }));
  }

  Widget itemBuilder(
      BuildContext context, int index, List listMenu, bool isDark) {
    // var groupElement = listMenu.elementAt(index);
    // List menuList = groupElement['menuList'];
    //
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     Text(
    //       groupElement['groupName'],
    //       style: TextStyle(
    //           fontSize: 20,
    //           color: isDark ? Colors.white60 : GlobalColors.darkBlackText),
    //     ),
    //     const SizedBox(
    //       height: 10,
    //     ),
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
    //     SizedBox(
    //       height: 10,
    //     ),
    //     if (index < listMenu.length - 1) Divider(),
    //     SizedBox(
    //       height: 10,
    //     ),
    //   ],
    // );
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

    return InkWell(
      child: Container(
          width: 120,
          height: 120,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (e['image'] != null)
                Container(
                  child: Image.network(
                    e['image'],
                    width: 60,
                    height: 60,
                  ),
                ),
              SizedBox(
                height: 12,
              ),
              Text(
                e['text'],
                style: TextStyle(
                    color: isDark ? Colors.white : GlobalColors.darkBlackText),
              ),
            ],
          )),
      onTap: () {
        pushOrJump(context, e);
      },
    );
  }

  pushOrJump(BuildContext context, e) async {
    String path = e['configValue'];

    String? routePath = ModalRoute.of(context)?.settings?.name;

    if (path == routePath) {
      return;
    }
    if (path.startsWith('http')) {
      if (!await launchUrl(Uri.parse(path))) {
        throw Exception('Could not launch $path');
      }
      return;
    }
    Navigator.of(context).pushNamed(path);
  }
}
