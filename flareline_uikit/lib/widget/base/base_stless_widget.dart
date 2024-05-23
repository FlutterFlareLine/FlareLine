library flareline_uikit;
import 'package:flareline_uikit/service/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class BaseStlessWidget<VM extends BaseProvider>
    extends StatelessWidget {
  final Map<String, dynamic>? params;

  late VM _mViewMode;

  VM viewModelBuilder(BuildContext context);

  BaseStlessWidget({this.params, super.key});

  @override
  Widget build(BuildContext context) {
    _mViewMode = viewModelBuilder(context);
    _mViewMode.setArgs(params);
    _mViewMode.onViewCreated(context);

    return ChangeNotifierProvider<VM>(
        create: (context) => _mViewMode,
        child: Consumer<VM>(
          builder: (context, viewModel, child) =>
              bodyWidget(context, viewModel, child),
          child: staticChild(),
        ));
  }

  Widget bodyWidget(BuildContext context, VM viewModel, Widget? child);

  Widget? staticChild() {
    return null;
  }
}
