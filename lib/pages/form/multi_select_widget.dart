import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class MultiSelectWidget extends StatelessWidget {
  MultiSelectWidget({super.key});

  final List<String> _countryList = [
    'America',
    'England',
    'Japan',
    'Russia',
    'China'
  ];

  List<String>? selectedCountries;

  @override
  Widget build(BuildContext context) {
    return MultiSelectDialogField(
      items: _countryList.map((e) => MultiSelectItem(e, e)).toList(),
      listType: MultiSelectListType.CHIP,
      onConfirm: (values) {
        selectedCountries = values;
      },
    );
  }
}
