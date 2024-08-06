import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter/material.dart';

import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/flutter_gen/app_localizations.dart';

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
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'From',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Roger Culhane',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Text('Email: contact@example.com',
                  style: TextStyle(fontSize: 14)),
              SizedBox(
                height: 10,
              ),
              Text('Address: 2972 Westheimer Rd. Santa Ana.',
                  style: TextStyle(fontSize: 14))
            ]),
            SizedBox(
              width: 20,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'To',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Cristofer Levin',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Text('Email: contact@example.com',
                  style: TextStyle(fontSize: 14)),
              SizedBox(
                height: 10,
              ),
              Text('Address: New York, USA 2707 Davis Anenue',
                  style: TextStyle(fontSize: 14))
            ]),
            Spacer(),
            Text(
              'Order #15478',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              border: Border.all(color: GlobalColors.border, width: 1)),
          child: Row(children: [
            Image.asset(
              'assets/product/product-thumb.png',
              width: 80,
              height: 80,
            ),
            const SizedBox(
              width: 12,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mist Black Triblend'),
                Text(
                  'Color: White  Size: Medium',
                  style: TextStyle(fontSize: 13),
                ),
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
        Row(
          children: [
            const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Shipping Method',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text('FedEx - Take up to 3', style: TextStyle(fontSize: 14)),
              SizedBox(
                height: 10,
              ),
              Text('working days.', style: TextStyle(fontSize: 10)),
            ]),
            const SizedBox(
              width: 20,
            ),
            const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Payment Method',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Apply Pay Mastercard', style: TextStyle(fontSize: 14)),
              SizedBox(
                height: 10,
              ),
              Text('**** **** **** 5874', style: TextStyle(fontSize: 10)),
            ]),
            const Spacer(),
            SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text('Subtotal'),
                      SizedBox(
                        width: 100,
                      ),
                      Expanded(child: Text('\$120.00',textAlign: TextAlign.end)),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Row(
                    children: [
                      Text('Shipping Cost '),
                      SizedBox(
                        width: 100,
                      ),
                      Expanded(child: Text('(+) \$10.00',textAlign: TextAlign.end)),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 1,
                    color: GlobalColors.border,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Row(
                    children: [
                      Text('Total Payable '),
                      Expanded(child: Text('\$130.00',textAlign: TextAlign.end,)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          const Spacer(),
          SizedBox(
            width: 150,
            child: ButtonWidget(
              btnText: 'Download Invoice',
              type: ButtonType.primary.type,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
              width: 150,
              child: ButtonWidget(
                btnText: 'Send Invoice',
                type: ButtonType.success.type,
              )),
        ])
      ]),
    ));
  }
}
