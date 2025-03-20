import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:flutter/material.dart';

extension MessageBar on BuildContext {
  messageBar(String message, [Color? color]) {
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: color ?? ColorApp.red,
        content: Text(
          message,
          style: TextstyleApp.grey14W400.copyWith(color: ColorApp.white),
        ),
      ),
    );
  }
}
