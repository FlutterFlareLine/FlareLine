import 'dart:convert';

import 'package:flareline_uikit/components/tables/table_widget.dart';
import 'package:flareline_uikit/entity/table_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    String res = await rootBundle.loadString('assets/api/channelTable.json');

    Map<String, dynamic> map = json.decode(res);
    TableDataEntity tableDataEntity = TableDataEntity.fromJson(map);
    this.tableDataEntity = tableDataEntity;
  }
}
