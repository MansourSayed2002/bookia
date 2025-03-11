import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/extensions/navigator_app.dart';
import 'package:bookia/core/shared/custom_another_page_global.dart';
import 'package:bookia/core/shared/custom_button_back_global.dart';
import 'package:bookia/core/shared/custom_elevated_button_global.dart';
import 'package:bookia/core/shared/custom_text_from_global.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/auth/presentation/screen/login_view.dart';
import 'package:bookia/feature/auth/presentation/widget/custom_log_social.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
    return ListView(
      children: [
        Text(
          TextApp.titleRegis,
          style: TextstyleApp.black20W400.copyWith(fontSize: 30.0),
        ),
        SizedBox(height: 30.0),
        CustomTextFromGlobal(hinttext: TextApp.username),
        CustomTextFromGlobal(hinttext: TextApp.email),
        CustomTextFromGlobal(hinttext: TextApp.password),
        CustomTextFromGlobal(hinttext: TextApp.conpassword),
        SizedBox(height: 12.0),
        CustomElevatedButtonGlobal(
          onatp: () {},
          backgroundcolor: ColorApp.primery,
          colorTitle: ColorApp.white,
          title: TextApp.logIn,
        ),
        SizedBox(height: 20.0),
        CustomLogSocial(title: TextApp.orRegister),
        SizedBox(height: 40.0),
        CustomAnotherPageGlobal(
          textone: TextApp.alreadyacount,
          texttwo: TextApp.logNow,
          ontap: () {
            context.pushRepalceMent(LoginView());
          },
        ),
      ],
    );
  }
}
