import 'package:flutter/material.dart';

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
  Widget contentDesktopWidget(BuildContext context) {
    return WhiteCard(
        child: Padding(
          padding: EdgeInsets.all(20),
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
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Roger Culhane',
                            style: TextStyle(fontSize: 16)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Email: contact@example.com',
                            style: TextStyle(fontSize: 10)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Address: 2972 Westheimer Rd. Santa Ana.',
                            style: TextStyle(fontSize: 10))
                      ]),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'To',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Cristofer Levin',
                            style: TextStyle(fontSize: 16)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Email: contact@example.com',
                            style: TextStyle(fontSize: 10)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Address: New York, USA 2707 Davis Anenue',
                            style: TextStyle(fontSize: 10))
                      ]),
                ),
                Spacer(),
                Text(
                  'Order #15478',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1)),
              child: Row(children: [
                Image.asset(
                  'images/product/product-thumb.png',
                  width: 80,
                  height: 80,
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
                  width: 20,
                ),
                Text('\$120.00')
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shipping Method',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('FedEx - Take up to 3',
                            style: TextStyle(fontSize: 16)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('working days.',
                            style: TextStyle(fontSize: 10)),
                      ]),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment Method',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Apply Pay Mastercard',
                            style: TextStyle(fontSize: 16)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('**** **** **** 5874',
                            style: TextStyle(fontSize: 10)),
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
              height: 20,
            ),
            Container(
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Spacer(),
                SizedBox(
                  width: 120,
                  child: ButtonWidget(btnText: 'Download Invoice'),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                    width: 120,
                    child: ButtonWidget(btnText: 'Send Invoice')),
              ]),
            )
          ]),
        ));
  }
}
