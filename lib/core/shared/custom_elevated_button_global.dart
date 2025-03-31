import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:flutter/material.dart';

class CustomElevatedButtonGlobal extends StatelessWidget {
  const CustomElevatedButtonGlobal({
    super.key,
    required this.onatp,
    required this.backgroundcolor,
    required this.title,
    this.style,
    this.colorborder,
    this.width,
    this.colorTitle,
  });
  final Function() onatp;
  final Color backgroundcolor;
  final TextStyle? style;
  final Color? colorTitle;
  final Color? colorborder;
  final String title;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 56.0,
      child: ElevatedButton(
        onPressed: onatp,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundcolor,
          side: BorderSide(color: colorborder ?? ColorApp.primery),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          title,
          style: style ?? TextstyleApp.black15W400.copyWith(color: colorTitle),
        ),
      ),
    );
  }
}
