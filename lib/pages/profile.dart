import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_flutter_admin_dashboard/pages/layout.dart';

class ProfilePage extends LayoutWidget {
  @override
  String title() {
    // TODO: implement title
    return 'Profile';
  }

  @override
  Widget contentWidget(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(children: [
        SizedBox(
          height: 180.h,
          child: Stack(children: [
            Image.asset(
              'images/cover/cover-01.png',
              height: 180.h,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.all(10.w),
                child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Edit',
                      style: TextStyle(color: Colors.white),
                    )),
                color: Colors.blueAccent,
              ),
            )
          ]),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 130.h,
              ),
              Container(
                width: 144,
                height: 144,
                child: Stack(children: [
                  CircleAvatar(
                    radius: 72,
                    backgroundColor: Colors.greenAccent,
                    child: Image.asset('images/user/user-01.png'),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      alignment: Alignment.center,
                      width: 22.w,
                      height: 22.w,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(45)),
                      child: Icon(
                        Icons.camera_enhance,
                        color: Colors.white,
                        size: 18,
                      ),
                      margin: EdgeInsets.all(2.w),
                    ),
                  )
                ]),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Danish Heilium',
                style: TextStyle(fontSize: 16.sp),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Ui/Ux Designer',
                style: TextStyle(fontSize: 10.sp),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                width: 220.w,
                padding: EdgeInsets.symmetric(vertical: 8.h),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1)),
                child: Row(children: [
                  Expanded(
                      child: Container(
                    child: Text.rich(
                      TextSpan(
                          text: '259', children: [TextSpan(text: ' Posts')]),
                    ),
                    alignment: Alignment.center,
                  )),
                  VerticalDivider(
                    width: 1,
                  ),
                  Expanded(
                      child: Container(
                    child: Text.rich(
                      TextSpan(
                          text: '129K',
                          children: [TextSpan(text: ' Followers')]),
                    ),
                    alignment: Alignment.center,
                  )),
                  VerticalDivider(
                    width: 1,
                  ),
                  Expanded(
                      child: Container(
                    child: Text.rich(
                      TextSpan(
                          text: '2K', children: [TextSpan(text: ' Following')]),
                    ),
                    alignment: Alignment.center,
                  ))
                ]),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'About Me',
                style: TextStyle(fontSize: 10.sp),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                alignment: Alignment.center,
                width: 400.w,
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque posuere fermentum urna, eu condimentum mauris tempus ut. Donec fermentum blandit aliquet. Etiam dictum dapibus ultricies. Sed vel aliquet libero. Nunc a augue fermentum, pharetra ligula sed, aliquam lacus.',
                  style: TextStyle(fontSize: 10.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Follow me on',
                style: TextStyle(fontSize: 10.sp),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
