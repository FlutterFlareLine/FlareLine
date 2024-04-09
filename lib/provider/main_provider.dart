import 'package:flutter/material.dart';
import 'package:flareline/routes.dart';
import 'package:get/utils.dart';

class MainProvider with ChangeNotifier {
  String _selectedPath = '/';
  String _expandedMenuName = '';

  String get selectedPath => _selectedPath;

  String get expandedMenuName => _expandedMenuName;

  int _index = 0;

  int get index => _index;

  MainProvider() {
    if (RouteConfiguration.navigatorContext != null) {
      String? routePath =
          ModalRoute.of(RouteConfiguration.navigatorContext!)?.settings?.name;
      print('---------------> routerPath ${routePath}');
      setSelectedPath(routePath == null || routePath == '' ? '/' : routePath);
    }
  }

  void setSelectedPath(String path) {
    _selectedPath = path;

    notifyListeners();
  }

  void setExpandedMenuName(String expandedMenuName) {
    if (_expandedMenuName == expandedMenuName) {
      _expandedMenuName = '';
    } else {
      _expandedMenuName = expandedMenuName;
    }
    notifyListeners();
  }

  bool isSelectedPath(String path) {
    return selectedPath == path;
  }

  bool isExpanded(String menuName, List? childList) {
    return expandedMenuName == menuName;
  }

  Widget getIndexPage(int page) {
    return Container();
  }
}
