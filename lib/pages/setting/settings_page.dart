import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flareline/components/buttons/button_widget.dart';
import 'package:flareline/components/card/common_card.dart';
import 'package:flareline/components/forms/outborder_text_form_field.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends LayoutWidget {
  SettingsPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    return AppLocalizations.of(context)!.settings;
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: _desktopWidget,
      mobile: _mobileWidget,
      tablet: _mobileWidget,
    );
  }

  Widget _desktopWidget(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _leftWidget(context),
          flex: 3,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: _rightWidget(context),
          flex: 2,
        )
      ],
    );
  }

  Widget _mobileWidget(BuildContext context) {
    return Column(
      children: [
        _leftWidget(context),
        const SizedBox(
          height: 16,
        ),
        _rightWidget(context)
      ],
    );
  }

  _titleWidget(String title, Widget childWidget) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        height: 50,
        padding: const EdgeInsets.only(left: 10),
        alignment: Alignment.centerLeft,
        child: Text(title),
      ),
      const Divider(
        height: 1,
      ),
      Padding(padding: const EdgeInsets.all(16), child: childWidget)
    ]);
  }

  ValueNotifier<String> dateNotifier = ValueNotifier("");

  ValueNotifier<bool> checkNotifier = ValueNotifier(false);
  ValueNotifier<bool> checkNotifier1 = ValueNotifier(false);
  ValueNotifier<bool> checkNotifier3 = ValueNotifier(false);

  _leftWidget(BuildContext context) {
    return Column(
      children: [
        CommonCard(
          child: _titleWidget(
            AppLocalizations.of(context)!.personalInfo,
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: OutBorderTextFormField(
                                  icon: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: SvgPicture.asset(
                                      'assets/icon/user.svg',
                                      width: 22,
                                      height: 22,
                                    ),
                                  ),
                                  labelText:
                                      AppLocalizations.of(context)!.fullName,
                                  hintText: AppLocalizations.of(context)!
                                      .fullNameHint)),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                              child: OutBorderTextFormField(
                                  labelText:
                                      AppLocalizations.of(context)!.phoneNumber,
                                  hintText: AppLocalizations.of(context)!
                                      .phoneNumberHint))
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      OutBorderTextFormField(
                        labelText: AppLocalizations.of(context)!.email,
                        hintText: AppLocalizations.of(context)!.emailHint,
                        icon: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: SvgPicture.asset(
                            'assets/signin/email.svg',
                            width: 22,
                            height: 22,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      OutBorderTextFormField(
                          labelText: AppLocalizations.of(context)!.userName,
                          hintText: AppLocalizations.of(context)!.userNameHint),
                      const SizedBox(
                        height: 16,
                      ),
                      OutBorderTextFormField(
                          maxLines: 5,
                          labelText: AppLocalizations.of(context)!.bio,
                          icon: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: SvgPicture.asset(
                              'assets/icon/edit.svg',
                              width: 22,
                              height: 22,
                            ),
                          ),
                          hintText:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque posuere fermentum urna, eu condimentum mauris tempus ut. Donec fermentum blandit aliquet.'),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                              width: 60,
                              child: ButtonWidget(
                                btnText: AppLocalizations.of(context)!.cancel,
                                isPrimary: false,
                              )),
                          const SizedBox(
                            width: 12,
                          ),
                          SizedBox(
                              width: 60,
                              child: ButtonWidget(
                                  btnText: AppLocalizations.of(context)!.save)),
                        ],
                      )
                    ])),
          ),
        ),
      ],
    );
  }

  DropzoneViewController? dropzoneViewController;

  _rightWidget(BuildContext context) {
    return CommonCard(
        child: _titleWidget(
      AppLocalizations.of(context)!.yourPhoto,
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    isPrimary: false,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                SizedBox(
                    width: 60,
                    child: ButtonWidget(
                        btnText: AppLocalizations.of(context)!.save)),
              ],
            )
          ])),
    ));
  }
}
