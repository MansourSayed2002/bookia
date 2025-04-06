import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:flutter/material.dart';

class CountWidget extends StatelessWidget {
  const CountWidget({
    super.key,
    required this.onadd,
    required this.onremove,
    required this.quantity,
  });
  final Function() onadd;
  final Function() onremove;
  final String quantity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // FloatingActionButton.small(
        //   heroTag: "add",
        //   backgroundColor: ColorApp.white,
        //   elevation: 0.0,
        //   onPressed: onadd,
        //   child: Icon(Icons.add, color: ColorApp.dark),
        // ),
        TextButton(
          onPressed: onadd,
          child: Icon(Icons.add, color: ColorApp.dark),
        ),
        Text(quantity, style: TextstyleApp.black15W400),
        TextButton(
          onPressed: onremove,
          child: Icon(Icons.remove, color: ColorApp.dark),
        ),
        // FloatingActionButton.small(
        //   heroTag: "remove",
        //   backgroundColor: ColorApp.white,
        //   elevation: 0.0,
        //   onPressed: onremove,
        //   child: Icon(Icons.remove, color: ColorApp.dark),
        // ),
      ],
    );
  }
}
