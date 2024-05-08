import 'dart:convert';

import 'package:flareline/components/loading/loading.dart';
import 'package:flareline/components/tags/tag_widget.dart';
import 'package:flareline/entity/table_data_entity.dart';
import 'package:flareline/provider/theme_provider.dart';
import 'package:flutter/material.dart';

import 'package:flareline/components/card/common_card.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TableWidget extends StatelessWidget {
  TableWidget({super.key});

  String? title(BuildContext context) {
    return '';
  }

  Future<TableDataEntity> loadData(BuildContext context) {
    return Future(() => TableDataEntity());
  }

  @override
  Widget build(BuildContext context) {
    String? titleText = title(context);
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
          Expanded(child: _buildWidget(context)),
        ],
      ),
    ));
  }

  _buildWidget(BuildContext context) {
    return FutureBuilder<TableDataEntity>(
        future: loadData(context),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.data == null) {
            return const LoadingWidget();
          }

          List<String> headers = snapshot.data?.headers ?? [];

          List<List<TableDataRowsTableDataRows>> rows =
              snapshot.data?.rows ?? [];
          return ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: DataTable(
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
                  columns:
                      headers.map((e) => DataColumn(label: Text(e))).toList(),
                  rows: rows
                      .map((e) => DataRow(
                            onSelectChanged: (selected) {},
                            cells: e
                                .map((item) => DataCell(
                                      cellWidget(item),
                                    ))
                                .toList(),
                          ))
                      .toList()));
        }));
  }

  Widget cellWidget(TableDataRowsTableDataRows columnData) {
    if (columnData.dataType == 'tag') {
      return TagWidget(
        text: columnData.text ?? '',
        tagType: TagType.getTagType(columnData.tagType),
      );
    }
    return Text(columnData.text ?? '');
  }
}
