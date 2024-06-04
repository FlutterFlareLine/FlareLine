
import 'package:flareline_uikit/service/base_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:window_location_href/window_location_href.dart';

class SideBarProvider extends BaseProvider {
  String _selectedPath = '/';
  String _expandedMenuName = '';

  SideBarProvider(super.context);

  String get selectedPath => _selectedPath;

  String get expandedMenuName => _expandedMenuName;

  final int _index = 0;

  int get index => _index;

  @override
  void init(BuildContext context) {
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

  bool isSelectedPath(BuildContext context, String path) {
    if (kIsWeb) {
      String? location = href;
      if(location!=null) {
        var uri = Uri.dataFromString(location);
        String? routePath = uri.path;

        return routePath.endsWith(path);
      }
    }

    String? routePath = ModalRoute.of(context)?.settings?.name;
    return routePath == path;
  }

  bool isExpanded(String menuName, List? childList) {
    return expandedMenuName == menuName;
  }

  Widget getIndexPage(int page) {
    return Container();
  }
}
