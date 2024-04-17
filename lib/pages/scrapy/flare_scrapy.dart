library dghub_web_scrapper;

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class FlareScrapy {
  static String windowAgent =
      "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.99 Safari/537.36";

  static Future<dom.Document?> get(String url,
      {Map<String, String>? header}) async {
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri, headers: header);
      dom.Document html = dom.Document.html(response.body);

      return html;
    } catch (e) {
      return null;
    }
  }

  static Future<dom.Document?> getFullLoaded(String url,
      {Map<String, String>? header,
      Function(InAppWebViewController, Uri?)? onLoaded,
      Function(InAppWebViewController, DownloadStartRequest)?
          onDownloadStart}) async {
    final Completer<dom.Document?> c = Completer<dom.Document?>();
    var webUri = WebUri(url);
    try {
      HeadlessInAppWebView(

        initialSettings: InAppWebViewSettings(
          isInspectable: kDebugMode,
        ),
        onDownloadStartRequest: (controller, downloadStartRequest) {
          if (onDownloadStart != null) {
            onDownloadStart(controller, downloadStartRequest);
          }
        },
        initialUrlRequest: URLRequest(url: webUri, headers: header),
        onLoadStop: (controller, gurl) async {
          if (onLoaded != null) {
            onLoaded(controller, gurl);
          }

          try {
            var htm = await controller.getHtml();
            var document = parse(htm);
            controller.stopLoading();
            c.complete(document);
          } catch (e) {
            controller.stopLoading();
            print(e.toString());
          }
        },
      )
        ..run()
        ..dispose();
    } catch (e) {
      print(e);
    }
    return c.future;
  }
}
