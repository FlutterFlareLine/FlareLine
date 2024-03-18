import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TopProductsWidget extends StatelessWidget {
  const TopProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Top Products',
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(child: ChangeNotifierProvider(
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
            return Text('loading');
          }

          return ConstrainedBox(
              constraints: const BoxConstraints(minWidth: double.infinity),
              child: DataTable(
                  headingRowColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.green),
                  horizontalMargin: 12.w,
                  showBottomBorder: true,
                  showCheckboxColumn: false,
                  headingTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  columns: [
                    DataColumn(label: Text('Product Name')),
                    DataColumn(
                      label: const Text('Category'),
                    ),
                    DataColumn(
                      label: const Text('Price'),
                    ),
                    const DataColumn(label: Text('Sold')),
                    const DataColumn(label: Text('Profit')),
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
      Channel('Google', '3.5K', r'$5,768', '590', '4.8%'),
      Channel('Google', '3.5K', r'$5,768', '590', '4.8%'),
    ];
  }

  Future<List<Channel>> loadData() async {
    await Future.delayed(Duration(seconds: 2));
    channels = getEmployeeData();
    return channels;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
