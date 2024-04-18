import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flareline/components/forms/checkbox_widget.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flareline/components/card/common_card.dart';
import 'package:flareline/components/forms/form_file_picker.dart';
import 'package:flareline/components/forms/outborder_text_form_field.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  ValueNotifier<String> dateNotifier = ValueNotifier("");

  ValueNotifier<bool> checkNotifier1 = ValueNotifier(false);

  ValueNotifier<bool> checkNotifier3 = ValueNotifier(false);

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
                          activeColor: GlobalColors.green,
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
                        activeColor: GlobalColors.red,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.datePicker),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: () async {
                              List<DateTime?>? results =
                                  await showCalendarDatePicker2Dialog(
                                context: context,
                                config:
                                    CalendarDatePicker2WithActionButtonsConfig(),
                                dialogSize: const Size(325, 400),
                                borderRadius: BorderRadius.circular(15),
                              );

                              dateNotifier.value =
                                  (results != null && results!.length > 0
                                      ? (results
                                              .elementAt(0)
                                              ?.toLocal()
                                              .toString()
                                              .substring(0, 10) ??
                                          '')
                                      : "");
                            },
                            child: ValueListenableBuilder(
                                valueListenable: dateNotifier,
                                builder: (c, val, child) {
                                  return Container(
                                      alignment: Alignment.centerLeft,
                                      height: 45,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              color: GlobalColors.stroke, width: 0.5)),
                                      child: Text(val));
                                }))
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.selectDate),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: () async {
                              List<DateTime?>? results =
                                  await showCalendarDatePicker2Dialog(
                                context: context,
                                config:
                                    CalendarDatePicker2WithActionButtonsConfig(),
                                dialogSize: const Size(325, 400),
                                borderRadius: BorderRadius.circular(15),
                              );
                              if (kDebugMode) {
                                print(results);
                              }
                              dateNotifier.value =
                                  (results != null && results!.isNotEmpty
                                      ? (results
                                              .elementAt(0)
                                              ?.toLocal()
                                              .toString()
                                              .substring(0, 10) ??
                                          '')
                                      : "");
                            },
                            child: ValueListenableBuilder(
                                valueListenable: dateNotifier,
                                builder: (c, val, child) {
                                  return Container(
                                      alignment: Alignment.centerLeft,
                                      height: 45,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      width: double.maxFinite,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          border: Border.all(
                                              color: GlobalColors.stroke, width: 0.5)),
                                      child: Text(val));
                                }))
                      ],
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
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CheckBoxWidget(
                            text: 'Success',
                            color: GlobalColors.green,
                            size: 30,
                            onChanged: (checked, v) {},
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          CheckBoxWidget(
                            text: 'Error',
                            color: GlobalColors.red,
                            size: 30,
                            onChanged: (checked, v) {},
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          CheckBoxWidget(
                            text: 'Warn',
                            color: GlobalColors.yellow,
                            size: 30,
                            onChanged: (checked, v) {},
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          CheckBoxWidget(
                            text: 'Primary',
                            color: GlobalColors.primary,
                            size: 30,
                            onChanged: (checked, v) {},
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          CheckBoxWidget(
                            text: 'Info',
                            color: GlobalColors.darkTextBody,
                            size: 30,
                            onChanged: (checked, v) {},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          ValueListenableBuilder(
                              valueListenable: checkNotifier1,
                              builder: (ctx, res, widget) {
                                return Checkbox(
                                  value: res,
                                  activeColor: GlobalColors.green, //选中时的颜色
                                  onChanged: (value) {
                                    checkNotifier1.value = value ?? false;
                                  },
                                );
                              }),
                          const SizedBox(
                            width: 20,
                          ),
                          ValueListenableBuilder(
                              valueListenable: checkNotifier1,
                              builder: (ctx, res, widget) {
                                return Checkbox(
                                  value: res,
                                  activeColor: GlobalColors.red, //选中时的颜色
                                  onChanged: (value) {
                                    checkNotifier1.value = value ?? false;
                                  },
                                );
                              }),
                          const SizedBox(
                            width: 20,
                          ),
                          ValueListenableBuilder(
                              valueListenable: checkNotifier1,
                              builder: (ctx, res, widget) {
                                return Checkbox(
                                  value: res,
                                  activeColor: GlobalColors.yellow, //选中时的颜色
                                  onChanged: (value) {
                                    checkNotifier1.value = value ?? false;
                                  },
                                );
                              }),
                          const SizedBox(
                            width: 20,
                          ),
                          ValueListenableBuilder(
                              valueListenable: checkNotifier1,
                              builder: (ctx, res, widget) {
                                return Checkbox(
                                  value: res,
                                  activeColor: GlobalColors.primary, //选中时的颜色
                                  onChanged: (value) {
                                    checkNotifier1.value = value ?? false;
                                  },
                                );
                              }),
                          const SizedBox(
                            width: 20,
                          ),
                          ValueListenableBuilder(
                              valueListenable: checkNotifier1,
                              builder: (ctx, res, widget) {
                                return Checkbox(
                                  value: res,
                                  activeColor: GlobalColors.darkTextBody, //选中时的颜色
                                  onChanged: (value) {
                                    checkNotifier1.value = value ?? false;
                                  },
                                );
                              }),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ])),
          ),
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

                  const SizedBox(
                    height: 16,
                  ),
                  Text(AppLocalizations.of(context)!.multiselect),
                  const SizedBox(
                    height: 12,
                  ),

                ])),
          ),
        ]);
  }
}
