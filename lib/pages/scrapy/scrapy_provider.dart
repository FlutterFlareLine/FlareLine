import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_inappwebview/src/in_app_webview/in_app_webview_controller.dart';
import 'package:http/http.dart' as http;

class ScrapyProvider extends ChangeNotifier {
  late TextEditingController controller;

  String _url = "";

  String get url => _url;

  String _text = "";

  String get text => _text;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ScrapyProvider() {
    controller = TextEditingController();
  }

  Future<void> startScrapy() async {
    if (controller.text.isEmpty || !controller.text.startsWith("http")) {
      return;
    }

    _isLoading = true;
    notifyListeners();
String userAgentFallback =
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3';
  Map<String, String>? allHeaders = {
  
    'User-Agent': userAgentFallback
  };
    try {
      final response = await http.get(Uri.parse(controller.text),headers:allHeaders);
      if (response.statusCode == 200) {
        _text = response.body;
      } else {
        _text = response.reasonPhrase ?? 'empty';
      }
    } catch (e) {
      print(e);
      _text = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
