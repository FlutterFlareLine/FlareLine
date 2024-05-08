import 'dart:convert';

import 'package:flareline/components/tables/table_widget.dart';
import 'package:flareline/entity/table_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopChannelWidget extends TableWidget {
  TopChannelWidget({super.key});

  @override
  String title(BuildContext context) {
    // TODO: implement title
    return AppLocalizations.of(context)!.topChannels;
  }

  @override
  Future<TableDataEntity> loadData(BuildContext context) async {
    String res = await rootBundle.loadString('assets/api/channelTable.json');

    Map<String, dynamic> map = json.decode(res);
    TableDataEntity tableDataEntity = TableDataEntity.fromJson(map);

    return tableDataEntity;
  }
}
