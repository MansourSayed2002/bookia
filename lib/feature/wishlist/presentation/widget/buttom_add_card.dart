import 'package:bookia/core/constants/text_app.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:flutter/material.dart';

class ButtomAddCard extends StatelessWidget {
  const ButtomAddCard({super.key, required this.onAddToCard});
  final Function() onAddToCard;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 182.0,
        child: ElevatedButton(
          onPressed: onAddToCard,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            backgroundColor: ColorApp.primery,
          ),
          child: Text(TextApp.addToCard, style: TextstyleApp.black15W400),
        ),
      ),
    );
  }
}
