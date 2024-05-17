import 'package:flutter/material.dart';

import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InvoicePage extends LayoutWidget {
  const InvoicePage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement title
    return 'Invoice';
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return CommonCard(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
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
                SizedBox(
                  width: 20,
                ),
                Column(
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
                Spacer(),
                Text(
                  'Order #15478',
                  style: TextStyle(fontSize: 18),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1)),
              child: Row(children: [
                Image.asset(
                  'assets/product/product-thumb.png',
                  width: 80,
                  height: 80,
                ),
                const Column(
                  children: [
                    Text('Mist Black Triblend'),
                    Text('Color: White  Size: Medium'),
                  ],
                ),
                const Spacer(),
                const Text('Qty: 01'),
                const SizedBox(
                  width: 20,
                ),
                const Text('\$120.00')
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Column(
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
                SizedBox(
                  width: 20,
                ),
                Column(
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
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              const Spacer(),
              SizedBox(
                width: 120,
                child: ButtonWidget(btnText: 'Download Invoice',type: ButtonType.primary.type,),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                  width: 120,
                  child: ButtonWidget(btnText: 'Send Invoice',type: ButtonType.primary.type,)),
            ])
          ]),
        ));
  }
}
