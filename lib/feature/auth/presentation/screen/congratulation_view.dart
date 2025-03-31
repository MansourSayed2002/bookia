import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/shared/custom_elevated_button_global.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CongratulationView extends StatelessWidget {
  const CongratulationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(ImageApp.stricker, width: 100.0),
            Gap(35),
            Text(
              TextApp.passwordChanged,
              style: TextstyleApp.black30W400.copyWith(fontSize: 26.0),
            ),
            Gap(3),
            Text(
              TextApp.bodypasschange,
              textAlign: TextAlign.center,
              style: TextstyleApp.grey14W400.copyWith(fontSize: 15.0),
            ),
            Gap(40),
            CustomElevatedButtonGlobal(
              onatp: () {},
              backgroundcolor: ColorApp.primery,
              colorTitle: ColorApp.white,
              title: TextApp.backToLogin,
            ),
          ],
        ),
      ),
    );
  }
}
