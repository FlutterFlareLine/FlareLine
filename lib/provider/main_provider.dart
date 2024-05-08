import 'dart:html';

import 'package:flareline/provider/base_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flareline/routes.dart';
import 'package:get/utils.dart';

class MainProvider extends BaseProvider {
  String _selectedPath = '/';
  String _expandedMenuName = '';

  MainProvider(super.context);

  String get selectedPath => _selectedPath;

  String get expandedMenuName => _expandedMenuName;

  int _index = 0;

  int get index => _index;

  @override
  void onViewCreated(BuildContext context) {
    // TODO: implement init
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
    if (kIsWeb) {
      String href = window.location.href;
      var uri = Uri.dataFromString(href);
      String? routePath = uri.path;

      return routePath.endsWith(path);
    }
    if (RouteConfiguration.navigatorContext != null) {
      String? routePath =
          ModalRoute.of(RouteConfiguration.navigatorContext!)?.settings?.name;
      return routePath == path;
    }
    return false;
  }

  bool isExpanded(String menuName, List? childList) {
    return expandedMenuName == menuName;
  }

  Widget getIndexPage(int page) {
    return Container();
  }
}
