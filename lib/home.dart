import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_flutter_admin_dashboard/provider/main_provider.dart';
import 'package:free_flutter_admin_dashboard/routes.dart';
import 'package:free_flutter_admin_dashboard/side_bar.dart';
import 'package:free_flutter_admin_dashboard/toolbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ResponsiveBuilder(builder: (context, sizingInformation) {
      // Check the sizing information here and return your UI
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return Row(
          children: [
            _sideBarWidget(context),
            Expanded(child: _contentWidget(context))
          ],
        );
      }

      return _contentWidget(context);
    }), drawer: ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return SizedBox();
      }
      return Drawer(
        child: _sideBarWidget(context),
      );
    }));
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
