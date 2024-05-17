import 'package:dart_openai/dart_openai.dart';
import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline_uikit/components/forms/checkbox_widget.dart';
import 'package:flareline_uikit/components/forms/outborder_text_form_field.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flareline/provider/openai_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class OpenAiSetting extends StatelessWidget {
  const OpenAiSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonCard(
        title: 'OpenAI',
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 16,
          ),
          OutBorderTextFormField(
            labelText: 'KEY',
            hintText: 'Enter your key',
            controller: context.read<OpenAIProvider>().keyController,
          ),
          const SizedBox(
            height: 16,
          ),
          OutBorderTextFormField(
            labelText: 'API',
            hintText: '',
            controller: context.read<OpenAIProvider>().proxyController,
          ),
          const SizedBox(
            height: 16,
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: context
                .watch<OpenAIProvider>()
                .models
                .map((e) => checkBoxWidget(e, context))
                .toList(),
          ),
          const SizedBox(
            height: 16,
          ),
          ButtonWidget(
            btnText: AppLocalizations.of(context)!.save,
            type: ButtonType.primary.type,
            onTap: () {
              context.read<OpenAIProvider>().saveKey(context);
            },
          )
        ]));
  }

  Widget checkBoxWidget(OpenAIModelModel e, BuildContext ctx) {
    bool isChecked = ctx
        .select<OpenAIProvider, bool>((provider) => provider.isChecked(e.id));
    return CheckBoxWidget(
      size: 30,
      text: e.id,
      value: e.id,
      checkedColor: GlobalColors.success,
      checked: isChecked,
      onChanged: (checked, v) {
        ctx.read<OpenAIProvider>().checkedId = v;
      },
    );
  }
}
