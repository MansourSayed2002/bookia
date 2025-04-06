import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/extensions/message_bar.dart';
import 'package:bookia/core/extensions/navigator_app.dart';
import 'package:bookia/core/function/validation.dart';
import 'package:bookia/core/shared/custom_button_back_global.dart';
import 'package:bookia/core/shared/custom_text_from_global.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/main/presentation/screen/main_screen.dart';
import 'package:bookia/feature/profile/data/model/profile_model/profile_model.dart';
import 'package:bookia/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia/feature/profile/presentation/widget/buttomnavigatonbar_widget.dart';
import 'package:bookia/feature/profile/presentation/widget/image_profile_widegt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key, required this.profileModel});
  final ProfileModel profileModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ProfileCubit()..init(profileModel),
      child: Scaffold(
        appBar: AppBar(
          leading: CustomButtonBackGlobal(),
          centerTitle: true,
          title: Text(
            TextApp.updateProfile,
            style: TextstyleApp.black18W400.copyWith(fontSize: 24.0),
          ),
        ),
        bottomNavigationBar: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            var cubit = context.read<ProfileCubit>();
            return ButtomnavigatonbarWidget(
              title: TextApp.save,
              onTap: () {
                cubit.valid();
              },
            );
          },
        ),
        body: CustomBody(profileModel: profileModel),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key, required this.profileModel});
  final ProfileModel profileModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileSuccess) {
          context.removeUntile(MainScreen());
        } else if (state is ProfileError) {
          context.messageBar(state.message);
        }
      },
      builder: (context, state) {
        var cubit = context.read<ProfileCubit>();
        return Form(
          key: cubit.key,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Gap(35.0),
                  ImageProfileWidegt(
                    image: profileModel.data?.image ?? '',
                    onTap: () {},
                  ),
                  Gap(40.0),
                  CustomTextFromGlobal(
                    controller: cubit.nameController,
                    hinttext: TextApp.name,
                    validator: (value) {
                      return validationField("text", 3, 40, value);
                    },
                  ),
                  CustomTextFromGlobal(
                    controller: cubit.phoneController,
                    hinttext: TextApp.phone,
                    validator: (value) {
                      return validationField("Phone", 11, 11, value);
                    },
                  ),
                  CustomTextFromGlobal(
                    controller: cubit.addressController,
                    hinttext: TextApp.address,
                    validator: (value) {
                      return validationField("text", 3, 40, value);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
