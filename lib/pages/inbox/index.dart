import 'package:flutter/material.dart';

import 'package:free_flutter_admin_dashboard/components/card/white_card.dart';
import 'package:free_flutter_admin_dashboard/pages/layout.dart';

class InboxWidget extends LayoutWidget {
  @override
  String title() {
    // TODO: implement title
    return 'Inbox';
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    // TODO: implement contentWidget
    return WhiteCard(
      child: Row(children: [
        SizedBox(
          width: 150,
          child: ListView(
            padding: EdgeInsets.all(16),
            children: [
            Container(
              height: 30,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text('Compose',style: TextStyle(color: Colors.white),),
              decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(4)),
            ),
            SizedBox(height: 10,),
            ListTile(
              title: Text('Inbox'),
            ),
            SizedBox(height: 10,),
            ListTile(
              title: Text('Started'),
            ),
            SizedBox(height: 10,),
            ListTile(
              title: Text('Snoozed'),
            ),
            SizedBox(height: 10,),
            ListTile(
              title: Text('Sent'),
            ),
            SizedBox(height: 10,),
            ListTile(
              title: Text('Drafts'),
            ),
            SizedBox(height: 10,),
            ListTile(
              title: Text('Spam'),
            ),
            SizedBox(height: 10,),
            ListTile(
              title: Text('Trash'),
            ),
          ]),
        ),
        VerticalDivider(),
        Expanded(
            child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Divider(),
            SizedBox(
              height: 50,
            ),
            Divider(),
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
    return ListTile();
  }
}
