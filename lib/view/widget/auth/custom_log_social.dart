import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/view/widget/auth/custom_card_social.dart';
import 'package:flutter/material.dart';

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
            VerticalDivider(width: 112, color: ColorApp.border),
            Text(title, style: TextstyleApp.darkGrey14W400),
            VerticalDivider(width: 112, color: ColorApp.border),
          ],
        ),
        SizedBox(height: 14.0),
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
