import 'package:flareline/components/buttons/button_widget.dart';
import 'package:flareline/components/forms/outborder_text_form_field.dart';
import 'package:flareline/components/modal/modal_dialog.dart';
import 'package:flareline/pages/base/base_stless_widget.dart';
import 'package:flareline/provider/base_provider.dart';
import 'package:flareline/provider/firebase_store_provider.dart';
import 'package:flareline/provider/store_provider.dart';
import 'package:flareline/utils/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class DictionaryEditPage extends BaseStlessWidget<DictionaryEditProvider> {
  final String btnText;

  DictionaryEditPage({required this.btnText, super.params});

  @override
  Widget bodyWidget(
      BuildContext context, DictionaryEditProvider viewModel, Widget? child) {
    return ButtonWidget(
      btnText: btnText,
      onTap: () {
        ModalDialog.show(
            context: context,
            title: 'Add Dictionary',
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
  DictionaryEditProvider viewModelBuilder(BuildContext context,
      {Map<String, dynamic>? param}) {
    return DictionaryEditProvider(
      context,
    );
  }
}

class DictionaryEditProvider extends BaseProvider {
  late TextEditingController configKeyController;
  late TextEditingController configValueController;
  late TextEditingController configTextController;
  late TextEditingController configOrderNumController;

  DictionaryEditProvider(super.context);

  @override
  void onViewCreated(BuildContext context) {
    configKeyController = TextEditingController();
    configValueController = TextEditingController();
    configTextController = TextEditingController();
    configOrderNumController = TextEditingController();
  }

  save(BuildContext context) async {
    //check if exist same configKey
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
    String email = context.read<StoreProvider>().email;
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
    SnackBarUtil.showSuccess(context, 'Save Success');
  }
}
