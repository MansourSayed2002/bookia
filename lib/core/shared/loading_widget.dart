import 'package:bookia/core/constants/image_app.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

loadingWidget(context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Center(child: Lottie.asset(ImageApp.loading)),
  );
}
