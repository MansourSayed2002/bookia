import 'package:bookia/core/theme/color_app.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OptWidget extends StatelessWidget {
  const OptWidget({super.key, this.controller, this.validator});
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      controller: controller,
      validator: validator,
      errorPinTheme: PinTheme(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          border: Border.all(color: ColorApp.red),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      defaultPinTheme: PinTheme(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: ColorApp.border,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      focusedPinTheme: PinTheme(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          border: Border.all(color: ColorApp.primery),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
