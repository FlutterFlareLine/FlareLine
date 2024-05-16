import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flareline/components/buttons/button_widget.dart';
import 'package:flareline/components/forms/form_file_picker.dart';
import 'package:flareline/components/forms/outborder_text_form_field.dart';
import 'package:flareline/components/modal/modal_dialog.dart';
import 'package:flareline/core/event/global_event.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flareline/pages/base/base_stless_widget.dart';
import 'package:flareline/pages/dictionary/dictionary_page.dart';
import 'package:flareline/provider/base_provider.dart';
import 'package:flareline/utils/firebase_store_utils.dart';
import 'package:flareline/provider/store_provider.dart';
import 'package:flareline/utils/firebase_storage_utils.dart';
import 'package:flareline/utils/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:crypto/crypto.dart';

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
      type: ButtonType.SUCCESS.type,
      onTap: () {
        ModalDialog.show(
            context: context,
            title: title ?? '',
            onSaveTap: () {
              // viewModel.save(context);
            },
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
