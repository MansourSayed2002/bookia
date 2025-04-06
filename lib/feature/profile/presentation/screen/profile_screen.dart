import 'package:bookia/core/class/local_storage.dart';
import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/extensions/navigator_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/intro/presentation/screen/onboarding_view.dart';
import 'package:bookia/feature/order/presentation/screen/order_screen.dart';
import 'package:bookia/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:bookia/feature/profile/presentation/screen/update_profile_screen.dart';
import 'package:bookia/feature/update_pass/presentation/screen/update_password_screen.dart';
import 'package:bookia/feature/profile/presentation/widget/card_item_widget.dart';
import 'package:bookia/feature/profile/presentation/widget/profile_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          TextApp.profile,
          style: TextstyleApp.black30W400.copyWith(fontSize: 24),
        ),
        actions: [
          IconButton(
            onPressed: () {
              LocalStorage.sharedPreferences.clear();
              context.removeUntile(OnboardingView());
            },
            icon: SvgPicture.asset(IconApp.logOut),
          ),
        ],
      ),
      body: BlocProvider.value(
        value: ProfileCubit()..getDataOfProfile(),
        child: CustomBody(),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder:
          (context, state) => Column(
            children: [
              ProfileInfoWidget(),
              Gap(25.0),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 24.0),
                child: Column(
                  children: [
                    CardItemWidget(
                      onPressed: () {
                        context.push(OrderScreen());
                      },
                      title: TextApp.myOrder,
                    ),
                    CardItemWidget(
                      onPressed: () {
                        context.push(
                          UpdateProfileScreen(
                            profileModel:
                                context.read<ProfileCubit>().profileModel!,
                          ),
                        );
                      },
                      title: TextApp.editProfile,
                    ),
                    CardItemWidget(
                      onPressed: () {
                        context.push(UpdatePasswordView());
                      },
                      title: TextApp.resetPassword,
                    ),
                    CardItemWidget(onPressed: () {}, title: TextApp.fAQ),
                    CardItemWidget(onPressed: () {}, title: TextApp.contactUs),
                    CardItemWidget(
                      onPressed: () {},
                      title: TextApp.privacyTerms,
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
