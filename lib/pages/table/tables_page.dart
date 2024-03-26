import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:free_flutter_admin_dashboard/components/tables/InvoiceTable.dart';
import 'package:free_flutter_admin_dashboard/components/tables/TopChannel.dart';
import 'package:free_flutter_admin_dashboard/components/tables/TopProducts.dart';
import 'package:free_flutter_admin_dashboard/pages/layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TablesPage extends LayoutWidget {
  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Column(
      children: [
        Container(height: 450, width: double.maxFinite, child: TopChannelWidget()),
        SizedBox(
          height: 16,
        ),
        Container(height: 450, width: double.maxFinite,  child:TopProductsWidget()),
        SizedBox(
          height: 16,
        ),
        Container(height: 450, width: double.maxFinite,  child:InvoiceTableWidget()),
      ],
    );
  }

  @override
  String breakTabTitle(BuildContext context) {
    return 'Tables';
  }
}
