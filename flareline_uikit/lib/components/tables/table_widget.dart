library flareline_uikit;

import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline_uikit/components/forms/switch_widget.dart';
import 'package:flareline_uikit/components/loading/loading.dart';
import 'package:flareline_uikit/components/tags/tag_widget.dart';
import 'package:flareline_uikit/core/event/global_event.dart';
import 'package:flareline_uikit/entity/table_data_entity.dart';
import 'package:flareline_uikit/service/base_provider.dart';
import 'package:flareline_uikit/widget/base/base_stless_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

enum CellDataType {
  TEXT('text'),
  TOGGLE('toggle'),
  TAG('tag'),
  IMAGE('image'),
  CUSTOM('custom'),
  ACTION('action'),
  ;

  const CellDataType(this.type);

  final String type;
}

abstract class TableWidget<S extends BaseTableProvider>
    extends BaseStlessWidget<S> {
  TableWidget({super.params, super.key});

  /// title
  String? title(BuildContext context) {
    return '';
  }

  ///tools widget
  Widget? toolsWidget(BuildContext context, S viewModel) {
    return null;
  }

  ///action column width
  double get actionColumnWidth => 200;

  //per pageSize
  int get pageSize => 10;

  //paging
  bool get showPaging => true;

  ///actions widget
  Widget? actionWidgetsBuilder(BuildContext context,
      TableDataRowsTableDataRows columnData, S viewModel) {
    return null;
  }

  ///toggle changed event
  onToggleChanged(BuildContext context, bool checked,
      TableDataRowsTableDataRows columnData) {}

  _buildWidget(BuildContext context, S viewModel) {
    bool isLoading = viewModel.isLoading;
    TableDataEntity? tableDataEntity = viewModel.tableDataEntity;
    List<String> headers = tableDataEntity?.headers ?? [];
    if (isLoading || tableDataEntity == null || headers.isEmpty) {
      return const LoadingWidget();
    }

    List<List<TableDataRowsTableDataRows>> rows = tableDataEntity?.rows ?? [];
    return ConstrainedBox(
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: _sfDataGrid(context, headers, rows, viewModel));
  }

  BaseDataGridSource baseDataGridSource(
      BuildContext context,
      List<List<TableDataRowsTableDataRows>> rows,
      viewModel,
      Widget? Function(
              BuildContext context, TableDataRowsTableDataRows columnData)
          actionWidgetsBuilder,
      Function(BuildContext context, bool checked,
              TableDataRowsTableDataRows columnData)
          onToggleChanged) {
    return BaseDataGridSource(context, rows, viewModel, actionWidgetsBuilder,
        onToggleChanged, pageSize);
  }

  bool get isLastColumnFixed => false;

  ColumnWidthMode get columnWidthMode => ColumnWidthMode.fill;

  Widget _sfDataGrid(BuildContext context, List<String> headers,
      List<List<TableDataRowsTableDataRows>> rows, viewModel) {
    BaseDataGridSource dataGridSource = baseDataGridSource(
      context,
      rows,
      viewModel,
      (BuildContext context, TableDataRowsTableDataRows columnData) {
        return actionWidgetsBuilder(context, columnData, viewModel);
      },
      (BuildContext context, bool checked,
          TableDataRowsTableDataRows columnData) {
        onToggleChanged(context, checked, columnData);
      },
    );
    int pageCount = rows.length % pageSize == 0
        ? (rows.length / pageSize).toInt()
        : (rows.length / pageSize).toInt() + 1;

    return Column(
      children: [
        Expanded(
            child: SfDataGrid(
          source: dataGridSource,
          footerFrozenColumnsCount: isLastColumnFixed ? 1 : 0,
          isScrollbarAlwaysShown: true,
          columnWidthMode: columnWidthMode,
          columns: headers.map((e) => gridColumnWidget(e)).toList(),
        )),
        if (showPaging && rows.isNotEmpty)
          Container(
              height: 60,
              child: SfDataPager(
                delegate: dataGridSource,
                pageCount: pageCount.toDouble(),
                direction: Axis.horizontal,
              ))
      ],
    );
  }

  double gridColumnWidgetWidth(String e) {
    if (e == 'Action') {
      return actionColumnWidth;
    }
    return double.nan;
  }

  GridColumn gridColumnWidget(String e) {
    return GridColumn(
      width: gridColumnWidgetWidth(e),
      columnName: e,
      label: Text(e),
    );
  }

  Widget cellWidget(BuildContext context, S viewModel,
      TableDataRowsTableDataRows columnData) {
    if (columnData.dataType == CellDataType.TAG.type) {
      return TagWidget(
        text: columnData.text ?? '',
        tagType: TagType.getTagType(columnData.tagType),
      );
    }
    String text = columnData.text ?? '';
    if (text.length > 50) {
      text = '${text.substring(0, 50)}...';
    }
    return Text(text);
  }

  @override
  Widget bodyWidget(BuildContext context, S viewModel, Widget? child) {
    String? titleText = title(context);
    Widget? tools = toolsWidget(context, viewModel);
    return CommonCard(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (titleText != null)
            Text(
              titleText,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          if (titleText != null)
            const SizedBox(
              height: 16,
            ),
          if (tools != null)
            Container(
              child: tools,
              margin: EdgeInsets.only(bottom: 16),
            ),
          Expanded(child: _buildWidget(context, viewModel)),
        ],
      ),
    ));
  }

  refresh(BuildContext context) {}
}

