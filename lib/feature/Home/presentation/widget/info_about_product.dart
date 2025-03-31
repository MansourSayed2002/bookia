import 'package:bookia/core/shared/net_work_image_widget.dart';
import 'package:bookia/core/theme/color_app.dart';
import 'package:bookia/core/theme/textstyle_app.dart';
import 'package:bookia/feature/Home/data/model/response/product/product.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InfoAboutProduct extends StatelessWidget {
  const InfoAboutProduct({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Hero(
          tag: product.id.toString(),
          child: NetWorkImageWidget(image: product.image, height: 270.0),
        ),
        Gap(11.0),
        Text(
          product.name.toString(),
          style: TextstyleApp.black30W400.copyWith(fontSize: 25.0),
          textAlign: TextAlign.center,
        ),
        Gap(11.0),
        Text(
          product.category.toString(),
          style: TextstyleApp.black15W400.copyWith(color: ColorApp.primery),
          textAlign: TextAlign.center,
        ),
        Gap(16.0),
        Text(
          product.description.toString(),
          style: TextstyleApp.black15W400.copyWith(fontSize: 14.0),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
