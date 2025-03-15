import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/extensions/navigator_app.dart';
import 'package:bookia/core/shared/custom_elevated_button_global.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/auth/presentation/screen/login_view.dart';
import 'package:bookia/feature/auth/presentation/screen/register_view.dart';
import 'package:bookia/feature/intro/presentation/widget/show_logo.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageApp.photo),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              ShowLogo(),
              Gap(15.0),
              Text(TextApp.titleOnboarding, style: TextstyleApp.black18W400),
              Spacer(flex: 5),
              CustomElevatedButtonGlobal(
                backgroundcolor: ColorApp.primery,
                colorTitle: ColorApp.white,
                title: TextApp.logIn,
                onatp: () {
                  context.push(LoginView());
                },
              ),
              Gap(15.0),
              CustomElevatedButtonGlobal(
                backgroundcolor: ColorApp.white,
                colorborder: ColorApp.black,
                title: TextApp.register,
                onatp: () {
                  context.push(RegisterView());
                },
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
