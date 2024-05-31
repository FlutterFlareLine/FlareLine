import 'package:flareline/components/card/card_data_widget.dart';
import 'package:flareline/components/tables/TopChannel.dart';
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
          height: 600,
          child: Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  _topToolsWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Expanded(
                      child: TitleCard(
                    title: 'Sales Figures',
                    childWidget: SizedBox.shrink(),
                  ))
                ],
              )),
              const SizedBox(
                width: 20,
              ),
              const SizedBox(
                  width: 300,
                  child: TitleCard(
                    title: 'Sorce Of Purchases',
                    childWidget: SizedBox.shrink(),
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

  Widget _topToolsWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children:[
        Row(
          children: [
            Expanded(child: CardDataWidget()),
            SizedBox(
              width: 20,
            ),
            Expanded(child: CardDataWidget()),
            SizedBox(
              width: 20,
            ),
            Expanded(child: CardDataWidget()),
          ],
        )
      ] ,
    );
  }
}
