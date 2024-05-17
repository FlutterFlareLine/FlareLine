import 'package:flareline_uikit/components/buttons/button_widget.dart';

import 'package:flareline_uikit/components/tables/table_widget.dart';
import 'package:flareline_uikit/entity/table_data_entity.dart';
import 'package:flareline/pages/dictionary/dictionary_child_page.dart';
import 'package:flareline/pages/dictionary/dictionary_edit_page.dart';
import 'package:flareline/pages/layout.dart';

import 'package:flareline/provider/store_provider.dart';
import 'package:flareline/utils/firebase_store_utils.dart';

import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DictionaryPage extends LayoutWidget {
  final Map<String, dynamic>? params;

  DictionaryPage({super.key, this.params});

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
    return DictionaryTableWidget(
      params: params,
    );
  }
}

class DictionaryTableWidget extends TableWidget<DictionaryViewModel> {
  DictionaryTableWidget({super.params, super.key});

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
              params: params,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 120,
            child: ButtonWidget(
              btnText: 'Refresh',
              type: ButtonType.success.type,
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
  DictionaryViewModel viewModelBuilder(BuildContext context) {
    return DictionaryViewModel(context);
  }

  @override
  // TODO: implement actionColumnWidth
  double get actionColumnWidth => 260;

  @override
  // TODO: implement isLastColumnFixed
  bool get isLastColumnFixed => true;

  @override
  // TODO: implement columnWidthMode
  ColumnWidthMode get columnWidthMode => ColumnWidthMode.none;

  @override
  Widget? actionWidgetsBuilder(BuildContext context,
      TableDataRowsTableDataRows columnData, DictionaryViewModel viewModel) {
    print('columnData ${columnData} ${columnData.id}');
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        SizedBox(
          width: 60,
          child: DictionaryEditPage(
            btnText: 'Edit',
            title: 'Edit Dictionary',
            params: {'id': columnData.id},
            key: UniqueKey(),
          ),
        ),
        if (viewModel.parentId == null || viewModel.parentId == '0')
          SizedBox(
            width: 80,
            child: DictionaryChildPage(
              btnText: 'Children',
              title: 'Children',
              params: {'parentId': columnData.id},
              key: UniqueKey(),
            ),
          ),
      ],
    );
  }

  @override
  onToggleChanged(BuildContext context, bool checked,
      TableDataRowsTableDataRows columnData) async {
    final query = await FirebaseStoreUtils.db
        .collection('dictionary')
        .where('id', isEqualTo: columnData.id)
        .get();
    if (query.docs.isNotEmpty) {
      String docId = query.docs.elementAt(0).id;
      final doc =
          await FirebaseStoreUtils.db.collection('dictionary').doc(docId);
      doc.update({"status": checked ? 1 : 0}).then(
          (value) => print("status successfully updated!"),
          onError: (e) => print("Error updating document $e"));
    }
  }
}

class DictionaryViewModel extends BaseTableProvider {
  @override
  String get TAG => 'DictionaryViewModel';

  DictionaryViewModel(super.context);

  String? parentId;

  @override
  void onViewCreated(BuildContext context) {
    print('param -> ${param}');
    if (param != null) {
      parentId = param!['parentId'];
    } else {
      parentId = '0';
    }
    super.onViewCreated(context);
  }

  @override
  Future loadData(BuildContext context) async {
    const headers = [
      "configKey",
      "text",
      "configValue",
      "image",
      "orderNum",
      "status",
      "Action"
    ];

    List rows = [];

    String email = context.read<StoreProvider>().email;

    final query = await FirebaseStoreUtils.db
        .collection('dictionary')
        // .where('belongUid', isEqualTo: email)
        .where('parentId', isEqualTo: parentId)
        .get();

    if (query.docs.isNotEmpty) {
      List list = query.docs.map((element) {
        Map<String, dynamic> item = element.data();

        List<Map<String, dynamic>> row = [];

        row.add(getItemValue('configKey', item));
        row.add(getItemValue('text', item));
        row.add(getItemValue('configValue', item));
        row.add(getItemValue('image', item, dataType: CellDataType.IMAGE.type));
        row.add(getItemValue('orderNum', item));
        row.add(
            getItemValue('status', item, dataType: CellDataType.TOGGLE.type));

        row.add(getItemValue('', item, dataType: CellDataType.ACTION.type));
        return row;
      }).toList();

      rows.addAll(list);
    }

    Map<String, dynamic> map = {'headers': headers, 'rows': rows};
    TableDataEntity data = TableDataEntity.fromJson(map);
    tableDataEntity = data;
  }
}
