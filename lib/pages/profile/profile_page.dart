import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flutter/material.dart';

import 'package:flareline/pages/layout.dart';
import 'package:flareline/flutter_gen/app_localizations.dart';

class ProfilePage extends LayoutWidget {
  const ProfilePage({super.key});

  @override
  String breakTabTitle(BuildContext context) {
    // TODO: implement title
    return AppLocalizations.of(context)!.profile;
  }

  @override
  Widget contentDesktopWidget(BuildContext context) {
    return CommonCard(
      child: Stack(children: [
        SizedBox(
          height: 180,
          child: Stack(children: [
            Image.asset(
              'assets/cover/cover-01.png',
              height: 180,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: const EdgeInsets.all(10),
                color: Colors.blueAccent,
                child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Edit',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            )
          ]),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 130,
              ),
              SizedBox(
                width: 144,
                height: 144,
                child: Stack(children: [
                  CircleAvatar(
                    radius: 72,
                    backgroundColor: Colors.greenAccent,
                    child: Image.asset('assets/user/user-01.png'),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      alignment: Alignment.center,
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(45)),
                      margin: EdgeInsets.all(2),
                      child: const Icon(
                        Icons.camera_enhance,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Danish Heilium',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Ui/Ux Designer',
                style: TextStyle(fontSize: 10),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 100),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1)),
                child: Row(children: [
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                          text: '259',
                          children: [
                            TextSpan(
                                text:
                                    ' ${AppLocalizations.of(context)!.posts}'),
                          ],
                          style: TextStyle(fontSize: 16)),
                    ),
                  )),
                  const VerticalDivider(
                    width: 1,
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                          text: '129K',
                          children: [
                            TextSpan(
                                text:
                                    ' ${AppLocalizations.of(context)!.followers}')
                          ],
                          style: TextStyle(fontSize: 16)),
                    ),
                  )),
                  const VerticalDivider(
                    width: 1,
                  ),
                  Expanded(
                      child: Container(
                    alignment: Alignment.center,
                    child: Text.rich(
                      TextSpan(
                          text: '2K',
                          children: [TextSpan(text: ' Following')],
                          style: TextStyle(fontSize: 16)),
                    ),
                  ))
                ]),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                AppLocalizations.of(context)!.aboutMe,
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                alignment: Alignment.center,
                width: 400,
                child: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque posuere fermentum urna, eu condimentum mauris tempus ut. Donec fermentum blandit aliquet. Etiam dictum dapibus ultricies. Sed vel aliquet libero. Nunc a augue fermentum, pharetra ligula sed, aliquam lacus.',
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                AppLocalizations.of(context)!.followMeOn,
                style: const TextStyle(fontSize: 10),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        )
      ]),
    );
  }
}
