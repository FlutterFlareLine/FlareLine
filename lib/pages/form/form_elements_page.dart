import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flareline/themes/global_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flareline/components/card/common_card.dart';
import 'package:flareline/components/forms/form_file_picker.dart';
import 'package:flareline/components/forms/outborder_text_form_field.dart';
import 'package:flareline/pages/layout.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/components/dropdown/gf_dropdown.dart';
import 'package:getwidget/getwidget.dart';
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

  ValueNotifier<bool> checkNotifier = ValueNotifier(false);
  ValueNotifier<bool> checkNotifier1 = ValueNotifier(false);
  ValueNotifier<bool> checkNotifier3 = ValueNotifier(false);

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
                Switch(value: false, onChanged: (r) {}),
                const SizedBox(
                  height: 16,
                ),
                SwitchListTile(
                  title: Text(AppLocalizations.of(context)!.switchLabel),
                  value: false,
                  onChanged: (r) {},
                ),
                const SizedBox(
                  height: 16,
                ),
                GFToggle(
                  onChanged: (val) {},
                  value: true,
                  type: GFToggleType.ios,
                ),
                const SizedBox(
                  height: 16,
                ),
                GFToggle(
                  onChanged: (val) {},
                  value: true,
                  type: GFToggleType.square,
                ),
                const SizedBox(
                  height: 16,
                ),
                GFToggle(
                  onChanged: (val) {},
                  value: true,
                  type: GFToggleType.custom,
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
                              print(results);
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
                                              color: stroke, width: 0.5)),
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
                                              color: stroke, width: 0.5)),
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
                      ValueListenableBuilder(
                          valueListenable: checkNotifier,
                          builder: (ctx, res, widget) {
                            return Container(
                              child: GFCheckbox(
                                size: GFSize.SMALL,
                                activeBgColor: GFColors.DANGER,
                                onChanged: (value) {
                                  checkNotifier.value = value;
                                },
                                value: res,
                              ),
                            );
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      ValueListenableBuilder(
                          valueListenable: checkNotifier1,
                          builder: (ctx, res, widget) {
                            return Checkbox(
                              value: res,
                              activeColor: Colors.red, //选中时的颜色
                              onChanged: (value) {
                                checkNotifier1.value = value ?? false;
                              },
                            );
                          }),
                      const SizedBox(
                        height: 16,
                      ),
                      ValueListenableBuilder(
                          valueListenable: checkNotifier3,
                          builder: (ctx, res, widget) {
                            return CupertinoCheckbox(
                              value: res,
                              onChanged: (r) {
                                checkNotifier3.value = r ?? false;
                              },
                            );
                          })
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
                  _dropDownWidget(context),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(AppLocalizations.of(context)!.multiselect),
                  const SizedBox(
                    height: 12,
                  ),
                  _multiSelectWidget(context)
                ])),
          ),
        ]);
  }

  ValueNotifier<String?> dropDownNotifier = ValueNotifier(null);

  Widget _dropDownWidget(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      child: DropdownButtonHideUnderline(
        child: ValueListenableBuilder(
            valueListenable: dropDownNotifier,
            builder: (ctx, res, widget) {
              return GFDropdown(
                borderRadius: BorderRadius.circular(5),
                border: const BorderSide(color: Colors.black12, width: 1),
                dropdownButtonColor: Colors.white,
                value: res,
                onChanged: (newValue) {
                  dropDownNotifier.value = newValue;
                },
                items: [
                  'FC Barcelona',
                  'Real Madrid',
                  'Villareal',
                  'Manchester City'
                ]
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
              );
            }),
      ),
    );
  }

  List<String> dropList = ['China', 'USA', 'England', "Russia", 'Japan'];

  Widget _multiSelectWidget(BuildContext context) {
    return GFMultiSelect(
      items: dropList,
      onSelect: (value) {
        if (kDebugMode) {
          print('selected $value ');
        }
      },
      dropdownTitleTileText: 'Messi, Griezmann, Coutinho ',
      dropdownTitleTileMargin:
          const EdgeInsets.only(top: 22, left: 18, right: 18, bottom: 5),
      dropdownTitleTilePadding: EdgeInsets.all(10),
      dropdownUnderlineBorder:
          const BorderSide(color: Colors.transparent, width: 2),
      dropdownTitleTileBorder:
          Border.all(color: Colors.grey.shade200, width: 1),
      dropdownTitleTileBorderRadius: BorderRadius.circular(5),
      expandedIcon: const Icon(
        Icons.keyboard_arrow_down,
        color: Colors.black54,
      ),
      collapsedIcon: const Icon(
        Icons.keyboard_arrow_up,
        color: Colors.black54,
      ),
      submitButton: Text(AppLocalizations.of(context)!.ok),
      cancelButton: Text(AppLocalizations.of(context)!.cancel),
      dropdownTitleTileTextStyle:
          const TextStyle(fontSize: 14, color: Colors.black54),
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.all(6),
      type: GFCheckboxType.basic,
      activeBgColor: GFColors.SUCCESS,
      activeBorderColor: GFColors.SUCCESS,
      inactiveBorderColor: Colors.grey.shade200,
    );
  }
}
