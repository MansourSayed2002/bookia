import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/extensions/navigator_app.dart';
import 'package:bookia/core/shared/custom_another_page_global.dart';
import 'package:bookia/core/shared/custom_button_back_global.dart';
import 'package:bookia/core/shared/custom_elevated_button_global.dart';
import 'package:bookia/core/shared/custom_text_from_global.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBar(
        backgroundColor: ColorApp.white,
        leading: CustomButtonBackGlobal(),
      ),
      body: Padding(padding: const EdgeInsets.all(15.0), child: CustomBody()),
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
        Text(
          TextApp.forgetPassword,
          style: TextstyleApp.black15W400.copyWith(fontSize: 30.0),
        ),
        SizedBox(height: 10.0),
        Text(
          TextApp.titleforget,
          style: TextstyleApp.darkGrey14W400.copyWith(fontSize: 16.0),
        ),
        SizedBox(height: 30.0),
        CustomTextFromGlobal(hinttext: TextApp.enterYourEmail),
        SizedBox(height: 30.0),
        CustomElevatedButtonGlobal(
          onatp: () {},
          backgroundcolor: ColorApp.primery,
          colorTitle: ColorApp.white,
          title: TextApp.sendCode,
        ),
        Spacer(),
        CustomAnotherPageGlobal(
          textone: TextApp.memberPas,
          texttwo: TextApp.logIn,
          ontap: () {
            context.pop();
          },
        ),
      ],
    );
  }
}
