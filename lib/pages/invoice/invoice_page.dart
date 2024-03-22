import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_flutter_admin_dashboard/components/buttons/button_widget.dart';
import 'package:free_flutter_admin_dashboard/components/card/white_card.dart';
import 'package:free_flutter_admin_dashboard/pages/layout.dart';

class InvoicePage extends LayoutWidget {
  @override
  String title() {
    // TODO: implement title
    return 'Invoice';
  }

  @override
  Widget contentWidget(BuildContext context) {
    return WhiteCard(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'From',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('Roger Culhane',
                            style: TextStyle(fontSize: 16.sp)),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('Email: contact@example.com',
                            style: TextStyle(fontSize: 10.sp)),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('Address: 2972 Westheimer Rd. Santa Ana.',
                            style: TextStyle(fontSize: 10.sp))
                      ]),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'To',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('Cristofer Levin',
                            style: TextStyle(fontSize: 16.sp)),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('Email: contact@example.com',
                            style: TextStyle(fontSize: 10.sp)),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('Address: New York, USA 2707 Davis Anenue',
                            style: TextStyle(fontSize: 10.sp))
                      ]),
                ),
                Spacer(),
                Text(
                  'Order #15478',
                  style: TextStyle(fontSize: 18.sp),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1)),
              child: Row(children: [
                Image.asset(
                  'images/product/product-thumb.png',
                  width: 80.w,
                  height: 80.h,
                ),
                Column(
                  children: [
                    Text('Mist Black Triblend'),
                    Text('Color: White  Size: Medium'),
                  ],
                ),
                Spacer(),
                Text('Qty: 01'),
                SizedBox(
                  width: 20.w,
                ),
                Text('\$120.00')
              ]),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shipping Method',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('FedEx - Take up to 3',
                            style: TextStyle(fontSize: 16.sp)),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('working days.',
                            style: TextStyle(fontSize: 10.sp)),
                      ]),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment Method',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('Apply Pay Mastercard',
                            style: TextStyle(fontSize: 16.sp)),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('**** **** **** 5874',
                            style: TextStyle(fontSize: 10.sp)),
                      ]),
                ),
                Spacer(),
                Column(
                  children: [
                    Text('Subtotal \$120.00'),
                    Text('Shipping Cost (+) \$10.00'),
                    Text('Total Payable \$130.00')
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Spacer(),
                SizedBox(
                  width: 120.w,
                  child: ButtonWidget(btnText: 'Download Invoice'),
                ),
                SizedBox(
                  width: 10.w,
                ),
                SizedBox(
                    width: 120.w,
                    child: ButtonWidget(btnText: 'Send Invoice')),
              ]),
            )
          ]),
        ));
  }
}
