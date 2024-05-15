import 'dart:convert';

import 'package:flareline/components/loading/loading.dart';
import 'package:flareline/components/tags/tag_widget.dart';
import 'package:flareline/core/event/global_event.dart';
import 'package:flareline/entity/table_data_entity.dart';
import 'package:flareline/pages/base/base_stless_widget.dart';
import 'package:flareline/provider/base_provider.dart';
import 'package:flareline/provider/theme_provider.dart';
import 'package:flutter/material.dart';

import 'package:flareline/components/card/common_card.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

enum CellDataType {
  TEXT('text'),
  TOGGLE('toggle'),
  TAG('tag'),
  IMAGE('image'),
  CUSTOM('custom'),
  ;

  const CellDataType(this.type);

  final String type;
}

abstract class TableWidget<S extends BaseTableProvider,
    T extends BaseDataGridSource> extends BaseStlessWidget<S> {
  String? title(BuildContext context) {
    return '';
  }

  Widget? toolsWidget(BuildContext context, S viewModel) {
    return null;
  }

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
        child: _sfDataGrid(context, headers, rows, viewModel)
        // _dataTableWidget(context, headers, rows, viewModel)
        );
  }

  T baseDataGridSource(BuildContext context,
      List<List<TableDataRowsTableDataRows>> rows, viewModel);

  Widget _sfDataGrid(BuildContext context, List<String> headers,
      List<List<TableDataRowsTableDataRows>> rows, viewModel) {
    return SfDataGrid(
      source: baseDataGridSource(context, rows, viewModel),
      footerFrozenColumnsCount: 1,
      columnWidthMode: ColumnWidthMode.fill,
      columns: headers
          .map((e) => GridColumn(
              columnName: e,
              label: Text(e),))
          .toList(),
    );
  }

  Widget _dataTableWidget(BuildContext context, List<String> headers,
      List<List<TableDataRowsTableDataRows>> rows, viewModel) {
    return DataTable(
        headingRowColor: MaterialStateProperty.resolveWith((states) =>
            context.watch<ThemeProvider>().isDark
                ? GlobalColors.sideBar
                : GlobalColors.lightGray),
        horizontalMargin: 12,
        showBottomBorder: true,
        showCheckboxColumn: false,
        headingTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: context.watch<ThemeProvider>().isDark
              ? Colors.white
              : Colors.black,
        ),
        dividerThickness: 0.5,
        columns: headers.map((e) => DataColumn(label: Text(e))).toList(),
        rows: rows
            .map((e) => DataRow(
                  onSelectChanged: (selected) {},
                  cells: e
                      .map((item) => DataCell(
                            cellWidget(context, viewModel, item),
                          ))
                      .toList(),
                ))
            .toList());
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

abstract class BaseDataGridSource extends DataGridSource {
  late BuildContext context;

  BaseDataGridSource(BuildContext context,
      List<List<TableDataRowsTableDataRows>> list, dynamic viewModel) {
    this.context = context;
    _data = list
        .map<DataGridRow>((e) => DataGridRow(
            cells: e
                .map<DataGridCell>((item) =>
                    DataGridCell<TableDataRowsTableDataRows>(
                        columnName: item.columnName ?? '', value: item))
                .toList()))
        .toList();
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

  Widget cellWidget(TableDataRowsTableDataRows columnData) {
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
    loadData(context);
    super.init(context);
  }

  @override
  void handleEventBus(BuildContext context, EventInfo eventInfo) {
    super.handleEventBus(context, eventInfo);
    if ('refresh_$TAG' == eventInfo.eventType) {
      loadData(context);
    }
  }

  loadData(BuildContext context);
}
