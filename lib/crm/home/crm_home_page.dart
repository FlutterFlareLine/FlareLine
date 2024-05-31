import 'package:flareline/components/card/card_data_widget.dart';
import 'package:flareline/components/charts/line_chart.dart';
import 'package:flareline/components/tables/TopChannel.dart';
import 'package:flareline/crm/crm_colors.dart';
import 'package:flareline/crm/crm_layout.dart';
import 'package:flareline/pages/table/contacts_page.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline_uikit/components/card/title_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrmHomePage extends CrmLayout {
  const CrmHomePage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'Dashboard';
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 650,
          child: Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  _topToolsWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: CommonCard(
                    child: LineChartWidget(
                      title: 'Sales Figures',
                      datas: [
                        {
                          'name':'Marketing Sales',
                          'color': Color(0xFFFE8111),
                          'data':[
                            {
                              'x':'Jan',
                              'y':25
                            },
                            {
                              'x':'Fed',
                              'y':75
                            },
                            {
                              'x':'Mar',
                              'y':28
                            },
                            {
                              'x':'Apr',
                              'y':32
                            },
                            {
                              'x':'May',
                              'y':40
                            },
                            {
                              'x':'Jun',
                              'y':48
                            },
                            {
                              'x':'Jul',
                              'y':44
                            },
                            {
                              'x':'Aug',
                              'y':42
                            },
                            {
                              'x':'Sep',
                              'y':70
                            },
                            {
                              'x':'Oct',
                              'y':65
                            },
                            {
                              'x':'Nov',
                              'y':55
                            },
                            {
                              'x':'Dec',
                              'y':78
                            }
                          ]
                        },
                        {
                          'name':'Cases Sales',
                          'color': Color(0xFF01B7F9),
                          'data':[
                            {
                              'x':'Jan',
                              'y':70
                            },
                            {
                              'x':'Fed',
                              'y':30
                            },
                            {
                              'x':'Mar',
                              'y':66
                            },
                            {
                              'x':'Apr',
                              'y':44
                            },
                            {
                              'x':'May',
                              'y':55
                            },
                            {
                              'x':'Jun',
                              'y':51
                            },
                            {
                              'x':'Jul',
                              'y':44
                            },
                            {
                              'x':'Aug',
                              'y':30
                            },
                            {
                              'x':'Sep',
                              'y':100
                            },
                            {
                              'x':'Oct',
                              'y':87
                            },
                            {
                              'x':'Nov',
                              'y':77
                            },
                            {
                              'x':'Dec',
                              'y':20
                            }
                          ]
                        },

                      ],
                    ),
                  ))
                ],
              )),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                  width: 400,
                  child: TitleCard(
                    title: 'Sorce Of Purchases',
                    childWidget: Text(''),
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 500,
          child: TopChannelWidget(),
        ),
      ],
    );
  }

  final List<Map<String, dynamic>> datas = const [
    {
      'imageAsset': 'assets/crm/airbnb.png',
      'title': 'Airbnb',
      'desc': 'Travel and tourism',
      'price': '\$33.2k',
      'percent': '37%',
      'isGrow': true,
      'engagementColor': CrmColors.secondary,
      'engagementPercent': 55
    },
    {
      'imageAsset': 'assets/crm/mailchimp.png',
      'title': 'MailChimp',
      'desc': 'Email Marketing Company',
      'price': '\$3.2k',
      'percent': '23%',
      'isGrow': false,
      'engagementColor': CrmColors.red,
      'engagementPercent': 15
    },
    {
      'imageAsset': 'assets/crm/hubspot.png',
      'title': 'Hubspot',
      'desc': 'CRM Software',
      'price': '\$50.2k',
      'percent': '45%',
      'isGrow': true,
      'engagementColor': CrmColors.orange,
      'engagementPercent': 75
    }
  ];

  Widget _topToolsWidget() {
    List<Widget> widgets = [];
    for (int i = 0; i < datas.length; i++) {
      dynamic item = datas[i];
      widgets.add(Expanded(
        child: CardDataWidget(
          imageAsset: item['imageAsset'],
          title: item['title'],
          desc: item['desc'],
          price: item['price'],
          percent: item['percent'],
          isGrow: item['isGrow'],
          engagementColor: item['engagementColor'],
          engagementPercent: item['engagementPercent'],
        ),
      ));
      if (i < datas.length - 1) {
        widgets.add(const SizedBox(
          width: 20,
        ));
      }
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: widgets,
        )
      ],
    );
  }
}
