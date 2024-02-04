import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:free_flutter_admin_dashboard/pages/layout.dart';

class FormElementsPage extends LayoutWidget {
  FormElementsPage();

  @override
  String title() {
    return 'FormElements';
  }

  @override
  Widget contentWidget(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _leftWidget(context)),
        Expanded(child: _rightWidget(context))
      ],
    );
  }

  _leftWidget(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('Input Fields'),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Default Input',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Default Input'),
            ),
            SizedBox(
              height: 16.h,
            ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Active Input',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Active Input'),
            ),
            SizedBox(
              height: 16.h,
            ),
            TextFormField(
              enabled: false,
              decoration: InputDecoration(
                  labelText: 'Disabled label',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintText: 'Disabled label'),
            )
          ]),
        ));
  }

  _rightWidget(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Column(
          children: [],
        ));
  }
}
