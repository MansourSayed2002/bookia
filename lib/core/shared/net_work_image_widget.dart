import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetWorkImageWidget extends StatelessWidget {
  const NetWorkImageWidget({
    super.key,
    this.image,
    this.width,
    this.height,
    this.fit,
  });

  final String? image;
  final double? width;
  final double? height;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: CachedNetworkImage(
        imageUrl: image ?? "",
        fit: fit,
        height: height,
        width: width ?? double.infinity,
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
