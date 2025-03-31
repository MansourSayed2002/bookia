import 'dart:developer';

import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/extensions/message_bar.dart';
import 'package:bookia/core/extensions/navigator_app.dart';
import 'package:bookia/core/function/validation.dart';
import 'package:bookia/core/shared/custom_another_page_global.dart';
import 'package:bookia/core/shared/custom_button_back_global.dart';
import 'package:bookia/core/shared/custom_elevated_button_global.dart';
import 'package:bookia/core/shared/custom_text_from_global.dart';
import 'package:bookia/core/shared/loading_widget.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/auth/presentation/Cubit/register_cubit/register_cubit.dart';
import 'package:bookia/feature/auth/presentation/screen/login_view.dart';
import 'package:bookia/feature/auth/presentation/widget/custom_log_social.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: CustomButtonBackGlobal()),
      body: BlocProvider.value(
        value: RegisterCubit(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
    var cubit = context.read<RegisterCubit>();

    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          context.pop();
          context.messageBar("Congratulation", Colors.green);
          log("success");
        } else if (state is RegisterError) {
          context.pop();
          context.messageBar(state.message);
        } else if (state is RegisterLoading) {
          loadingWidget(context);
        }
      },
      child: Form(
        key: cubit.key,
        child: ListView(
          children: [
            Text(TextApp.titleRegis, style: TextstyleApp.black30W400),
            Gap(30.0),
            CustomTextFromGlobal(
              controller: cubit.name,
              hinttext: TextApp.username,
              validator: (value) {
                return validationField("text", 3, 40, value);
              },
            ),
            CustomTextFromGlobal(
              controller: cubit.email,
              hinttext: TextApp.email,
              validator: (value) {
                return validationField("email", 10, 60, value);
              },
            ),
            CustomTextFromGlobal(
              controller: cubit.password,
              hinttext: TextApp.password,
              validator: (value) {
                return validationField("numtext", 8, 30, value);
              },
            ),
            CustomTextFromGlobal(
              controller: cubit.configPassword,
              hinttext: TextApp.conpassword,
              validator: (value) {
                return validationField("numtext", 8, 30, value);
              },
            ),
            Gap(12.0),
            CustomElevatedButtonGlobal(
              onatp: () {
                cubit.valid();
              },
              backgroundcolor: ColorApp.primery,
              colorTitle: ColorApp.white,
              title: TextApp.logIn,
            ),
            Gap(20.0),
            CustomLogSocial(title: TextApp.orRegister),
            Gap(40.0),
            CustomAnotherPageGlobal(
              textone: TextApp.alreadyacount,
              texttwo: TextApp.logNow,
              ontap: () {
                context.pushRepalceMent(LoginView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
