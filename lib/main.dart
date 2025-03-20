import 'package:bookia/bookia_app.dart';
import 'package:bookia/core/service/services_app.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesApp.init();
  runApp(const BookiaApp());
}
