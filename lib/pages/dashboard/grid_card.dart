import 'package:flutter/material.dart';
import 'package:free_flutter_admin_dashboard/components/card/white_card.dart';
import 'package:responsive_builder/responsive_builder.dart';

class GridCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: contentDesktopWidget,
      mobile: contentMobileWidget,
      tablet: contentMobileWidget,
    );
  }

  Widget contentDesktopWidget(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: _itemCardWidget(
                Icons.data_object, '\$3.456K', 'Total views', '0.43%', true)),
        SizedBox(
          width: 16,
        ),
        Expanded(
            child: _itemCardWidget(
                Icons.shopping_cart, '\$45.2K', 'Total Profit', '0.43%', true)),
        SizedBox(
          width: 16,
        ),
        Expanded(
            child: _itemCardWidget(
                Icons.group, '2.450', 'Total Product', '0.43%', true)),
        SizedBox(
          width: 16,
        ),
        Expanded(
            child: _itemCardWidget(Icons.security_rounded, '3.456',
                'Total Users', '0.43%', false)),
      ],
    );
  }

  Widget contentMobileWidget(BuildContext context) {
    return Column(
      children: [
        _itemCardWidget(
            Icons.data_object, '\$3.456K', 'Total views', '0.43%', true),
        SizedBox(
          height: 16,
        ),
        _itemCardWidget(
            Icons.shopping_cart, '\$45.2K', 'Total Profit', '0.43%', true),
        SizedBox(
          height: 16,
        ),
        _itemCardWidget(Icons.group, '2.450', 'Total Product', '0.43%', true),
        SizedBox(
          height: 16,
        ),
        _itemCardWidget(
            Icons.security_rounded, '3.456', 'Total Users', '0.43%', false),
      ],
    );
  }

  _itemCardWidget(IconData icons, String text, String subTitle,
      String percentText, bool isGrow) {
    return WhiteCard(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                child: Icon(icons),
                color: Colors.grey.shade200,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                Text(
                  subTitle,
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
                Spacer(),
                Text(
                  percentText,
                  style: TextStyle(
                      fontSize: 10,
                      color: isGrow ? Colors.green : Colors.lightBlue),
                ),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  isGrow ? Icons.arrow_upward : Icons.arrow_downward,
                  color: isGrow ? Colors.green : Colors.lightBlue,
                  size: 12,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
