import 'package:flareline/core/theme/global_colors.dart';
import 'package:flareline_uikit/components/forms/checkbox_widget.dart';
import 'package:flutter/material.dart';

class SingleCheckboxWidget extends StatelessWidget {
  SingleCheckboxWidget({super.key});

  final List<Map<String, dynamic>> checkBoxList = [
    {
      'name': 'Info',
      'color': GlobalColors.info,
    },
    {
      'name': 'Success',
      'color': GlobalColors.success,
    },
    {
      'name': 'Warn',
      'color': GlobalColors.warn,
    },
    {
      'name': 'Primary',
      'color': GlobalColors.primary,
    },
    {
      'name': 'Error',
      'color': GlobalColors.danger,
    }
  ];

  ValueNotifier<String> checkedNotifier = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: checkedNotifier,
        builder: (ctx, checkedValue, child) {
          return Wrap(
            spacing: 20,
            runSpacing: 10,
            children: checkBoxList.map((element) {
              return CheckBoxWidget(
                checked: checkedValue == element['name'],
                text: element['name'],
                checkedColor: element['color'],
                size: 30,
                value: element['name'],
                onChanged: (checked, v) {
                  if (checked ?? false) {
                    checkedNotifier.value = v ?? '';
                  }else{
                    checkedNotifier.value='';
                  }
                },
              );
            }).toList(),
          );
        });
  }
}
