import 'dart:convert';

import 'package:flareline/components/tables/table_widget.dart';
import 'package:flareline/entity/table_data_entity.dart';
import 'package:flutter/services.dart';

class TopChannelWidget extends TableWidget {
  TopChannelWidget({super.key});


  @override
  Future<TableDataEntity> loadData() async {
    String res = await rootBundle.loadString('api/channelTable.json');

    Map<String, dynamic> map = json.decode(res);
    TableDataEntity tableDataEntity = TableDataEntity.fromJson(map);

    return tableDataEntity;
  }
}