class BaseDataGridSource<F extends BaseTableProvider> extends DataGridSource {
  late BuildContext context;
  final Widget? Function(
          BuildContext context, TableDataRowsTableDataRows columnData)
      actionWidgetsBuilder;
  final Function(BuildContext context, bool checked,
      TableDataRowsTableDataRows columnData) onToggleChanged;

  late int pageSize;

  late List<List<TableDataRowsTableDataRows>> list;

  BaseDataGridSource(this.context, this.list, F viewModel,
      this.actionWidgetsBuilder, this.onToggleChanged, this.pageSize) {
    _loadPageData(0, pageSize);
  }

  void _loadPageData(int startIndex, int endIndex) {
    if (endIndex >= list.length) {
      endIndex = list.length;
    }
    if (list != null && list.isNotEmpty) {
      _data = list
          .getRange(startIndex, endIndex)
          .toList(growable: false)
          .map<DataGridRow>((e) => DataGridRow(
              cells: e
                  .map<DataGridCell>((item) =>
                      DataGridCell<TableDataRowsTableDataRows>(
                          columnName: item.columnName ?? '', value: item))
                  .toList()))
          .toList();
    } else {
      _data = [];
    }
  }

  List<DataGridRow> _data = [];

  @override
  List<DataGridRow> get rows => _data;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return cellWidget(dataGridCell.value);
    }).toList());
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startIndex = newPageIndex * pageSize;
    int endIndex = startIndex + pageSize;

    if (startIndex < list.length) {
      _loadPageData(startIndex, endIndex);
      notifyListeners();
    } else {
      _data = [];
    }
    return true;
  }

  Widget cellWidget(TableDataRowsTableDataRows columnData) {
    if (CellDataType.TOGGLE.type == columnData.dataType) {
      return SwitchWidget(
          checked: '1' == columnData.text,
          onChanged: (checked) async {
            if (onToggleChanged != null) {
              onToggleChanged(context, checked, columnData);
            }
          });
    }

    if (CellDataType.ACTION.type == columnData.dataType) {
      return actionWidgetsBuilder(context, columnData)!;
    }

    if (CellDataType.IMAGE.type == columnData.dataType) {
      return _imageCellWidget(columnData);
    }

    if (CellDataType.TAG.type == columnData.dataType) {
      return TagWidget(
        text: columnData.text ?? '',
        tagType: TagType.getTagType(columnData.tagType),
      );
    }
    String text = columnData.text ?? '';
    if (text.length > 50) {
      text = '${text.substring(0, 50)}...';
    }
    return Text(text);
  }

  Widget _imageCellWidget(TableDataRowsTableDataRows columnData) {
    return SizedBox(
      width: 40,
      height: 40,
      child: (columnData.text != null && columnData.text != ''
          ? Image.network(
              columnData.text!,
              fit: BoxFit.contain,
              errorBuilder: (context, exception, stacktrace) {
                return Text(stacktrace.toString());
              },
            )
          : SizedBox.shrink()),
    );
  }
}

abstract class BaseTableProvider extends BaseProvider {
  BaseTableProvider(super.context);

  TableDataEntity? _tableDataEntity;

  TableDataEntity? get tableDataEntity => _tableDataEntity;

  bool isLoading = false;

  String get TAG => this.runtimeType.toString();

  set tableDataEntity(TableDataEntity? tableDataEntity) {
    this._tableDataEntity = tableDataEntity;
    notifyListeners();
  }

  @override
  // TODO: implement isRegisterEventBus
  bool get isRegisterEventBus => true;

  @override
  void init(BuildContext context) {
    super.init(context);
  }

  @override
  void onViewCreated(BuildContext context) {
    loadData(context);
    super.onViewCreated(context);
  }

  @override
  void handleEventBus(BuildContext context, EventInfo eventInfo) {
    super.handleEventBus(context, eventInfo);
    if ('refresh_$TAG' == eventInfo.eventType) {
      loadData(context);
    }
  }

  Future loadData(BuildContext context);

  Map<String, dynamic> getItemValue(String key, Map item, {String? dataType}) {
    dynamic value = item[key];
    String text = value != null ? (value.toString()) : '';

    Map<String, dynamic> column = {
      'text': text,
      'key': key,
      'dataType': dataType,
      'columnName': key,
      'id': item['id'],
    };
    return column;
  }
}
