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
import 'package:bookia/feature/auth/presentation/Cubit/forget_pass_cubit/forgetpassword_cubit.dart';
import 'package:bookia/feature/auth/presentation/screen/check_verifycode_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: CustomButtonBackGlobal()),
      body: BlocProvider.value(
        value: ForgetpasswordCubit(),
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
    var cubit = context.read<ForgetpasswordCubit>();
    return BlocListener<ForgetpasswordCubit, ForgetpasswordState>(
      listener: (context, state) {
        if (state is ForgetpasswordLoading) {
          loadingWidget(context);
        } else if (state is ForgetpasswordSuccess) {
          context.pushRepalceMent(CheckVerifycodeView(email: cubit.email.text));
        } else if (state is ForgetpasswordError) {
          context.pop();
          context.messageBar(state.message);
        }
      },
      child: Form(
        key: cubit.key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(TextApp.forgetPassword, style: TextstyleApp.black30W400),
            SizedBox(height: 10.0),
            Text(
              TextApp.titleforget,
              style: TextstyleApp.grey14W400.copyWith(fontSize: 16.0),
            ),
            SizedBox(height: 30.0),
            CustomTextFromGlobal(
              controller: cubit.email,
              hinttext: TextApp.enterYourEmail,
              validator: (value) {
                return validationField("email", 8, 40, value);
              },
            ),
            SizedBox(height: 30.0),
            CustomElevatedButtonGlobal(
              onatp: () {
                cubit.valid();
              },
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
        ),
      ),
    );
  }
}
