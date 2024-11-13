library flareline_uikit;

import 'package:flareline_uikit/core/theme/flareline_colors.dart';
import 'package:flutter/material.dart';

class SelectWidget extends StatelessWidget {
  final List<String> selectionList;
  final ValueChanged<String>? onDropdownChanged;
  final TextStyle? textStyle;

  SelectWidget(
      {super.key, required this.selectionList, this.onDropdownChanged, this.textStyle});

  ValueNotifier<String> countryNotifier = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    countryNotifier.value = selectionList[0];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          border: Border.all(color: FlarelineColors.border, width: 1),
          borderRadius: BorderRadius.circular(5)),
      child: ValueListenableBuilder(
          valueListenable: countryNotifier,
          builder: (ctx, country, child) {
            return DropdownButtonHideUnderline(
              child: DropdownButton(
                borderRadius: BorderRadius.circular(4),
                elevation: 0,
                isExpanded: true,
                focusColor: Colors.white,
                dropdownColor: Colors.white,
                value: country,
                items: selectionList.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items, style: textStyle,),
                  );
                }).toList(),
                onChanged: (value) {
                  countryNotifier.value = value ?? '';
                  if (onDropdownChanged != null) {
                    onDropdownChanged!(countryNotifier.value);
                  }
                },
              ),
            );
          }),
    );
  }
}
