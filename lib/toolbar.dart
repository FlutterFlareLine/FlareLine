import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ToolBarWidget extends StatelessWidget {
  const ToolBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _toolsBarWidget(context);
  }

  _toolsBarWidget(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10.w),
      child: Row(children: [
        ResponsiveBuilder(builder: (context, sizingInformation) {
          // Check the sizing information here and return your UI
          if (sizingInformation.deviceScreenType != DeviceScreenType.desktop) {
            return InkWell(
              child: Container(
                padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200,width: 1)),
                alignment: Alignment.center,
                child: Icon(Icons.more_vert),
              ),
              onTap: (){
                if( Scaffold.of(context).isDrawerOpen){
                  Scaffold.of(context).closeDrawer();
                  return;
                }
                Scaffold.of(context).openDrawer();
              },
            );
          }

          return SizedBox();
        }),
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
        InkWell(
          child: Container(
            child: Icon(Icons.arrow_drop_down),
            margin: EdgeInsets.only(left: 6.w),
          ),
          onTap: () async {
            await showMenu(
                color: Colors.white,
                context: context,
                position: RelativeRect.fromLTRB(
                    MediaQuery.of(context).size.width - 100.w, 80.h, 0, 0),
                items: <PopupMenuItem<String>>[
                  new PopupMenuItem<String>(
                      value: 'value01', child: new Text('My Profile')),
                  new PopupMenuItem<String>(
                      value: 'value02', child: new Text('My Contacts')),
                  new PopupMenuItem<String>(
                      value: 'value03', child: new Text('About Settings')),
                  new PopupMenuItem<String>(
                      value: 'value04', child: new Text('Log out'))
                ]);
          },
        )
      ]),
    );
  }
}
