import 'package:flareline/pages/auth/sign_in/sign_in_provider.dart';
import 'package:flareline/provider/firebase_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flareline_uikit/components/buttons/button_widget.dart';
import 'package:flareline_uikit/components/card/common_card.dart';
import 'package:flareline_uikit/components/forms/outborder_text_form_field.dart';
import 'package:flareline/core/theme/global_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (ctx) => SignInProvider(ctx),
        builder: (ctx, child) {
          return ResponsiveBuilder(
            builder: (context, sizingInformation) {
              // Check the sizing information here and return your UI
              if (sizingInformation.deviceScreenType ==
                  DeviceScreenType.desktop) {
                return Center(
                  child: contentDesktopWidget(context),
                );
              }

              return contentMobileWidget(context);
            },
          );
        },
      ),
    );
  }

  Widget contentDesktopWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CommonCard(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
                child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.appName,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(AppLocalizations.of(context)!.slogan),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 350,
                  child: SvgPicture.asset('assets/signin/main.svg',
                      semanticsLabel: ''),
                )
              ],
            )),
            const VerticalDivider(
              width: 1,
              color: GlobalColors.background,
            ),
            Expanded(
              child: _signInFormWidget(context),
            )
          ]),
        )
      ],
    );
  }

  @override
  Widget contentMobileWidget(BuildContext context) {
    return CommonCard(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: _signInFormWidget(context));
  }

  Widget _signInFormWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.signIn,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            OutBorderTextFormField(
              labelText: AppLocalizations.of(context)!.email,
              hintText: AppLocalizations.of(context)!.emailHint,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty || !value.contains('@')) {
                  return 'Please enter a valid email address';
                } else {
                  return null;
                }
              },
              suffixWidget: SvgPicture.asset(
                'assets/signin/email.svg',
                width: 22,
                height: 22,
              ),
              controller: context.read<SignInProvider>().emailController,
            ),
            const SizedBox(
              height: 16,
            ),
            OutBorderTextFormField(
              obscureText: true,
              labelText: AppLocalizations.of(context)!.password,
              hintText: AppLocalizations.of(context)!.passwordHint,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                if (value!.isEmpty || value.length < 6) {
                  return 'Please enter a valid password';
                } else {
                  return null;
                }
              },
              suffixWidget: SvgPicture.asset(
                'assets/signin/lock.svg',
                width: 22,
                height: 22,
              ),
              controller: context.read<SignInProvider>().passwordController,
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              type: ButtonType.primary.type,
              btnText: AppLocalizations.of(context)!.signIn,
              onTap: () {
                context.read<SignInProvider>().signIn(context);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Expanded(
                    child: Divider(
                  height: 1,
                  color: GlobalColors.border,
                )),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text('OR'),
                ),
                const Expanded(
                    child: Divider(
                  height: 1,
                  color: GlobalColors.border,
                )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              color: Colors.white,
              borderColor: GlobalColors.border,
              iconWidget: SvgPicture.asset(
                'assets/brand/brand-01.svg',
                width: 25,
                height: 25,
              ),
              btnText: AppLocalizations.of(context)!.signInWithGoogle,
              onTap: () {
                context.read<SignInProvider>().signInWithGoogle(context);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              color: Colors.white,
              borderColor: GlobalColors.border,
              iconWidget: SvgPicture.asset(
                'assets/brand/brand-03.svg',
                width: 25,
                height: 25,
              ),
              btnText: AppLocalizations.of(context)!.signInWithGithub,
              onTap: () {
                context.read<SignInProvider>().signInWithGithub(context);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.dontHaveAccount),
                InkWell(
                  child: Text(
                    AppLocalizations.of(context)!.signUp,
                    style: const TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    Navigator.of(context).popAndPushNamed('/signUp');
                  },
                )
              ],
            )
          ],
        ));
  }
}
