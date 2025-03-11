import 'package:bookia/core/constants/image_app.dart';
import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShowLogo extends StatelessWidget {
  const ShowLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 60.0,
          height: 60.0,
          child: SvgPicture.asset(ImageApp.logo),
        ),
        SizedBox(width: 11.0),
        Text(TextApp.bookia, style: TextstyleApp.black45W500),
      ],
    );
  }
}
