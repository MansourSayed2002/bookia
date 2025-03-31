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
import 'package:bookia/feature/update_pass/presentation/cubit/update_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class UpdatePasswordView extends StatelessWidget {
  const UpdatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: CustomButtonBackGlobal()),
      body: BlocProvider.value(
        value: UpdatePasswordCubit(),
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
    var cubit = context.read<UpdatePasswordCubit>();
    return BlocListener<UpdatePasswordCubit, UpdatePasswordState>(
      listener: (context, state) {
        if (state is ResetpasswordLoading) {
          loadingWidget(context);
        } else if (state is UpdatePasswordSuccess) {
          context.pop();
          context.messageBar("Done Changed Password", ColorApp.primery);
        } else if (state is UpdatePasswordError) {
          context.pop();
          context.messageBar(state.message);
        }
      },
      child: Form(
        key: cubit.key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(TextApp.newPassword, style: TextstyleApp.black30W400),
            Gap(73),
            CustomTextFromGlobal(
              controller: cubit.currentPassword,
              hinttext: TextApp.currentpassword,
              validator: (value) {
                return validationField("numtext", 8, 40, value);
              },
            ),
            Gap(15),
            CustomTextFromGlobal(
              controller: cubit.newPassword,
              hinttext: TextApp.newPassword,
              validator: (value) {
                return validationField("numtext", 8, 40, value);
              },
            ),
            Gap(15),
            CustomTextFromGlobal(
              controller: cubit.newConfigPassword,
              hinttext: TextApp.newconfigpassword,
              validator: (value) {
                return validationField("numtext", 8, 40, value);
              },
            ),
            Expanded(child: SizedBox()),
            CustomElevatedButtonGlobal(
              onatp: () {
                cubit.valid();
              },
              width: double.infinity,
              backgroundcolor: ColorApp.primery,
              colorTitle: ColorApp.white,
              title: TextApp.updatepassword,
            ),
          ],
        ),
      ),
    );
  }
}
