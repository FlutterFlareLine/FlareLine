import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_flutter_admin_dashboard/provider/main_provider.dart';
import 'package:free_flutter_admin_dashboard/routes.dart';
import 'package:free_flutter_admin_dashboard/side_bar.dart';
import 'package:free_flutter_admin_dashboard/toolbar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        _sideBarWidget(context),
        Expanded(child: _contentWidget(context))
      ],
    ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  _sideBarWidget(BuildContext context) {
    return SideBarWidger();
  }

  _contentWidget(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Column(children: [
        ToolBarWidget(),
        SizedBox(
          height: 16.h,
        ),
        Expanded(child: _mainContentWidget())
      ]),
    );
  }

  PageController _pageController = PageController();

  _mainContentWidget() {
    return PageView.builder(
      itemBuilder: _pageItemBuilder,
      controller: _pageController,
      itemCount: MAIN_PAGES.length,
    );
  }

  Widget _pageItemBuilder(BuildContext context, int index) {
    String path = context.watch<MainProvider>().selectedPath;

    return context.read<MainProvider>().getSelectedPage(path);
  }
}
