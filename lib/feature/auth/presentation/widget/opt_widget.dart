import 'package:bookia/core/theme/color_app.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OptWidget extends StatelessWidget {
  const OptWidget({super.key, this.onCompleted, this.controller});
  final void Function(String)? onCompleted;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 4,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      controller: controller,
      onCompleted: onCompleted,
      errorPinTheme: PinTheme(
        height: 65,
        width: 75,
        decoration: BoxDecoration(
          border: Border.all(color: ColorApp.red),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      defaultPinTheme: PinTheme(
        height: 65,
        width: 75,
        decoration: BoxDecoration(
          color: ColorApp.border,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      focusedPinTheme: PinTheme(
        height: 65,
        width: 75,
        decoration: BoxDecoration(
          border: Border.all(color: ColorApp.primery),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
