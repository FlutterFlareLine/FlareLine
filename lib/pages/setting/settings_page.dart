import 'package:flareline/pages/setting/personal_avatar_widget.dart';
import 'package:flareline/pages/setting/personal_info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

import 'package:flareline/pages/layout.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flareline/flutter_gen/app_localizations.dart';

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
    return const Column(
      children: [
        PersonalInfoWidget(),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  DropzoneViewController? dropzoneViewController;

  _rightWidget(BuildContext context) {
    return const PersonalAvatarWidget();
  }
}
