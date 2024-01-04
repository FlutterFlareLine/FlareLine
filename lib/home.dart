import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      body: Row(
        children: [
          _sideBarWidget(context),
          Expanded(child: _contentWidget(context))
        ],
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
  _sideBarWidget(BuildContext context) {
    return Container(
      color: Colors.green,
      width: 200.w,
      child: Column(children: [
        _logoWidget(),
        Expanded(child: _sideListWidget(context))
      ]),
    );
  }
  
  _contentWidget(BuildContext context) {}
  
  _logoWidget() {
    return Row(children: [
      ClipOval(
        child: Container(
          color: Colors.blue,
        ),
      ),
      Expanded(child: Text('XAdmin',style: TextStyle(color: Colors.white,fontSize: 36.sp),))
    ],);
  }
  
  _sideListWidget(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
    );
  }
}