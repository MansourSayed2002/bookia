import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/extensions/message_bar.dart';
import 'package:bookia/core/extensions/navigator_app.dart';
import 'package:bookia/core/function/validation.dart';
import 'package:bookia/core/shared/custom_button_back_global.dart';
import 'package:bookia/core/shared/custom_elevated_button_global.dart';
import 'package:bookia/core/shared/custom_text_from_global.dart';
import 'package:bookia/core/shared/loading_widget.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/auth/presentation/Cubit/reset_password_cubit/resetpassword_cubit.dart';
import 'package:bookia/feature/intro/presentation/screen/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.opt});
  final String opt;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: CustomButtonBackGlobal()),
      body: BlocProvider.value(
        value: ResetpasswordCubit()..opt = opt,
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: CustomBody(),
        ),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ResetpasswordCubit>();
    return BlocListener<ResetpasswordCubit, ResetpasswordState>(
      listener: (context, state) {
        if (state is ResetpasswordLoading) {
          loadingWidget(context);
        } else if (state is ResetpasswordSuccess) {
          context.removeUntile(OnboardingView());
        } else if (state is ResetpasswordError) {
          context.pop();
          context.messageBar(state.message);
        }
      },
      child: Form(
        key: cubit.key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(TextApp.createNewPassword, style: TextstyleApp.black30W400),
            Gap(10),
            Text(
              TextApp.bodyReset,
              style: TextstyleApp.grey14W400.copyWith(fontSize: 16.0),
            ),
            Gap(32),
            CustomTextFromGlobal(
              controller: cubit.password,
              hinttext: TextApp.newPassword,
              validator: (value) {
                return validationField("numtext", 8, 40, value);
              },
            ),
            CustomTextFromGlobal(
              controller: cubit.configPassword,
              hinttext: TextApp.newconfigpassword,
              validator: (value) {
                return validationField("numtext", 8, 40, value);
              },
            ),
            Gap(38),
            CustomElevatedButtonGlobal(
              onatp: () {
                cubit.valid();
              },
              backgroundcolor: ColorApp.primery,
              colorTitle: ColorApp.white,
              title: TextApp.reset,
            ),
          ],
        ),
      ),
    );
  }
}
