import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:free_flutter_admin_dashboard/provider/main_provider.dart';
import 'package:provider/provider.dart';

class SideMenuWidget extends StatelessWidget {
  dynamic e;

  SideMenuWidget({super.key, this.e});

  ValueNotifier<bool> expanded = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return _itemMenuWidget(context, e);
  }

  Widget _itemMenuWidget(BuildContext context, e) {
    List? childList = e['childList'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(children: [
        InkWell(
          child: Row(
            children: [
              if (e['icon'] != null)
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: SvgPicture.asset(
                    e['icon'],
                    width: 18,
                    height: 18,
                  ),
                ),
              Expanded(
                  child: Text(
                e['menuName'],
                style: const TextStyle(color: Colors.white),
              )),
              if (childList != null && childList.isNotEmpty)
                const Icon(
                  Icons.expand_circle_down_sharp,
                  color: Colors.white,
                )
            ],
          ),
          onTap: () {
            if (childList != null && childList.isNotEmpty) {
              expanded.value = !expanded.value;
            } else {
              pushOrJump(context, e);
            }
          },
        ),
        const SizedBox(
          height: 10,
        ),
        if (childList != null && childList.isNotEmpty)
          ValueListenableBuilder(
              valueListenable: expanded,
              builder: (context, visible, child) => Visibility(
                  visible: visible,
                  child: Column(
                    children: childList
                        .map((e) => _itemSubMenuWidget(context, e))
                        .toList(),
                  )))
      ]),
    );
  }

  Widget _itemSubMenuWidget(BuildContext context, e) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
        child: Row(
          children: [
            Expanded(
                child: Text(
              e['menuName'],
              style: const TextStyle(color: Colors.white60),
            )),
          ],
        ),
      ),
      onTap: () {
        pushOrJump(context, e);
      },
    );
  }

  pushOrJump(BuildContext context, e) {
    if (Scaffold.of(context).isDrawerOpen) {
      Scaffold.of(context).closeDrawer();
    }
    if (e['blank'] != null && true == e['blank']) {
      Navigator.of(context).pushNamed(e['path']);
      return;
    }
    context.read<MainProvider>().setSelectedPath(e['path']);
  }
}
