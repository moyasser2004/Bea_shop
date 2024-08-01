import 'package:bea_shop/core/widget/gradient.dart';
import 'package:flutter/material.dart';

import '../../../core/class/app_text_scall.dart';
import '../../../core/const/app_color.dart';
import '../../../core/function/lang_changr.dart';
import '../../../core/style/text_style.dart';
import 'image_border.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({
    super.key,
    required this.height,
    required this.width,
    required this.category,
    required this.index,
  });

  final double height;
  final double width;
  final List category;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: gradient()),
      child: Container(
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColor.white.withOpacity(0.95),
          ),
          child: Stack(
            children: [
              ImageBorder(
                color: Colors.transparent,
                height: height / 9,
                image: category[index]["categories_images"] ?? "",
                borderColor: Colors.transparent,
                padding: 5,
                margin: 9,
                width: width,
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    category[index]["categories_name"],
                    style: AppTextStyleData.googleSeaweedScript(
                        fontSize:
                            AppTextScales.textScaleFactor(context) *
                                24),
                  ))
            ],
          )),
    );
  }
}
