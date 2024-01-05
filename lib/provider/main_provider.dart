import 'package:flutter/material.dart';
import 'package:free_flutter_admin_dashboard/routes.dart';

class MainProvider with ChangeNotifier {
  String _selectedPath = '/dashboard';

  String get selectedPath => _selectedPath;

  int _index = 0;

  int get index => _index;

  void setSelectedPath(String path) {
    _selectedPath = path;

    notifyListeners();
  }

  bool isSelectedPath(String path) {
    return _selectedPath == path;
  }

  Widget getSelectedPage(String path) {
    dynamic map = MAIN_PAGES
        .where((element) => element['routerPath'] == path)
        .firstOrNull;
    if (map == null) {
      return Container(
        child: Text('404'),
      );
    }
    return map['widget'];
  }

  Widget getIndexPage(int page) {
    return Container();
  }
}
