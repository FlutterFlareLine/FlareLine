import 'package:flareline/components/buttons/button_widget.dart';
import 'package:flareline/components/forms/outborder_text_form_field.dart';
import 'package:flareline/components/tables/InvoiceTable.dart';
import 'package:flareline/components/tables/TopChannel.dart';
import 'package:flareline/components/tables/TopProducts.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/pages/scrapy/scrapy_provider.dart';
import 'package:flareline/pages/scrapy/scrapy_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class ScrapyPage extends LayoutWidget {

  @override
  // TODO: implement isContentScroll
  bool get isContentScroll => false;

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return ChangeNotifierProvider(
        create: (ctx) => ScrapyProvider(),
        builder: (ctx, widget) {
          return Column(
            children: [
              SizedBox(
                height: 80,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: OutBorderTextFormField(
                        hintText: 'enter your url',
                        controller: ctx.read<ScrapyProvider>().controller,
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 100,
                        child: ButtonWidget(
                          btnText: 'start',
                          onTap: () {
                            ctx.read<ScrapyProvider>().startScrapy();
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(child: InAppWebView(
                initialUrlRequest: URLRequest(
                    url: WebUri('https://www.google.com')),
                onWebViewCreated: (controller) async {
                  ctx.read<ScrapyProvider>().webViewController = controller;
                },
                onLoadStart: (controller, url) async {

                },
                onPermissionRequest: (controller, request) async {
                  return PermissionResponse(
                      resources: request.resources,
                      action: PermissionResponseAction.GRANT);
                },
                shouldOverrideUrlLoading:
                    (controller, navigationAction) async {
                  var uri = navigationAction.request.url!;

                  // if (![
                  //   "http",
                  //   "https",
                  //   "file",
                  //   "chrome",
                  //   "data",
                  //   "javascript",
                  //   "about"
                  // ].contains(uri.scheme)) {
                  //   if (await canLaunchUrl(uri)) {
                  //     // Launch the App
                  //     await launchUrl(
                  //       uri,
                  //     );
                  //     // and cancel the request
                  //     return NavigationActionPolicy.CANCEL;
                  //   }
                  // }

                  return NavigationActionPolicy.ALLOW;
                },
                onLoadStop: (controller, url) async {

                },
                onReceivedError: (controller, request, error) {

                },
                onProgressChanged: (controller, progress) {

                },
                onUpdateVisitedHistory: (controller, url, isReload) {

                },
                onConsoleMessage: (controller, consoleMessage) {
                  print(consoleMessage);
                },
              ))
            ],
          );
        });
  }

  @override
  String breakTabTitle(BuildContext context) {
    return 'Scrapy';
  }
}
