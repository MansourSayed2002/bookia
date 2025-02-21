import 'package:bookia/view/screen/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';

class BookiaApp extends StatelessWidget {
  const BookiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "dm"),
      debugShowCheckedModeBanner: false,
      home: OnboardingView(),
    );
  }
}
