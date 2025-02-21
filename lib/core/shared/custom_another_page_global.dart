import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:flutter/material.dart';

class CustomAnotherPageGlobal extends StatelessWidget {
  const CustomAnotherPageGlobal({
    super.key,
    required this.textone,
    required this.texttwo,
    required this.ontap,
  });
  final String textone;
  final String texttwo;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: textone, style: TextstyleApp.black15W400),
            WidgetSpan(
              child: InkWell(
                onTap: ontap,
                child: Text(
                  texttwo,
                  style: TextstyleApp.black15W400.copyWith(
                    color: ColorApp.primery,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
