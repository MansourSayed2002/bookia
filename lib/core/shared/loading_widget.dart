import 'package:flutter/material.dart';

loadingWidget(context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Center(child: CircularProgressIndicator()),
  );
}
