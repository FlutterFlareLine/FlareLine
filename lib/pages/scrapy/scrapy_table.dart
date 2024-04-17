import 'dart:convert';

import 'package:flareline/components/tables/table_widget.dart';
import 'package:flareline/entity/table_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScrapyTable extends TableWidget{
  @override
  String breakTabTitle(BuildContext context) {
    return 'Scrapy';
  }

  @override
  Future<TableDataEntity> loadData() async {
    String res = await rootBundle.loadString('assets/api/channelTable.json');

    Map<String, dynamic> map = json.decode(res);
    TableDataEntity tableDataEntity = TableDataEntity.fromJson(map);

    return tableDataEntity;
  }
}