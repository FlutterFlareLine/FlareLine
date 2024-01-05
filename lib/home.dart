import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_flutter_admin_dashboard/sideBar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        _sideBarWidget(context),
        Expanded(child: _contentWidget(context))
      ],
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  _sideBarWidget(BuildContext context) {
    return SideBarWidger();
  }

  _contentWidget(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Column(children: [
        _toolsBarWidget(),
        SizedBox(
          height: 16.h,
        ),
        Expanded(child: _mainContentWidget())
      ]),
    );
  }

  _toolsBarWidget() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10.w),
      child: Row(children: [
        SizedBox(
          width: 200.w,
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.transparent,
              prefixIcon: Icon(Icons.search_rounded),
              // suffixIcon: Icon(Icons.clear),
              hintStyle: TextStyle(fontSize: 10.sp),
              // labelText: 'Type to search...',
              hintText: 'Type to search...',
              // helperText: 'Type to search...',
              filled: true,
            ),
          ),
        ),
        Spacer(),
        Switch(value: false, onChanged: (check) {}),
        SizedBox(
          width: 10.w,
        ),
        Icon(Icons.notifications),
        SizedBox(
          width: 10.w,
        ),
        Icon(Icons.message),
        SizedBox(
          width: 10.w,
        ),
        Column(
          children: [
            Text('Thomas Anree'),
            Text('Ux designer'),
          ],
        ),
        SizedBox(
          width: 5.w,
        ),
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://nextjs-demo.tailadmin.com/_next/image?url=%2Fimages%2Fuser%2Fuser-01.png&w=256&q=75'),
          radius: 22,
        ),
        DropdownButton(
            underline: Container(),
            dropdownColor: Colors.amber,
            items: [
              DropdownMenuItem(
                child: Text('My Profile'),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text('My Contacts'),
                value: 2,
              ),
              DropdownMenuItem(
                child: Text('About Settings'),
                value: 3,
              ),
              DropdownMenuItem(
                child: Text('Log out'),
                value: 4,
              ),
            ],
            onChanged: (item) {})
      ]),
    );
  }

  _mainContentWidget() {
    return Text('main content');
  }
}
