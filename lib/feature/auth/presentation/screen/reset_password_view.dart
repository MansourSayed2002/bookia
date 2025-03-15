import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/shared/custom_another_page_global.dart';
import 'package:bookia/core/shared/custom_button_back_global.dart';
import 'package:bookia/core/shared/custom_elevated_button_global.dart';
import 'package:bookia/core/shared/custom_text_from_global.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBar(
        backgroundColor: ColorApp.white,
        leading: CustomButtonBackGlobal(),
      ),
      body: Padding(padding: const EdgeInsets.all(22.0), child: CustomBody()),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(TextApp.createNewPassword, style: TextstyleApp.black30W400),
        Gap(10),
        Text(
          TextApp.bodyReset,
          style: TextstyleApp.grey14W400.copyWith(fontSize: 16.0),
        ),
        Gap(32),
        CustomTextFromGlobal(hinttext: TextApp.username),
        CustomTextFromGlobal(hinttext: TextApp.enterPassword),
        Gap(38),
        CustomElevatedButtonGlobal(
          onatp: () {},
          backgroundcolor: ColorApp.primery,
          colorTitle: ColorApp.white,
          title: TextApp.logIn,
        ),
        Expanded(child: SizedBox()),
        CustomAnotherPageGlobal(
          textone: TextApp.notHaveAccount,
          texttwo: TextApp.regisNow,
          ontap: () {},
        ),
      ],
    );
  }
}
