import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MapChartWidget extends StatelessWidget {
  MapChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return _maps(context);
  }

  _maps(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                'Region labels',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
              child: ChangeNotifierProvider(
            create: (context) => _DataProvider(),
            builder: (ctx, child) => SfMaps(
              layers: [
                MapShapeLayer(source: ctx.watch<_DataProvider>().dataSource),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class _DataProvider extends ChangeNotifier {
  late MapShapeSource _dataSource;

  MapShapeSource get dataSource => _dataSource;

  _DataProvider() {
    init();
  }

  void init() {
    _dataSource = const MapShapeSource.asset(
      'assets/australia.json',
      shapeDataField: 'STATE_NAME',
    );
    notifyListeners();
  }
}
