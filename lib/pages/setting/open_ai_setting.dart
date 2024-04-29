import 'package:dart_openai/dart_openai.dart';
import 'package:flareline/components/buttons/button_widget.dart';
import 'package:flareline/components/card/common_card.dart';
import 'package:flareline/components/forms/checkbox_widget.dart';
import 'package:flareline/components/forms/outborder_text_form_field.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flareline/provider/openai_setting_provider.dart';
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
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: context
                .watch<OpenAISettingProvider>()
                .models
                .map((e) => checkBoxWidget(e, context))
                .toList(),
          ),
          const SizedBox(
            height: 16,
          ),
          OutBorderTextFormField(
            labelText: 'OpenAI Key',
            hintText: 'Enter your key',
            controller: context.read<OpenAISettingProvider>().keyController,
          ),
          const SizedBox(
            height: 16,
          ),
          OutBorderTextFormField(
            labelText: 'Proxy Api',
            hintText: '',
            controller: context.read<OpenAISettingProvider>().proxyController,
          ),
          const SizedBox(
            height: 16,
          ),
          const SizedBox(
            height: 16,
          ),
          ButtonWidget(
            btnText: AppLocalizations.of(context)!.save,
            onTap: () {
              context.read<OpenAISettingProvider>().saveKey(context);
            },
          )
        ]));
  }

  Widget checkBoxWidget(OpenAIModelModel e, BuildContext ctx) {
    bool isChecked = ctx.select<OpenAISettingProvider, bool>(
        (provider) => provider.isChecked(e.id));
    return CheckBoxWidget(
      size: 30,
      text: e.id,
      value: e.id,
      color: GlobalColors.green,
      checked: isChecked,
      onChanged: (checked, v) {
        ctx.read<OpenAISettingProvider>().checkedId = v;
      },
    );
  }
}


