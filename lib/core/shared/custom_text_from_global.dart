import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:flutter/material.dart';

class CustomTextFromGlobal extends StatelessWidget {
  const CustomTextFromGlobal({
    super.key,
    required this.hinttext,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.obscureText,
    this.onChanged,
  });
  final String hinttext;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.0),
      width: double.infinity,
      height: 56.0,
      child: TextFormField(
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        cursorColor: ColorApp.primery,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: ColorApp.second,
          hintText: hinttext,
          hintStyle: TextstyleApp.black15W400.copyWith(color: ColorApp.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorApp.border),
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorApp.primery),
            borderRadius: BorderRadius.circular(8.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: ColorApp.primery),
            borderRadius: BorderRadius.circular(8.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorApp.red),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
