import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../const/app_color.dart';
import '../utrlis/links/app_link.dart';

class CachedNetworkImageUtils extends StatelessWidget {
  const CachedNetworkImageUtils({
    super.key,
    required this.image,
    required this.height,
  });

  final String image;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: AppLink.categoryImage(image),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: AppColor.grey200!,
        highlightColor: AppColor.primaryLight2,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Icon(
          Icons.error,
          color: AppColor.red,
        ),
      ),
      fit: BoxFit.fill,
    );
  }
}
