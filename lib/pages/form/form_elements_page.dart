
import 'package:flareline/pages/form/date_picker_widget.dart';
import 'package:flareline/pages/form/drop_zone_widget.dart';
import 'package:flareline/pages/form/multi_select_widget.dart';
import 'package:flareline_uikit/components/forms/select_widget.dart';
import 'package:flareline/pages/form/single_checkbox_widget.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline_uikit/components/forms/form_file_picker.dart';
import 'package:flareline_uikit/components/forms/outborder_text_form_field.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flareline/flutter_gen/app_localizations.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FormElementsPage extends LayoutWidget {
  FormElementsPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    return AppLocalizations.of(context)!.formElements;
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _leftWidget(context)),
        const SizedBox(
          width: 16,
        ),
        Expanded(child: _rightWidget(context))
      ],
    );
  }

  @override
  Widget contentMobileWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _leftWidget(context),
        const SizedBox(
          height: 16,
        ),
        _rightWidget(context)
      ],
    );
  }

  _titleWidget(String title, Widget childWidget) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 50,
        padding: const EdgeInsets.only(left: 10),
        alignment: Alignment.centerLeft,
        child: Text(title),
      ),
      const Divider(
        height: 1,
      ),
      Padding(padding: const EdgeInsets.all(16), child: childWidget)
    ]);
  }

  ValueNotifier<String> colorPicker = ValueNotifier("#000000");

  ValueNotifier<bool> toggleNotifier = ValueNotifier(false);

  ValueNotifier<bool> toggleNotifier2 = ValueNotifier(false);

  _leftWidget(BuildContext context) {
    return Column(
      children: [
        CommonCard(
          child: _titleWidget(
              AppLocalizations.of(context)!.inputFields,
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                OutBorderTextFormField(
                    labelText: AppLocalizations.of(context)!.defaultInput,
                    hintText: AppLocalizations.of(context)!.defaultInput),
                const SizedBox(
                  height: 16,
                ),
                OutBorderTextFormField(
                    labelText: AppLocalizations.of(context)!.activeInput,
                    hintText: AppLocalizations.of(context)!.activeInput),
                const SizedBox(
                  height: 16,
                ),
                OutBorderTextFormField(
                  labelText: AppLocalizations.of(context)!.disabledLabel,
                  hintText: AppLocalizations.of(context)!.disabledLabel,
                  enabled: false,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(AppLocalizations.of(context)!.colorPicker),
                const SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: () {
                    Alert(
                      context: context,
                      type: AlertType.none,
                      title: AppLocalizations.of(context)!.colorPicker,
                      content: ColorPicker(
                        pickerColor: HexColor(colorPicker.value),
                        onColorChanged: (value) {
                          colorPicker.value = value.hex;
                        },
                      ),
                    ).show(); //
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 1)),
                      height: 35,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 12.0),
                      child: ValueListenableBuilder(
                        valueListenable: colorPicker,
                        builder: (ctx, color, child) {
                          return Container(
                            decoration: BoxDecoration(
                              color: HexColor(color),
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          );
                        },
                      )),
                )
              ])),
        ),
        const SizedBox(
          height: 16,
        ),
        CommonCard(
          child: _titleWidget(
              AppLocalizations.of(context)!.toggleSwitchInput,
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                ValueListenableBuilder(
                    valueListenable: toggleNotifier,
                    builder: (ctx, checked, child) {
                      return Switch(
                          value: checked,
                          activeColor: GlobalColors.success,
                          inactiveThumbColor: GlobalColors.darkText,
                          inactiveTrackColor: GlobalColors.lightGray,
                          onChanged: (r) {
                            toggleNotifier.value = !toggleNotifier.value;
                          });
                    }),
                const SizedBox(
                  height: 16,
                ),
                ValueListenableBuilder(
                    valueListenable: toggleNotifier2,
                    builder: (ctx, checked, child) {
                      return SwitchListTile(
                        title: Text(AppLocalizations.of(context)!.switchLabel),
                        activeColor: GlobalColors.success,
                        inactiveThumbColor: GlobalColors.darkText,
                        inactiveTrackColor: GlobalColors.lightGray,
                        value: checked,
                        onChanged: (r) {
                          toggleNotifier2.value = !toggleNotifier2.value;
                        },
                      );
                    }),
                const SizedBox(
                  height: 16,
                ),
              ])),
        ),
        const SizedBox(
          height: 16,
        ),
        CommonCard(
          child: _titleWidget(
              AppLocalizations.of(context)!.timeAndDate,
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DatePickerWidget(),
                    const SizedBox(
                      height: 16,
                    ),
                  ])),
        ),
        const SizedBox(
          height: 16,
        ),
        CommonCard(
          child: _titleWidget(
              AppLocalizations.of(context)!.fileUpload,
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                FormFilePicker(
                  title: AppLocalizations.of(context)!.attachFile,
                ),
                const SizedBox(
                  height: 16,
                ),
                FormFilePicker(
                  title: AppLocalizations.of(context)!.selectImage,
                  allowExtention: ['jpg', 'jpeg', 'png', 'gif'],
                ),
              ])),
        ),
        const SizedBox(
          height: 16,
        ),
        CommonCard(
          child: _titleWidget(
              'Dropzone',
              SizedBox(
                height: 200,
                width: double.maxFinite,
                child: DropZoneWidget(),
              )),
        )
      ],
    );
  }

  _rightWidget(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CommonCard(
            child: _titleWidget(
                AppLocalizations.of(context)!.textareaFields,
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  OutBorderTextFormField(
                    labelText: AppLocalizations.of(context)!.defaultTextarea,
                    hintText: AppLocalizations.of(context)!.defaultTextarea,
                    maxLines: 5,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OutBorderTextFormField(
                      maxLines: 5,
                      labelText: AppLocalizations.of(context)!.activeTextarea,
                      hintText: AppLocalizations.of(context)!.activeTextarea),
                  const SizedBox(
                    height: 16,
                  ),
                  OutBorderTextFormField(
                      enabled: false,
                      maxLines: 5,
                      labelText: AppLocalizations.of(context)!.disabledTextarea,
                      hintText: AppLocalizations.of(context)!.disabledTextarea)
                ])),
          ),
          const SizedBox(
            height: 16,
          ),
          CommonCard(
              child: _titleWidget(
            AppLocalizations.of(context)!.checkboxAndRadis,
            SingleCheckboxWidget(),
          )),
          const SizedBox(
            height: 16,
          ),
          CommonCard(
            child: _titleWidget(
                AppLocalizations.of(context)!.selectInput,
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(AppLocalizations.of(context)!.selectCountry),
                  const SizedBox(
                    height: 12,
                  ),
                  SelectWidget(
                    selectionList: const [
                      'America',
                      'England',
                      'Japan',
                      'Russia',
                      'China'
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(AppLocalizations.of(context)!.multiselect),
                  const SizedBox(
                    height: 12,
                  ),
                  MultiSelectWidget()
                ])),
          ),
        ]);
  }
}
