import 'package:flareline/flutter_gen/app_localizations.dart';
import 'package:flareline/pages/layout.dart';
import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/card/title_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:toastification/toastification.dart';
import 'package:url_launcher/url_launcher.dart';

class ToastPage extends LayoutWidget {
  const ToastPage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement breakTabTitle
    return 'Toast';
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return Column(
      children: [
        TitleCard(title: 'Message Toast', childWidget: _messageToast(context)),
        const SizedBox(
          height: 20,
        ),

      ],
    );
  }

  _messageToast(BuildContext context) {
    return Column(
      children: [
        ButtonWidget(
          btnText: AppLocalizations.of(context)!.info,
          type: ButtonType.info.type,
          onTap: (){
            toastification.show(
              context: context,
              type: ToastificationType.info,
              style: ToastificationStyle.flat,
              title: Text(AppLocalizations.of(context)!.info),
              alignment: Alignment.topCenter,
              showProgressBar: false,
              autoCloseDuration: const Duration(seconds: 4),
            );
          },
        ),
        const SizedBox(height: 20,),
        ButtonWidget(
          btnText: AppLocalizations.of(context)!.success,
          type: ButtonType.success.type,
          onTap: (){
            toastification.show(
              context: context,
              type: ToastificationType.success,
              style: ToastificationStyle.flat,
              title:  Text(AppLocalizations.of(context)!.success),
              alignment: Alignment.topCenter,
              showProgressBar: false,
              autoCloseDuration: const Duration(seconds: 4),
            );
          },
        ),
        const SizedBox(height: 20,),
        ButtonWidget(
          btnText: AppLocalizations.of(context)!.warn,
          type: ButtonType.warn.type,
          onTap: (){
            toastification.show(
              context: context,
              type: ToastificationType.warning,
              style: ToastificationStyle.flat,
              title: Text(AppLocalizations.of(context)!.warn),
              alignment: Alignment.topCenter,
              showProgressBar: false,
              autoCloseDuration: const Duration(seconds: 4),
            );
          },
        ),
        const SizedBox(height: 20,),
        ButtonWidget(
          btnText: AppLocalizations.of(context)!.danger,
          type: ButtonType.danger.type,
          onTap: (){
            toastification.show(
              context: context,
              type: ToastificationType.error,
              style: ToastificationStyle.flat,
              title:  Text(AppLocalizations.of(context)!.danger),
              alignment: Alignment.topCenter,
              showProgressBar: false,
              autoCloseDuration: const Duration(seconds: 4),
            );
          },
        ),
        const SizedBox(height: 20,),
        ButtonWidget(
          btnText: AppLocalizations.of(context)!.tryMore,
          type: ButtonType.dark.type,
          onTap: () async {
            String url='https://payamzahedi.com/toastification/';
            Uri uri = Uri.parse(url);
            if(await canLaunchUrl(uri)){
              launchUrl(uri);
            }
          },
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}
