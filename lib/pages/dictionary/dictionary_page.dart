import 'dart:convert';

import 'package:flareline/components/buttons/button_widget.dart';
import 'package:flareline/components/forms/outborder_text_form_field.dart';
import 'package:flareline/components/forms/switch_widget.dart';
import 'package:flareline/components/modal/modal_dialog.dart';
import 'package:flareline/components/tables/table_widget.dart';
import 'package:flareline/core/theme/global_colors.dart';
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
  // TODO: implement isContentScroll
  bool get isContentScroll => false;

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'Dictionary';
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return DictionaryTableWidget();
  }
}

class DictionaryTableWidget extends TableWidget<DictionaryViewModel> {

  @override
  Widget? toolsWidget(BuildContext context, DictionaryViewModel viewModel) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Spacer(),
          SizedBox(
            width: 120,
            child: DictionaryEditPage(
              btnText: 'Add',
              title: 'Add Dictionary',
            ),
          ),
          SizedBox(width: 20,),
          SizedBox(
            width: 120,
            child: ButtonWidget(
              btnText: 'Refresh',
              onTap: () {
                viewModel.loadData(context);
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget cellWidget(
      BuildContext context,DictionaryViewModel viewModel, TableDataRowsTableDataRows columnData) {
    if (CellDataType.TOGGLE.type == columnData.dataType) {
      return SwitchWidget(
        checked: '1' == columnData.text,
        onChanged: (checked) async {
          final query = await context
              .read<FirebaseStoreProvider>()
              .db
              .collection('dictionary')
              .where('id', isEqualTo: columnData.id)
              .get();
          if (query.docs.isNotEmpty) {
            String docId = query.docs.elementAt(0).id;
            final doc = await context
                .read<FirebaseStoreProvider>()
                .db
                .collection('dictionary')
                .doc(docId);
            doc.update({"status": checked ? 1 : 0}).then(
                (value) => print("status successfully updated!"),
                onError: (e) => print("Error updating document $e"));
          }
        },
      );
    } else if (CellDataType.CUSTOM.type == columnData.dataType) {
      return Row(
        children: [
          SizedBox(
            width: 60,
            child: DictionaryEditPage(
              btnText: 'Edit',
              title: 'Edit Dictionary',
              params: {'id': columnData.id},
            ),
          )
        ],
      );
    }
    return super.cellWidget(context,viewModel,  columnData);
  }

  @override
  DictionaryViewModel viewModelBuilder(BuildContext context) {
    return DictionaryViewModel(context);
  }
}

class DictionaryViewModel extends BaseTableProvider{
  @override
  String get TAG => 'DictionaryViewModel';

  DictionaryViewModel(super.context);

  @override
  loadData(BuildContext context) async {
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
        row.add(
            getItemValue('status', item, dataType: CellDataType.TOGGLE.type));

        row.add(getItemValue('', item, dataType: CellDataType.CUSTOM.type));
        return row;
      }).toList();

      rows.addAll(list);
    }

    Map<String, dynamic> map = {'headers': headers, 'rows': rows};
    TableDataEntity data = TableDataEntity.fromJson(map);
    this.tableDataEntity = data;
  }

  Map<String, dynamic> getItemValue(String key, Map item, {String? dataType}) {
    dynamic value = item[key];
    String text = value != null ? (value.toString()) : '';
    if (text.length > 50) {
      text = '${text.substring(0, 50)}...';
    }
    Map<String, dynamic> column = {
      'text': text,
      'key': key,
      'dataType': dataType,
      'id': item['id'],
    };
    return column;
  }

}
