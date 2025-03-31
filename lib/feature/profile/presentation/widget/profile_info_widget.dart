import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = context.read<ProfileCubit>();
        return Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40.0,
                backgroundImage:
                    cubit.profileModel?.data?.image != null
                        ? NetworkImage(cubit.profileModel!.data!.image!)
                        : null,
              ),
              Gap(13.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cubit.profileModel?.data?.name.toString() ?? "",
                      style: TextstyleApp.white20W400.copyWith(
                        color: ColorApp.black,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      cubit.profileModel?.data?.email.toString() ?? "",
                      style: TextstyleApp.grey14W400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
