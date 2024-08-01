import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/product_details_controller.dart';
import '../../../core/const/app_color.dart';
import 'icon.dart';

class ProductDetailsChangeLike extends StatelessWidget {
  const ProductDetailsChangeLike({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(30),
        child: AnimatedContainer(
          margin: EdgeInsets.all(
              controller.isLike || controller.like ? 2.5 : 0),
          height: controller.isLike || controller.like ? 45 : 40,
          width: controller.isLike || controller.like ? 45 : 40,
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColor.black.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(5, 10),
              )
            ],
            color: AppColor.grey200,
            shape: BoxShape.circle,
          ),
          duration: const Duration(milliseconds: 300),
          child: IconWidget(
            onPress: () {
              controller.changeLike();
            },
            icon: controller.isLike || controller.like
                ? Icons.favorite
                : Icons.favorite_border,
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            color: controller.isLike || controller.like
                ? Colors.pink.withOpacity(1.0)
                : AppColor.grey600,
          ),
        ),
      ),
    );
  }
}
