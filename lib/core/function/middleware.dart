import 'package:bookia/core/class/local_storage.dart';
import 'package:bookia/feature/intro/presentation/screen/onboarding_view.dart';
import 'package:bookia/feature/main/presentation/screen/main_screen.dart';
import 'package:flutter/widgets.dart';

Widget middleWare() {
  if (LocalStorage.getData("token") != null) {
    return MainScreen();
  } else {
    return OnboardingView();
  }
}
