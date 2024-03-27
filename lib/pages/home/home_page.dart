import 'package:flutter/material.dart';

import 'package:free_flutter_admin_dashboard/provider/main_provider.dart';
import 'package:free_flutter_admin_dashboard/routes.dart';
import 'package:free_flutter_admin_dashboard/components/sidebar/side_bar.dart';
import 'package:free_flutter_admin_dashboard/components/toolbar/toolbar.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
        return const SizedBox();
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
        const ToolBarWidget(),
        const SizedBox(
          height: 16,
        ),
        Expanded(child: _mainContentWidget())
      ]),
    );
  }

  final PageController _pageController = PageController();

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
