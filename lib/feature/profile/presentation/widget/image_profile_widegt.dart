import 'package:bookia/core/theme/color_app.dart';
import 'package:flutter/material.dart';

class ImageProfileWidegt extends StatelessWidget {
  const ImageProfileWidegt({super.key, this.onTap, required this.image});
  final void Function()? onTap;
  final String image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 75.0,
      backgroundImage: NetworkImage(image),
      child: Align(
        alignment: Alignment.bottomRight,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorApp.white,
            ),
            child: Icon(Icons.camera_alt_outlined, color: ColorApp.primery),
          ),
        ),
      ),
    );
  }
}
