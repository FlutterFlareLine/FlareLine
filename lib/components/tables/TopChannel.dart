import 'dart:convert';

import 'package:flareline/components/tables/table_widget.dart';
import 'package:flareline/components/tags/tag_widget.dart';
import 'package:flareline/entity/table_data_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TopChannelWidget extends TableWidget {
  TopChannelWidget({super.key});

  @override
  Widget cellWidget(TableDataRowsTableDataRows columnData) {
    if (columnData.dataType == 'tag') {
      return TagWidget(
        text: columnData.text ?? '',
        tagType: TagType.getTagType(columnData.tagType),
      );
    }
    return super.cellWidget(columnData);
  }

  @override
  Future<TableDataEntity> loadData() async {
    String res = await rootBundle.loadString('api/channelTable.json');

    Map<String, dynamic> map = json.decode(res);
    TableDataEntity tableDataEntity = TableDataEntity.fromJson(map);

    return tableDataEntity;
  }
}
