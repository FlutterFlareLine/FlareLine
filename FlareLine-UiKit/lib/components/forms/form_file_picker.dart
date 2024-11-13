library flareline_uikit;
import 'package:file_picker/file_picker.dart';
import 'package:flareline_uikit/core/theme/flareline_colors.dart';
import 'package:flutter/material.dart';

typedef ValueChanged<PlatformFile> = void Function(PlatformFile value);

class FormFilePicker extends StatelessWidget {
  final String? title;

  final List<String>? allowExtention;

  final ValueChanged<PlatformFile>? onSelected;

  final ValueNotifier<String?> valueNotifier = ValueNotifier(null);

  FormFilePicker({super.key, this.title, this.allowExtention, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title ?? 'Select file'),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: FlarelineColors.background, width: 0.5),
              borderRadius: BorderRadius.circular(2)),
          child: InkWell(
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  color: Colors.grey.withOpacity(0.2),
                  child: const Text('Select File'),
                ),
                const VerticalDivider(),
                const SizedBox(
                  width: 20,
                ),
                ValueListenableBuilder(
                    valueListenable: valueNotifier,
                    builder: (context, value, child) {
                      return Text(value ?? 'Nothing Selected');
                    })
              ],
            ),
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: allowExtention != null ? FileType.custom : FileType.any,
                allowedExtensions: allowExtention,
              );

              if (result != null) {
                valueNotifier.value = result.files.first.name;
                if (onSelected != null) {
                  onSelected!(result.files.first);
                }
              } else {
                valueNotifier.value = '';
              }
            },
          ),
        )
      ],
    );
  }
}
