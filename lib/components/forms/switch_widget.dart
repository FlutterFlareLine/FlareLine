import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter/material.dart';

class SwitchWidget extends StatelessWidget {

  final bool? checked;
  final ValueChanged<bool>? onChanged;
  late ValueNotifier<bool> toggleNotifier;
  SwitchWidget({super.key, this.checked,this.onChanged}){
    toggleNotifier = ValueNotifier(checked??false);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: toggleNotifier,
        builder: (ctx, checked, child) {
          return Switch(
              value: checked,
              activeColor: GlobalColors.green,
              inactiveThumbColor:GlobalColors.darkTextBody,
              inactiveTrackColor:GlobalColors.darkText,
              onChanged: (r) {
                toggleNotifier.value = !toggleNotifier.value;
                onChanged?.call(r);
              });
        });
  }
}
