import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FormFilePicker extends StatelessWidget {
  final String? title;
  final List<String>? allowExtention;
  FormFilePicker({super.key, this.title, this.allowExtention});

  ValueNotifier<String?> valueNotifier = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title ?? 'Select file'),
        SizedBox(
          height: 10.h,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
              borderRadius: BorderRadius.circular(2)),
          child: InkWell(
            child: Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  color: Colors.grey.withOpacity(0.2),
                  child: Text('Select File'),
                ),
                VerticalDivider(),
                SizedBox(
                  width: 20.w,
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
                type: this.allowExtention != null
                    ? FileType.custom
                    : FileType.any,
                allowedExtensions: this.allowExtention,
              );

              if (result != null) {
                print(result.files.first);
                valueNotifier.value = result.files.first.name;
              } else {
                // User canceled the picker
              }
            },
          ),
        )
      ],
    );
  }
}
