import 'package:flutter/material.dart';

import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/flutter_gen/app_localizations.dart';

class InboxWidget extends LayoutWidget {
  const InboxWidget({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement title
    return 'Inbox';
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    // TODO: implement contentWidget
    return CommonCard(
      child: Row(children: [
        SizedBox(
          width: 150,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
            Container(
              height: 30,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Compose',style: TextStyle(color: Colors.white),),
              decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(4)),
            ),
            const SizedBox(height: 10,),
            const ListTile(
              title: Text('Inbox'),
            ),
            const SizedBox(height: 10,),
            const ListTile(
              title: Text('Started'),
            ),
            const SizedBox(height: 10,),
            const ListTile(
              title: Text('Snoozed'),
            ),
            const SizedBox(height: 10,),
            const ListTile(
              title: Text('Sent'),
            ),
            const SizedBox(height: 10,),
            const ListTile(
              title: Text('Drafts'),
            ),
            const SizedBox(height: 10,),
            const ListTile(
              title: Text('Spam'),
            ),
            SizedBox(height: 10,),
            const ListTile(
              title: Text('Trash'),
            ),
          ]),
        ),
        const VerticalDivider(),
        Expanded(
            child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Divider(),
            const SizedBox(
              height: 50,
            ),
            const Divider(),
            Expanded(
                child: ListView.builder(
              itemBuilder: itemBuilder,
              itemCount: 20,
            ))
          ],
        ))
      ]),
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return const ListTile();
  }
}
