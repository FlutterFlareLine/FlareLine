import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class BaseProvider extends ChangeNotifier{

  var logger = Logger();

  bool _isDisposed=false;

  @override
  void notifyListeners() {
    if(_isDisposed){
      return;
    }
    super.notifyListeners();
  }

  void log(String msg){
    logger.f(msg);
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}