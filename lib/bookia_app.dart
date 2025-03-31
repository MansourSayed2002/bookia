import 'package:bookia/core/function/middleware.dart';
import 'package:bookia/core/theme/theme_app.dart';
import 'package:flutter/material.dart';

class BookiaApp extends StatelessWidget {
  const BookiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      darkTheme: ThemeApp.darkTheme,
      theme: ThemeApp.lightTheme,
      debugShowCheckedModeBanner: false,
      home: middleWare(),
    );
  }
}
