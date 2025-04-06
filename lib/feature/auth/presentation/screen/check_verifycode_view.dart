import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/extensions/message_bar.dart';
import 'package:bookia/core/extensions/navigator_app.dart';
import 'package:bookia/core/function/validation.dart';
import 'package:bookia/core/shared/custom_another_page_global.dart';
import 'package:bookia/core/shared/custom_button_back_global.dart';
import 'package:bookia/core/shared/custom_elevated_button_global.dart';
import 'package:bookia/core/shared/loading_widget.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/auth/presentation/Cubit/verifycode_cubit/verifycode_cubit.dart';
import 'package:bookia/feature/auth/presentation/screen/reset_password_view.dart';
import 'package:bookia/feature/auth/presentation/widget/opt_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CheckVerifycodeView extends StatelessWidget {
  const CheckVerifycodeView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: CustomButtonBackGlobal()),
      body: BlocProvider.value(
        value: VerifycodeCubit()..email = email,
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
    var cubit = context.read<VerifycodeCubit>();
    return BlocListener<VerifycodeCubit, VerifycodeState>(
      listener: (context, state) {
        if (state is VerifycodeLoading) {
          loadingWidget(context);
        } else if (state is VerifycodeSuccess) {
          context.pushRepalceMent(ResetPasswordView(opt: cubit.opt.text));
        } else if (state is VerifycodeError) {
          context.pop();
          context.messageBar(state.message);
        }
      },
      child: Form(
        key: cubit.key,
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
            OptWidget(
              controller: cubit.opt,
              validator: (value) {
                return validationField("number", 6, 6, value);
              },
            ),
            Gap(35.0),
            CustomElevatedButtonGlobal(
              onatp: () {
                cubit.valid();
              },
              backgroundcolor: ColorApp.primery,
              colorTitle: ColorApp.white,
              title: TextApp.verify,
              width: double.infinity,
            ),
            Expanded(child: SizedBox()),
            CustomAnotherPageGlobal(
              textone: TextApp.notReceivedCode,
              texttwo: TextApp.resend,

              ontap: () {
                cubit.verifyEmail();
              },
            ),
          ],
        ),
      ),
    );
  }
}
