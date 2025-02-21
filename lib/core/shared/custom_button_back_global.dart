import 'package:bookia/core/extensions/navigator_app.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:flutter/material.dart';

class CustomButtonBackGlobal extends StatelessWidget {
  const CustomButtonBackGlobal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(Icons.arrow_back_ios, size: 19.0),
        style: IconButton.styleFrom(
          alignment: Alignment.centerRight,
          side: BorderSide(color: ColorApp.border),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
