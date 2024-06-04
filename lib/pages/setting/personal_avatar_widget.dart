import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:flareline/flutter_gen/app_localizations.dart';

class PersonalAvatarWidget extends StatelessWidget {
  const PersonalAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonCard(
        title: AppLocalizations.of(context)!.yourPhoto,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://nextjs-demo.tailadmin.com/_next/image?url=%2Fimages%2Fuser%2Fuser-01.png&w=256&q=75'),
                radius: 22,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                children: [
                  Text(AppLocalizations.of(context)!.editYourPhoto),
                  Row(
                    children: [
                      Text(AppLocalizations.of(context)!.delete),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(AppLocalizations.of(context)!.update)
                    ],
                  )
                ],
              ),
              Spacer()
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            color: GlobalColors.gray,
            child: Stack(
              children: [
                // DropzoneView(
                //   operation: DragOperation.copy,
                //   cursor: CursorType.grab,
                //   onCreated: (DropzoneViewController ctrl) =>
                //       dropzoneViewController = ctrl,
                //   onLoaded: () => debugPrint('Zone loaded'),
                //   onError: (String? ev) => debugPrint('Error: $ev'),
                //   onHover: () => debugPrint('Zone hovered'),
                //   onDrop: (dynamic ev) => debugPrint('Drop: $ev'),
                //   onDropMultiple: (List<dynamic>? ev) =>
                //       debugPrint('Drop multiple: $ev'),
                //   onLeave: () => debugPrint('Zone left'),
                // ),
                Center(
                    child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Icon(Icons.upload),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(AppLocalizations.of(context)!.clickToUpload),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('SVG,PNG,JPG or GIF'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('max,800 X 800px'),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                )),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(),
              SizedBox(
                width: 60,
                child: ButtonWidget(
                  btnText: AppLocalizations.of(context)!.cancel,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              SizedBox(
                  width: 60,
                  child: ButtonWidget(
                      type: ButtonType.primary.type,
                      btnText: AppLocalizations.of(context)!.save)),
            ],
          )
        ]));
  }
}
