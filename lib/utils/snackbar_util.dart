import 'package:flareline/themes/global_colors.dart';
import 'package:flutter/material.dart';

class SnackBarUtil{
  static showSnack(BuildContext context, String msg,{Color? color}){
    SnackBar snackBar = SnackBar(
      backgroundColor: color??red,
      content: Text(msg),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static showSuccess(BuildContext context, String msg){
    showSnack(context, msg, color: green);
  }
}