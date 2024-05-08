import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flareline/components/buttons/button_widget.dart';
import 'package:flareline/components/forms/outborder_text_form_field.dart';
import 'package:flareline/components/modal/modal_dialog.dart';
import 'package:flareline/core/event/global_event.dart';
import 'package:flareline/pages/base/base_stless_widget.dart';
import 'package:flareline/pages/dictionary/dictionary_page.dart';
import 'package:flareline/provider/base_provider.dart';
import 'package:flareline/provider/firebase_store_provider.dart';
import 'package:flareline/provider/store_provider.dart';
import 'package:flareline/utils/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class DictionaryEditPage extends BaseStlessWidget<DictionaryEditProvider> {
  final String btnText;
  final String? title;

  DictionaryEditPage({required this.btnText, this.title, super.params});

  @override
  Widget bodyWidget(BuildContext context, DictionaryEditProvider viewModel,
      Widget? child) {
    return ButtonWidget(
      btnText: btnText,
      onTap: () {
        ModalDialog.show(
            context: context,
            title: title ?? '',
            onSaveTap: () {
              viewModel.save(context);
            },
            child: Column(
              children: [
                OutBorderTextFormField(
                  labelText: 'ConfigKey',
                  hintText: 'ConfigKey',
                  controller: viewModel.configKeyController,
                ),
                SizedBox(
                  height: 10,
                ),
                OutBorderTextFormField(
                  labelText: 'Text',
                  hintText: 'Text',
                  controller: viewModel.configTextController,
                ),
                SizedBox(
                  height: 10,
                ),
                OutBorderTextFormField(
                  labelText: 'ConfigValue',
                  hintText: 'ConfigValue',
                  maxLines: 5,
                  controller: viewModel.configValueController,
                ),
                SizedBox(
                  height: 10,
                ),
                OutBorderTextFormField(
                  labelText: 'OrderNum',
                  hintText: 'OrderNum',
                  controller: viewModel.configOrderNumController,
                ),
              ],
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
  late TextEditingController configKeyController;
  late TextEditingController configValueController;
  late TextEditingController configTextController;
  late TextEditingController configOrderNumController;

  String? id;
  Map<String, dynamic>? detail;
  String? docId;

  DictionaryEditProvider(super.context);

  @override
  void onViewCreated(BuildContext context) {
    configKeyController = TextEditingController();
    configValueController = TextEditingController();
    configTextController = TextEditingController();
    configOrderNumController = TextEditingController();
    configOrderNumController.text = '1';

    if (param != null) {
      id = param!['id'];
      if (id != null) {
        //get detail
        context
            .read<FirebaseStoreProvider>()
            .db
            .collection('dictionary')
            .where('id', isEqualTo: id)
            .get()
            .then((query) {
          if (query.docs.isNotEmpty) {
            docId = query.docs
                .elementAt(0)
                .id;
            detail = query.docs.elementAt(0).data();

            if (detail != null) {
              configKeyController.text = detail!['configKey'] ?? '';
              configValueController.text = detail!['configValue'] ?? '';
              configTextController.text = detail!['text'] ?? '';
              configOrderNumController.text = detail!['orderNum'] ?? '';
            }
          }
        });
      }
    }
  }

  save(BuildContext context) async {
    if (configKeyController.text
        .trim()
        .isEmpty ||
        configTextController.text
            .trim()
            .isEmpty ||
        configValueController.text
            .trim()
            .isEmpty ||
        configOrderNumController.text
            .trim()
            .isEmpty) {
      SnackBarUtil.showSnack(context, 'Please Enter Dictionary Info');
      return;
    }
    //check if exist same configKey

    if (id != null && detail != null) {
      if (detail!['configKey'] != configKeyController.text.trim()) {
        final query = await context
            .read<FirebaseStoreProvider>()
            .db
            .collection('dictionary')
            .where('configKey', isEqualTo: configKeyController.text.trim())
            .get();
        if (query.docs.isNotEmpty) {
          SnackBarUtil.showSnack(context, 'Exists Same ConfigKey');
          return;
        }
      }

      final doc = await context
          .read<FirebaseStoreProvider>()
          .db
          .collection('dictionary')
          .doc(docId);
      doc.update({
        'configKey': configKeyController.text.trim(),
        'text': configTextController.text.trim(),
        'configValue': configValueController.text.trim(),
        'orderNum': configOrderNumController.text.trim(),
      }).then((value) {
        onSuccess(context);
      },
          onError: (e) => print("Error updating document $e"));
      return;
    }

    final query = await context
        .read<FirebaseStoreProvider>()
        .db
        .collection('dictionary')
        .where('configKey', isEqualTo: configKeyController.text.trim())
        .get();
    if (query.docs.isNotEmpty) {
      SnackBarUtil.showSnack(context, 'Exists Same ConfigKey');
      return;
    }
    String email = context
        .read<StoreProvider>()
        .email;
    Map<String, dynamic> dic = {
      'id': const Uuid().v1(),
      'configKey': configKeyController.text.trim(),
      'text': configTextController.text.trim(),
      'configValue': configValueController.text.trim(),
      'orderNum': configOrderNumController.text.trim(),
      'status': 1,
      'belongUid': email
    };

    context.read<FirebaseStoreProvider>().add('dictionary', dic);
    onSuccess(context);
  }

  void onSuccess(BuildContext context) {
    GlobalEvent.eventBus.fire(EventInfo(true, 'refresh_DictionaryViewModel'));
    Navigator.of(context).pop();
    SnackBarUtil.showSuccess(context, 'Save Success');
  }
}
