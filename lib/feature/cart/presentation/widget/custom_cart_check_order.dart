import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/shared/custom_elevated_button_global.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:flutter/material.dart';

class CustomCartCheckOrder extends StatelessWidget {
  const CustomCartCheckOrder({
    super.key,
    required this.total,
    required this.oncheckout,
  });
  final String total;
  final Function() oncheckout;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                TextApp.total,
                style: TextstyleApp.grey14W400.copyWith(fontSize: 20.0),
              ),
              Text(
                total,
                style: TextstyleApp.black18W400.copyWith(fontSize: 20.0),
              ),
            ],
          ),
          CustomElevatedButtonGlobal(
            onatp: oncheckout,
            backgroundcolor: ColorApp.primery,
            title: TextApp.checkOut,
            width: double.infinity,
            style: TextstyleApp.white20W400,
          ),
        ],
      ),
    );
  }
}
