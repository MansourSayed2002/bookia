import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/extensions/navigator_app.dart';
import 'package:bookia/core/shared/custom_another_page_global.dart';
import 'package:bookia/core/shared/custom_button_back_global.dart';
import 'package:bookia/core/shared/custom_elevated_button_global.dart';
import 'package:bookia/core/shared/custom_text_from_global.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/auth/presentation/screen/forget_password_view.dart';
import 'package:bookia/feature/auth/presentation/screen/register_view.dart';
import 'package:bookia/feature/auth/presentation/widget/custom_log_social.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
          TextApp.titleLogIn,
          style: TextstyleApp.black20W400.copyWith(fontSize: 30.0),
        ),
        SizedBox(height: 32.0),
        CustomTextFromGlobal(hinttext: TextApp.username),
        CustomTextFromGlobal(
          hinttext: TextApp.enterPassword,
          suffixIcon: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(ImageApp.visibility),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              context.push(ForgetPasswordView());
            },
            child: Text(
              TextApp.forgetPassword,
              style: TextstyleApp.darkGrey14W400,
            ),
          ),
        ),
        CustomElevatedButtonGlobal(
          onatp: () {},
          backgroundcolor: ColorApp.primery,
          colorTitle: ColorApp.white,
          title: TextApp.logIn,
        ),
        SizedBox(height: 34.0),
        CustomLogSocial(title: TextApp.orLogIn),
        SizedBox(height: 120.0),
        CustomAnotherPageGlobal(
          textone: TextApp.notHaveAccount,
          texttwo: TextApp.regisNow,
          ontap: () {
            context.pushRepalceMent(RegisterView());
          },
        ),
      ],
    );
  }
}
