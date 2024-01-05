import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Column(children: [
        InkWell(
          child: Row(
            children: [
              Expanded(
                  child: Text(
                e['menuName'],
                style: TextStyle(color: Colors.white),
              )),
              if (childList != null && childList.length > 0)
                Icon(
                  Icons.expand_circle_down_sharp,
                  color: Colors.white,
                )
            ],
          ),
          onTap: () {
            if (childList != null && childList.length > 0) {
              expanded.value = !expanded.value;
            } else {
              context.read<MainProvider>().setSelectedPath(e['path']);
            }
          },
        ),
        SizedBox(
          height: 10.h,
        ),
        if (childList != null && childList.length > 0)
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
        padding: EdgeInsets.only(left: 20.w, top: 5.h, bottom: 5.h),
        child: Row(
          children: [
            Expanded(
                child: Text(
              e['menuName'],
              style: TextStyle(color: Colors.white60),
            )),
          ],
        ),
      ),
      onTap: () {
        context.read<MainProvider>().setSelectedPath(e['path']);
      },
    );
  }
}
