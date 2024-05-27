
import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/modal/modal_dialog.dart';
import 'package:flareline_uikit/widget/base/base_stless_widget.dart';
import 'package:flareline/pages/dictionary/dictionary_page.dart';
import 'package:flareline_uikit/service/base_provider.dart';
import 'package:flutter/material.dart';

class DictionaryChildPage extends BaseStlessWidget<DictionaryEditProvider> {
  final String btnText;
  final String? title;

  DictionaryChildPage(
      {required this.btnText, this.title, super.params, super.key});

  @override
  Widget bodyWidget(
      BuildContext context, DictionaryEditProvider viewModel, Widget? child) {
    return ButtonWidget(
      btnText: btnText,
      type: ButtonType.warn.type,
      onTap: () {
        ModalDialog.show(
            context: context,
            title: title ?? '',
            showFooter: false,
            child: SizedBox(
              height: 500,
              child: DictionaryTableWidget(
                params: params,
                key: UniqueKey(),
              ),
            ));
      },
    );
  }

  @override
  DictionaryEditProvider viewModelBuilder(BuildContext context) {
    return DictionaryEditProvider(context);
  }
}

class DictionaryEditProvider extends BaseProvider {
  DictionaryEditProvider(super.context);
}
