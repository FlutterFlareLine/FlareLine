import 'dart:convert';

import 'package:flareline/flutter_gen/app_localizations.dart';
import 'package:flareline_uikit/components/tables/table_widget.dart';
import 'package:flareline_uikit/entity/table_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TopChannelWidget extends TableWidget {
  @override
  // TODO: implement showPaging
  bool get showPaging => false;

  @override
  String title(BuildContext context) {
    // TODO: implement title
    return AppLocalizations.of(context)!.topChannels;
  }

  @override
  BaseTableProvider viewModelBuilder(BuildContext context) {
    return TopChannelViewModel(context);
  }
}

class TopChannelViewModel extends BaseTableProvider {
  TopChannelViewModel(super.context);

  @override
  loadData(BuildContext context) async {
    // String res = await rootBundle.loadString('assets/api/channelTable.json');

    Map<String, dynamic> map = {
      "headers": ["SOURCE", "VISITORS", "REVENUES", "SALES", "CONVERSATION"],
      "rows": [
        [
          {"text": "Google"},
          {"text": "3.5K"},
          {"text": r"$5,768", "dataType": "tag", "tagType": "success"},
          {"text": "590"},
          {"text": "4.8%", "dataType": "tag", "tagType": "secondary"}
        ],
        [
          {"text": "Google"},
          {"text": "3.5K"},
          {"text": r"$5,768", "dataType": "tag", "tagType": "success"},
          {"text": "590"},
          {"text": "4.8%", "dataType": "tag", "tagType": "secondary"}
        ],
        [
          {"text": "Google"},
          {"text": "3.5K"},
          {"text": r"$5,768", "dataType": "tag", "tagType": "success"},
          {"text": "590"},
          {"text": "4.8%", "dataType": "tag", "tagType": "secondary"}
        ],
        [
          {"text": "Google"},
          {"text": "3.5K"},
          {"text": r"$5,768", "dataType": "tag", "tagType": "success"},
          {"text": "590"},
          {"text": "4.8%", "dataType": "tag", "tagType": "secondary"}
        ],
        [
          {"text": "Google"},
          {"text": "3.5K"},
          {"text": r"$5,768", "dataType": "tag", "tagType": "success"},
          {"text": "590"},
          {"text": "4.8%", "dataType": "tag", "tagType": "secondary"}
        ]
      ]
    };
    TableDataEntity tableDataEntity = TableDataEntity.fromJson(map);
    this.tableDataEntity = tableDataEntity;
  }
}
