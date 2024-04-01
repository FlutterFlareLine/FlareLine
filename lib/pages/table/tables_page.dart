import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flareline/components/tables/InvoiceTable.dart';
import 'package:flareline/components/tables/TopChannel.dart';
import 'package:flareline/components/tables/TopProducts.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TablesPage extends LayoutWidget {
  const TablesPage({super.key});

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 450, width: double.maxFinite, child: TopChannelWidget()),
        SizedBox(
          height: 16,
        ),
        SizedBox(height: 450, width: double.maxFinite,  child:TopProductsWidget()),
        SizedBox(
          height: 16,
        ),
        SizedBox(height: 450, width: double.maxFinite,  child:InvoiceTableWidget()),
      ],
    );
  }

  @override
  String breakTabTitle(BuildContext context) {
    return AppLocalizations.of(context)!.tables;
  }
}
