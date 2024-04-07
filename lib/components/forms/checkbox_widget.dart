import 'package:flareline/themes/global_colors.dart';
import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? size;
  final ValueChanged<bool?>? onChanged;

  CheckBoxWidget({super.key, this.text, this.color, this.size, this.onChanged});

  final ValueNotifier<bool> isChecked = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    Color checkedColor = color ?? primary;
    return Row(mainAxisSize: MainAxisSize.min, children: [
      ValueListenableBuilder(
          valueListenable: isChecked,
          builder: (ctx, checked, child) {
            return InkWell(
              child: Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                    color: checked ? checkedColor : stroke,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: checked ? checkedColor : darkTextBody)),
                child: Icon(
                  Icons.check,
                  color: checked ? Colors.white : Colors.transparent,
                ),
              ),
              onTap: () {
                isChecked.value = !isChecked.value;
                if(onChanged!=null) {
                  onChanged!(isChecked.value);
                }
              },
            );
          }),
      const SizedBox(
        width: 10,
      ),
      Text(text ?? '')
    ]);
  }
}
