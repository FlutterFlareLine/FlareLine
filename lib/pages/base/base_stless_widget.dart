import 'package:flareline/provider/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class BaseStlessWidget<VM extends BaseProvider>
    extends StatelessWidget {

  late VM _mViewMode;

  VM viewModelBuilder(BuildContext context);

  @override
  Widget build(BuildContext context) {
    _mViewMode = viewModelBuilder(context);

    return ChangeNotifierProvider<VM>(
        create: (context) => _mViewMode,
        child: Consumer<VM>(
          builder: (context, viewModel, child) =>
              bodyWidget(context, viewModel, child),
          child: staticChild(),
        ));
  }

  ///业务widget
  Widget bodyWidget(BuildContext context, VM viewModel, Widget? child);

  ///不会更新的widget
  Widget? staticChild() {
    return null;
  }
}
