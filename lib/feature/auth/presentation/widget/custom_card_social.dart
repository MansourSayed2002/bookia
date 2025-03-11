import 'package:bookia/core/theme/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCardSocial extends StatelessWidget {
  const CustomCardSocial({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105.0,
      height: 56.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: ColorApp.border),
      ),
      child: SvgPicture.asset(image),
    );
  }
}
