import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MapChartWidget extends StatelessWidget {
  const MapChartWidget({super.key});

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
            builder: (ctx, child) {
              List<Model> data = ctx.watch<_DataProvider>().data;
              return SfMaps(
                layers: [
                  MapShapeLayer(
                    source: MapShapeSource.asset(
                      'assets/australia.json',
                      shapeDataField: 'STATE_NAME',
                      dataCount: data.length,
                      primaryValueMapper: (int index) => data[index].state,
                      dataLabelMapper: (int index) => data[index].stateCode,
                      shapeColorValueMapper: (int index) => data[index].color,
                    ),
                    showDataLabels: true,
                    legend: const MapLegend(MapElement.shape, position: MapLegendPosition.right),
                    shapeTooltipBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(7),
                        child: Text(data[index].stateCode),
                      );
                    },
                    tooltipSettings: MapTooltipSettings(
                        color: Colors.grey[700],
                        strokeColor: Colors.white,
                        strokeWidth: 2),
                    strokeColor: Colors.white,
                    strokeWidth: 0.5,
                    dataLabelSettings: const MapDataLabelSettings(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              );
            },
          ))
        ],
      ),
    );
  }
}

class Model {
  Model(this.state, this.color, this.stateCode);

  String state;
  Color color;
  String stateCode;
}

class _DataProvider extends ChangeNotifier {
  late List<Model> _data;

  List<Model> get data => _data;

  _DataProvider() {
    init();
  }

  void init() {
    _data = <Model>[
      Model('New South Wales', Color.fromRGBO(255, 215, 0, 1.0),
          '       New\nSouth Wales'),
      Model('Queensland', Color.fromRGBO(72, 209, 204, 1.0), 'Queensland'),
      Model('Northern Territory', Colors.red.withOpacity(0.85),
          'Northern\nTerritory'),
      Model('Victoria', Color.fromRGBO(171, 56, 224, 0.75), 'Victoria'),
      Model('South Australia', Color.fromRGBO(126, 247, 74, 0.75),
          'South Australia'),
      Model('Western Australia', Color.fromRGBO(79, 60, 201, 0.7),
          'Western Australia'),
      Model('Tasmania', Color.fromRGBO(99, 164, 230, 1), 'Tasmania'),
      Model('Australian Capital Territory', Colors.teal, 'ACT')
    ];

    notifyListeners();
  }
}
