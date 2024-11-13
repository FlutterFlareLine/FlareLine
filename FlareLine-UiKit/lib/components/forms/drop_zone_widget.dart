import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flareline_uikit/core/theme/flareline_colors.dart';
import 'package:flutter/material.dart';

class DropZoneWidget extends StatelessWidget {
  final Widget? icon;
  final Widget? text;

  DropZoneWidget({super.key, this.text, this.icon});

  final ValueNotifier<List<String>> files = ValueNotifier([]);

  final ValueNotifier<bool> _dragging = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: DropTarget(
        onDragDone: (detail) {
          files.value.add(detail.files.first.name);
        },
        onDragEntered: (detail) {
          _dragging.value = true;
        },
        onDragExited: (detail) {
          _dragging.value = false;
        },
        child: ValueListenableBuilder(
          valueListenable: _dragging,
          builder: (ctx, isDragging, child) {
            return ValueListenableBuilder(
                valueListenable: files,
                builder: (ctx, index, child) {
                  return Container(
                    decoration: BoxDecoration(
                        color: isDragging
                            ? Colors.blue.withOpacity(0.4)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: FlarelineColors.border, width: 1)),
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: files.value.isEmpty
                        ? _emptyView()
                        : Text(files.value
                            .map((item) => item)
                            .toList()
                            .join("\n")),
                  );
                });
          },
        ),
      ),
      onTap: () async {
        _dragging.value = true;
        FilePickerResult? file =
            await FilePicker.platform.pickFiles(allowMultiple: false);
        print('file ---- ${file?.files.single.name}');
        if (file != null && file.files.single.name != null) {
          files.value.add(file.files.single.name);
        }
        _dragging.value = false;
      },
    );
  }

  Widget _emptyView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon ??
            Icon(
              Icons.cloud_upload_sharp,
              size: 60,
              color: Colors.grey,
            ),
        SizedBox(
          height: 20,
        ),
        text ??
            const Text(
              'Drop files here or click to upload',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Colors.grey),
            ),
      ],
    );
  }
}
