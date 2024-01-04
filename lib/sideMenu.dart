import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SideMenuWidget extends StatelessWidget {
  dynamic e;
  SideMenuWidget({super.key, this.e});

  ValueNotifier<bool> expanded = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return _itemMenuWidget(e);
  }

  Widget _itemMenuWidget(e) {
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
            expanded.value = !expanded.value;
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
                    children:
                        childList.map((e) => _itemSubMenuWidget(e)).toList(),
                  )))
      ]),
    );
  }

  Widget _itemSubMenuWidget(e) {
    return Padding(
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
    );
  }
}
