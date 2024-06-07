import 'package:flareline/flutter_gen/app_localizations.dart';
import 'package:flareline_uikit/components/loading/loading.dart';
import 'package:flutter/material.dart';

import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:provider/provider.dart';

class InvoiceTableWidget extends StatelessWidget {
  const InvoiceTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonCard(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: ChangeNotifierProvider(
        create: (context) => _DataProvider(),
        builder: (ctx, child) => _buildWidget(ctx),
      ),
    ));
  }

  _buildWidget(BuildContext context) {
    return FutureBuilder<List<Channel>>(
        future: context.read<_DataProvider>().loadData(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.data == null) {
            return LoadingWidget();
          }

          return ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: DataTable(
                  headingRowColor: MaterialStateProperty.resolveWith(
                      (states) => GlobalColors.lightGray),
                  horizontalMargin: 12,
                  showBottomBorder: true,
                  showCheckboxColumn: false,
                  headingTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  dividerThickness: 0.5,
                  columns: [
                    DataColumn(
                        label: Text(AppLocalizations.of(context)!.package)),
                    DataColumn(
                      label: Text(AppLocalizations.of(context)!.invoiceDate),
                    ),
                    DataColumn(
                      label: Text(AppLocalizations.of(context)!.status),
                    ),
                    DataColumn(
                        label: Text(AppLocalizations.of(context)!.actions)),
                  ],
                  rows: context
                      .watch<_DataProvider>()
                      .channels
                      .map((e) => DataRow(
                            onSelectChanged: (selected) {},
                            cells: [
                              DataCell(
                                Text(e.source),
                              ),
                              DataCell(
                                Text('${e.visitors}'),
                              ),
                              DataCell(
                                Container(
                                  child: Text(
                                    e.revenues,
                                    style: TextStyle(
                                        color: e.revenues == 'Unpaid'
                                            ? Colors.red
                                            : e.revenues == 'Peding'
                                                ? Colors.orange
                                                : Colors.green,
                                        fontSize: 13),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(45),
                                      color: e.revenues == 'Unpaid'
                                          ? Colors.red.shade50
                                          : e.revenues == 'Peding'
                                              ? Colors.orange.shade50
                                              : Colors.green.shade50),
                                ),
                              ),
                              DataCell(
                                Text(e.sales),
                              ),
                            ],
                          ))
                      .toList()));
        }));
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Channel {
  /// Creates the employee class with required details.
  Channel(
    this.source,
    this.visitors,
    this.revenues,
    this.sales,
  );

  /// Id of an employee.
  final String source;

  /// Name of an employee.
  final String visitors;

  /// Designation of an employee.
  final String revenues;

  /// Salary of an employee.
  final String sales;
}

class _DataProvider extends ChangeNotifier {
  List<Channel> channels = <Channel>[];

  List<Channel> getEmployeeData() {
    return [
      Channel('Google', '3.5K', 'Paid', r'$5,768'),
      Channel('Google', '3.5K', 'Paid', r'$5,768'),
      Channel('Google', '3.5K', 'Unpaid', r'$5,768'),
      Channel('Google', '3.5K', 'Peding', r'$5,768'),
    ];
  }

  Future<List<Channel>> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    channels = getEmployeeData();
    return channels;
  }
}
