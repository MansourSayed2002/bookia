import 'package:bookia/core/constants/image_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShowLogo extends StatelessWidget {
  const ShowLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 200.0, child: SvgPicture.asset(ImageApp.logo));
  }
}
