import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EcommercePage extends StatelessWidget {
  const EcommercePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: Column(children: [
        _cardPages(),
      ]),
    );
  }

  _cardPages() {
    return Row(
      children: [
        _itemCardWidget(
            Icons.data_object, '\$3.456K', 'Total views', '0.43%', true),
        _itemCardWidget(
            Icons.shopping_cart, '\$45.2K', 'Total Profit', '0.43%', true),
        _itemCardWidget(Icons.group, '2.450', 'Total Product', '0.43%', true),
        _itemCardWidget(
            Icons.security_rounded, '3.456', 'Total Users', '0.43%', false),
      ],
    );
  }

  _itemCardWidget(IconData icons, String text, String subTitle,
      String percentText, bool isGrow) {
    return Expanded(
        child: Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: Container(
                width: 36.w,
                height: 36.w,
                alignment: Alignment.center,
                child: Icon(icons),
                color: Colors.grey.shade200,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              children: [
                Text(
                  subTitle,
                  style: TextStyle(fontSize: 10.sp, color: Colors.grey),
                ),
                Spacer(),
                Text(percentText,style: TextStyle(fontSize: 10.sp, color: isGrow ? Colors.green : Colors.lightBlue),),
                SizedBox(
                  width: 3.w,
                ),
                Icon(
                  isGrow ? Icons.arrow_upward : Icons.arrow_downward,
                  color: isGrow ? Colors.green : Colors.lightBlue,
                  size: 12.w,
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
