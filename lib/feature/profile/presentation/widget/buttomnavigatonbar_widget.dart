import 'package:bookia/core/shared/custom_elevated_button_global.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:flutter/material.dart';

class ButtomnavigatonbarWidget extends StatelessWidget {
  const ButtomnavigatonbarWidget({
    super.key,
    required this.onTap,
    required this.title,
  });
  final Function() onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: CustomElevatedButtonGlobal(
        onatp: onTap,
        width: double.infinity,
        backgroundcolor: ColorApp.primery,
        colorTitle: ColorApp.white,
        title: title,
      ),
    );
  }
}
