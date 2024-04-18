import 'package:flareline/components/buttons/button_widget.dart';
import 'package:flareline/components/forms/outborder_text_form_field.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/pages/scrapy/scrapy_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
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
              Expanded(
                  child: Stack(
                children: [
                  Text(ctx.watch<ScrapyProvider>().text),
                  if (ctx.watch<ScrapyProvider>().isLoading)
                    Center(
                      child: SizedBox(
                        child: CircularProgressIndicator(),
                        width: 100,
                        height: 100,
                      ),
                    )
                ],
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
