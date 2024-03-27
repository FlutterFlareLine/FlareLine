import 'package:flutter/material.dart';

import 'package:free_flutter_admin_dashboard/components/card/white_card.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TopChannelWidget extends StatelessWidget {
  const TopChannelWidget({super.key});

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
              child: ChangeNotifierProvider(
            create: (context) => _DataProvider(),
            builder: (ctx, child) => _buildWidget(ctx),
          )),
        ],
      ),
    ));
  }

  _buildWidget(BuildContext context) {
    return FutureBuilder<List<Channel>>(
        future: context.read<_DataProvider>().loadData(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.data == null) {
            return Text(AppLocalizations.of(context)!.loading);
          }

          return ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: DataTable(
                  headingRowColor: MaterialStateProperty.resolveWith(
                      (states) => HexColor('F7F9FC')),
                  horizontalMargin: 12,
                  showBottomBorder: true,
                  showCheckboxColumn: false,
                  headingTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  columns: [
                    DataColumn(
                        label: Text(AppLocalizations.of(context)!.source)),
                    DataColumn(
                      label: Text(AppLocalizations.of(context)!.visitors),
                    ),
                    DataColumn(
                      label: Text(AppLocalizations.of(context)!.revenues),
                    ),
                    DataColumn(
                        label: Text(AppLocalizations.of(context)!.sales)),
                    DataColumn(
                        label:
                            Text(AppLocalizations.of(context)!.conversation)),
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
                                Text(e.revenues),
                              ),
                              DataCell(
                                Text(e.sales),
                              ),
                              DataCell(
                                Text(e.conversations),
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
  Channel(this.source, this.visitors, this.revenues, this.sales,
      this.conversations);

  /// Id of an employee.
  final String source;

  /// Name of an employee.
  final String visitors;

  /// Designation of an employee.
  final String revenues;

  /// Salary of an employee.
  final String sales;

  final String conversations;
}

class _DataProvider extends ChangeNotifier {
  List<Channel> channels = <Channel>[];

  List<Channel> getEmployeeData() {
    return [
      Channel('Google', '3.5K', r'$5,768', '590', '4.8%'),
      Channel('Google', '3.5K', r'$5,768', '590', '4.8%'),
      Channel('Google', '3.5K', r'$5,768', '590', '4.8%'),
      Channel('Google', '3.5K', r'$5,768', '590', '4.8%'),
      Channel('Google', '3.5K', r'$5,768', '590', '4.8%'),
      Channel('Google', '3.5K', r'$5,768', '590', '4.8%'),
    ];
  }

  Future<List<Channel>> loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    channels = getEmployeeData();
    return channels;
  }
}
