import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/auth/presentation/widget/custom_card_social.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomLogSocial extends StatelessWidget {
  const CustomLogSocial({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(child: Divider(color: ColorApp.border)),
            Text(title, style: TextstyleApp.grey14W400),
            Expanded(child: Divider(color: ColorApp.border)),
          ],
        ),
        Gap(14.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomCardSocial(image: ImageApp.face),
            CustomCardSocial(image: ImageApp.google),
            CustomCardSocial(image: ImageApp.apple),
          ],
        ),
      ],
    );
  }
}
