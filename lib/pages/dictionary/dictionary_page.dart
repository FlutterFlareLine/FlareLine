import 'dart:convert';

import 'package:flareline/components/buttons/button_widget.dart';
import 'package:flareline/components/forms/outborder_text_form_field.dart';
import 'package:flareline/components/modal/modal_dialog.dart';
import 'package:flareline/components/tables/table_widget.dart';
import 'package:flareline/entity/table_data_entity.dart';
import 'package:flareline/pages/dictionary/dictionary_edit_page.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/provider/base_provider.dart';
import 'package:flareline/provider/firebase_store_provider.dart';
import 'package:flareline/provider/store_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class DictionaryPage extends LayoutWidget {
  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'Dictionary';
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: Row(
            children: [
              Spacer(),
              SizedBox(
                width: 120,
                child: DictionaryEditPage(),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          child: DictionaryTableWidget(),
          height: 600,
        )
      ],
    );
  }
}

class DictionaryTableWidget extends TableWidget {
  DictionaryTableWidget({super.key});

  @override
  Future<TableDataEntity> loadData(BuildContext context) async {
    const headers = [
      "configKey",
      "text",
      "configValue",
      "orderNum",
      "status",
      "Edit"
    ];

    List rows = [];

    String email = context.read<StoreProvider>().email;
    final query = await context
        .read<FirebaseStoreProvider>()
        .db
        .collection('dictionary')
        .where('belongUid', isEqualTo: email)
        .get();
    if (query.docs.isNotEmpty) {
      List list = query.docs.map((element) {
        Map<String, dynamic> item = element.data();

        List<Map<String, dynamic>> row = [];

        row.add(getItemValue('configKey', item));
        row.add(getItemValue('text', item));
        row.add(getItemValue('configValue', item));
        row.add(getItemValue('orderNum', item));
        row.add(getItemValue('status', item));

        row.add({'text': 'edit'});
        return row;
      }).toList();

      rows.addAll(list);
    }

    print(rows);
    Map<String, dynamic> map = {'headers': headers, 'rows': rows};
    TableDataEntity tableDataEntity = TableDataEntity.fromJson(map);

    return tableDataEntity;
  }

  Map<String, dynamic> getItemValue(String key, Map item) {
    dynamic value = item[key];
    String text = value != null ? (value.toString()) : '';
    if (text.length > 50) {
      text = '${text.substring(0, 50)}...';
    }
    Map<String, dynamic> column = {'text': text, 'key': key};
    return column;
  }
}

class DictionaryProvider extends BaseProvider {
  DictionaryProvider(super.context);

  List<Map<String, dynamic>> list = [];

  @override
  void onViewCreated(BuildContext context) {
    // TODO: implement init
  }

  query(BuildContext context) async {
    String email = context.read<StoreProvider>().email;
    final query = await context
        .read<FirebaseStoreProvider>()
        .db
        .collection('dictionary')
        .where('belongUid', isEqualTo: email)
        .get();
    if (query.docs.isNotEmpty) {
      list.clear();
      List<Map<String, dynamic>> data = query.docs.map((element) {
        return element.data();
      }).toList();
      list.addAll(data);
      notifyListeners();
    }
  }
}
