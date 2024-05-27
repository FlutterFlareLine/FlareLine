import 'package:flareline_uikit/core/theme/flareline_colors.dart';
import 'package:flutter/material.dart';

class SelectWidget extends StatelessWidget {
  SelectWidget({super.key});

  final List<String> _countryList = [
    'America',
    'England',
    'Japan',
    'Russia',
    'China'
  ];

  ValueNotifier<String> countryNotifier = ValueNotifier('America');

  @override
  Widget build(BuildContext context) {
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
                items: _countryList.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (value) {
                  countryNotifier.value = value ?? '';
                },
              ),
            );
          }),
    );
  }
}
