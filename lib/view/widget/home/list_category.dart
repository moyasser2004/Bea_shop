import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/const/app_color.dart';
import '../../../core/style/text_style.dart';
import '../../../core/utrlis/links/app_link.dart';
import '../../../core/function/lang_changr.dart';

class ListCategory extends StatelessWidget {
  final double height;
  final double width;
  final List category;

  const ListCategory({
    super.key,
    required this.height,
    required this.width,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(5),
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(height / 90),
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: AppColor.primary.withOpacity(.4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: CachedNetworkImage(
                height: height / 22,
                width: width / 14,
                imageUrl: AppLink.categoryImage(
                    category[index]["categories_icons"]),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: AppColor.grey200!,
                  highlightColor: AppColor.primary,
                  child: Container(
                    height: height / 20,
                    width: width / 12,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: AppColor.red,
                ),
              ),
            ),
            Text(
              langChang(category[index]["categories_name_ar"],
                  category[index]["categories_name"]),
              style: AppTextStyleData.googleAraPey(
                  fontSize: langChang(9.0, 14.0),
                  color: AppColor.black54),
            )
          ],
        ),
      ),
      itemCount: category.length,
    );
  }
}
