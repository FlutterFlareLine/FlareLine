import 'package:flareline/pages/layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flareline/flutter_gen/app_localizations.dart';

class AdvanceTablePage extends LayoutWidget {
  const AdvanceTablePage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    return AppLocalizations.of(context)!.advanceTable;
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
