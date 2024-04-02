import 'package:flareline/components/loading/loading.dart';
import 'package:flareline/components/tags/tag_widget.dart';
import 'package:flutter/material.dart';

import 'package:flareline/components/card/white_card.dart';
import 'package:flareline/themes/global_colors.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TableWidget<P extends TableWidgetProvider> extends StatelessWidget {
  TableWidget({super.key});

  late P p;

  List<String> get headersText => [];

  dynamic viewModel() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    p = viewModel();

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
              child: ChangeNotifierProvider<P>(
            create: (context) => p,
            builder: (ctx, child) => _buildWidget(ctx, p),
          )),
        ],
      ),
    ));
  }

  _buildWidget(BuildContext context, P p) {
    return FutureBuilder<List<List<ColumnData>>>(
        future: p.loadData(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.data == null) {
            return const LoadingWidget();
          }

          List<List<ColumnData>> list = snapshot.data ?? [];
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
                  columns: headersText
                      .map((e) => DataColumn(label: Text(e)))
                      .toList(),
                  rows: list
                      .map((e) => DataRow(
                            onSelectChanged: (selected) {},
                            cells: e
                                .map((item) => DataCell(
                                      item.customCellWidget != null
                                          ? item.customCellWidget!
                                          : Text(item.text ?? ''),
                                    ))
                                .toList(),
                          ))
                      .toList()));
        }));
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class ColumnData {
  String? text;

  Widget? customCellWidget;

  ColumnData({this.text, this.customCellWidget});
}

abstract class TableWidgetProvider<T extends ColumnData>
    extends ChangeNotifier {
  Future<List<List<ColumnData>>> loadData() {
    return Future(() => []);
  }
}
