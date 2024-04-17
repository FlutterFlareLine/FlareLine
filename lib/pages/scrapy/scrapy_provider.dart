import 'package:flareline/pages/scrapy/flare_scrapy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_inappwebview/src/in_app_webview/in_app_webview_controller.dart';
import 'package:get/utils.dart';

class ScrapyProvider extends ChangeNotifier {
  late TextEditingController controller;

  String _url = "";

  String get url => _url;

  InAppWebViewController? _webViewController;

  ScrapyProvider() {
    controller = TextEditingController();
  }

  set webViewController(InAppWebViewController webViewController) {
    this._webViewController = webViewController;
  }

  Future<void> startScrapy() async {
    if (controller.text.isEmpty ||
        this._webViewController == null ||
        !controller.text.startsWith("http")) {
      return;
    }

    _webViewController!
        .loadUrl(urlRequest: URLRequest(url: WebUri(controller.text.trim())));
  }
}
