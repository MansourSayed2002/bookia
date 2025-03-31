import 'package:bookia/core/class/local_storage.dart';
import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/extensions/message_bar.dart';
import 'package:bookia/core/extensions/navigator_app.dart';
import 'package:bookia/core/shared/custom_another_page_global.dart';
import 'package:bookia/core/shared/custom_button_back_global.dart';
import 'package:bookia/core/shared/custom_elevated_button_global.dart';
import 'package:bookia/core/shared/custom_text_from_global.dart';
import 'package:bookia/core/shared/loading_widget.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/auth/presentation/Cubit/login_cubit/login_cubit.dart';
import 'package:bookia/feature/auth/presentation/screen/forget_password_view.dart';
import 'package:bookia/feature/auth/presentation/screen/register_view.dart';
import 'package:bookia/feature/auth/presentation/widget/custom_log_social.dart';
import 'package:bookia/feature/main/presentation/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: CustomButtonBackGlobal()),
      body: BlocProvider.value(
        value: LoginCubit(),
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
    var cubit = context.read<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          LocalStorage.saveData(
            "token",
            cubit.usersModel.data!.token.toString(),
          );
          context.removeUntile(MainScreen());
        } else if (state is LoginError) {
          context.pop();
          context.messageBar(state.message);
        } else if (state is LoginLoading) {
          loadingWidget(context);
        }
      },
      builder:
          (context, state) => ListView(
            children: [
              Text(TextApp.titleLogIn, style: TextstyleApp.black30W400),
              SizedBox(height: 32.0),
              CustomTextFromGlobal(
                controller: cubit.email,
                hinttext: TextApp.username,
              ),
              CustomTextFromGlobal(
                obscureText: cubit.isshow,
                controller: cubit.password,
                hinttext: TextApp.enterPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    cubit.isShow();
                  },
                  icon: SvgPicture.asset(IconApp.visibility),
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
                    style: TextstyleApp.grey14W400,
                  ),
                ),
              ),
              CustomElevatedButtonGlobal(
                onatp: () {
                  cubit.logIn();
                },
                backgroundcolor: ColorApp.primery,
                colorTitle: ColorApp.white,
                title: TextApp.logIn,
              ),
              Gap(34.0),
              CustomLogSocial(title: TextApp.orLogIn),
              Gap(120.0),
              CustomAnotherPageGlobal(
                textone: TextApp.notHaveAccount,
                texttwo: TextApp.regisNow,
                ontap: () {
                  context.pushRepalceMent(RegisterView());
                },
              ),
            ],
          ),
    );
  }
}
