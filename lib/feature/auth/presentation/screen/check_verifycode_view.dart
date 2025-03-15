import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/extensions/navigator_app.dart';
import 'package:bookia/core/shared/custom_another_page_global.dart';
import 'package:bookia/core/shared/custom_button_back_global.dart';
import 'package:bookia/core/shared/custom_elevated_button_global.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/auth/presentation/screen/reset_password_view.dart';
import 'package:bookia/feature/auth/presentation/widget/opt_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckVerifycodeView extends StatelessWidget {
  const CheckVerifycodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      appBar: AppBar(
        backgroundColor: ColorApp.white,
        leading: CustomButtonBackGlobal(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(TextApp.titleOpt, style: TextstyleApp.black30W400),
            Gap(10.0),
            Text(
              TextApp.bodyOpt,
              style: TextstyleApp.black15W400.copyWith(
                fontSize: 16.0,
                color: ColorApp.grey,
              ),
            ),
            Gap(32.0),
            OptWidget(onCompleted: (value) {}),
            Gap(35.0),
            CustomElevatedButtonGlobal(
              onatp: () {
                context.push(ResetPasswordView());
              },
              backgroundcolor: ColorApp.primery,
              colorTitle: ColorApp.white,
              title: TextApp.verify,
            ),
            Expanded(child: SizedBox()),
            CustomAnotherPageGlobal(
              textone: TextApp.notReceivedCode,
              texttwo: TextApp.resend,
              ontap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
