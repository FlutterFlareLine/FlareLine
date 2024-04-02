import 'dart:convert';

import 'package:flareline/components/loading/loading.dart';
import 'package:flareline/components/tags/tag_widget.dart';
import 'package:flareline/entity/table_data_entity.dart';
import 'package:flutter/material.dart';

import 'package:flareline/components/card/white_card.dart';
import 'package:flareline/themes/global_colors.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TableWidget extends StatelessWidget {
  TableWidget({super.key});



  Future<TableDataEntity> loadData() {
    return Future(() => TableDataEntity());
  }


  @override
  Widget build(BuildContext context) {

    return WhiteCard(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.topChannels,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
              child: _buildWidget(context)),
        ],
      ),
    ));
  }

  _buildWidget(BuildContext context) {
    return FutureBuilder<TableDataEntity>(
        future: loadData(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.data == null) {
            return const LoadingWidget();
          }

          List<String> headers = snapshot.data?.headers ?? [];

          List<List<TableDataRowsTableDataRows>> rows = snapshot.data?.rows ?? [];
          return ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: DataTable(
                  headingRowColor:
                      MaterialStateProperty.resolveWith((states) => lightGray),
                  horizontalMargin: 12,
                  showBottomBorder: true,
                  showCheckboxColumn: false,
                  headingTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
    return Text(columnData.text ?? '');
  }
}


