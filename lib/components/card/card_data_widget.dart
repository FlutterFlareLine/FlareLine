import 'package:flareline/crm/crm_colors.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CardDataWidget extends StatelessWidget {
  CardDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonCard(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/crm/airbnb.png',
                width: 80,
                height: 80,
              ),
              const SizedBox(
                width: 10,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Airbng',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text('Travel and Tourism')
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Text(
                          '\$33.2k',
                          style: TextStyle(
                              color: CrmColors.heading,
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '^ 30%',
                          style:
                              TextStyle(color: CrmColors.green, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Recurring Revenue',
                    style: TextStyle(color: CrmColors.paragraph, fontSize: 12),
                  )
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  SizedBox(
                      height: 50,
                      child: Container(
                          width: 50,
                          height: 50,
                          child: GFProgressBar(
                            percentage: 0.9,
                            width: 80,
                            radius: 80,
                            type: GFProgressType.circular,
                            backgroundColor: Colors.grey.shade200,
                            progressBarColor: GFColors.DANGER,
                            child: const Text(
                              '50%',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black),
                            ),
                          ))),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Engagement',
                      style:
                          TextStyle(color: CrmColors.paragraph, fontSize: 12))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
