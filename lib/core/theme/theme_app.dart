import 'package:bookia/core/theme/color_app.dart';
import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData lightTheme = ThemeData(
    fontFamily: "dm",
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorApp.white,
      iconTheme: IconThemeData(color: Colors.black),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: "dm",
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorApp.white,
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
