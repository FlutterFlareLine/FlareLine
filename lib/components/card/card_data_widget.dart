import 'package:flareline/crm/crm_colors.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:getwidget/getwidget.dart';

class CardDataWidget extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String desc;
  final String price;
  final String percent;
  final bool isGrow;
  final Color engagementColor;
  final int engagementPercent;

  const CardDataWidget(
      {super.key,
      required this.imageAsset,
      required this.title,
      required this.desc,
      required this.price,
      required this.percent,
      required this.isGrow,
      required this.engagementColor,
      required this.engagementPercent});

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
                imageAsset,
                width: 80,
                height: 80,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(desc)
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                              color: CrmColors.heading,
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          isGrow
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: isGrow ? CrmColors.green : CrmColors.red,
                          size: 18,
                        ),
                        const SizedBox(width: 4,),
                        Text(
                          percent,
                          style: TextStyle(
                              color: isGrow ? CrmColors.green : CrmColors.red,
                              fontSize: 14),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
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
                      child: SizedBox(
                          width: 50,
                          height: 50,
                          child: GFProgressBar(
                            percentage: engagementPercent / 100,
                            radius: 50,
                            type: GFProgressType.circular,
                            backgroundColor: Colors.grey.shade200,
                            progressBarColor: engagementColor,
                            child: Text(
                              '$engagementPercent',
                              style: const TextStyle(
                                  fontSize: 11, color: Colors.black),
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
