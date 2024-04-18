import 'package:dart_openai/src/core/models/model/model.dart';
import 'package:flareline/components/buttons/button_widget.dart';
import 'package:flareline/components/card/common_card.dart';
import 'package:flareline/components/forms/checkbox_widget.dart';
import 'package:flareline/components/forms/outborder_text_form_field.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/pages/scrapy/scrapy_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:provider/provider.dart';

class ScrapyPage extends LayoutWidget {
  @override
  // TODO: implement isContentScroll
  bool get isContentScroll => false;

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return ChangeNotifierProvider(
        create: (ctx) => ScrapyProvider(ctx),
        builder: (ctx, widget) {
          return Column(
            children: [
              Text('Use OpenAI GPTBOT, Developing...'),
              SizedBox(height: 20,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.white,
                  child: Column(
                    children: [
                      OutBorderTextFormField(
                        hintText: 'openai key',
                        controller: ctx.read<ScrapyProvider>().keyController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OutBorderTextFormField(
                        hintText: 'proxy api',
                        controller: ctx.read<ScrapyProvider>().proxyController,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ButtonWidget(
                        btnText: 'save',
                        color: GlobalColors.green,
                        onTap: () {
                          ctx.read<ScrapyProvider>().saveKey(context);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: ctx
                            .watch<ScrapyProvider>()
                            .models
                            .map((e) => checkBoxWidget(e, ctx))
                            .toList(),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
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
                        hintText: 'start with http:// or https://',
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
                            ctx.read<ScrapyProvider>().startScrapy(ctx);
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
                  alignment: Alignment.topCenter,
                  children: [
                    // HtmlWidget(
                    //   ctx.watch<ScrapyProvider>().text,
                    //   customStylesBuilder: (element) {
                    //     if (element.classes.contains('foo')) {
                    //       return {'color': 'red'};
                    //     }
                    //
                    //     return null;
                    //   },
                    //
                    //   customWidgetBuilder: (element) {
                    //     return null;
                    //   },
                    //
                    //   // this callback will be triggered when user taps a link
                    //   onTapUrl: (url) {
                    //     return true;
                    //   },
                    //
                    //   // select the render mode for HTML body
                    //   // by default, a simple `Column` is rendered
                    //   // consider using `ListView` or `SliverList` for better performance
                    //   renderMode: RenderMode.column,
                    //
                    //   // set the default styling for text
                    //   textStyle: TextStyle(fontSize: 14),
                    // ),
                    CommonCard(
                        padding: EdgeInsets.all(10),
                        child: SingleChildScrollView(
                            child: MarkdownBlock(
                                data: ctx.watch<ScrapyProvider>().text))),
                    if (ctx.watch<ScrapyProvider>().isLoading)
                      Center(
                        child: SizedBox(
                          child: CircularProgressIndicator(),
                          width: 100,
                          height: 100,
                        ),
                      )
                  ],
                ),
              )
            ],
          );
        });
  }

  CheckBoxWidget checkBoxWidget(OpenAIModelModel e, BuildContext ctx) {
    bool isChecked = ctx
        .select<ScrapyProvider, bool>((provider) => provider.isChecked(e.id));
    return CheckBoxWidget(
      size: 30,
      text: e.id,
      value: e.id,
      color: GlobalColors.green,
      checked: isChecked,
      onChanged: (checked, v) {
        ctx.read<ScrapyProvider>().checkedId = v;
      },
    );
  }

  @override
  String breakTabTitle(BuildContext context) {
    return 'Scrapy';
  }
}
