import 'package:bea_shop/view/widget/home/product_details_bottom.dart';
import 'package:bea_shop/view/widget/home/product_details_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/product_details_controller.dart';
import '../../../core/const/app_color.dart';

class ProductDetailsSliverBody extends StatelessWidget {
  const ProductDetailsSliverBody(
      {super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(15),
      sliver: SliverToBoxAdapter(
          child: Column(
        children: [
          ProductDetailsBottom(
            height: height,
            width: width,
          ),
          GetBuilder<ProductDetailController>(
            builder: (controller) {
              return !controller.isMax
                  ? ProductDetailsGridView(
                      controller: controller,
                      height: height,
                      width: width,
                      bottom: 170,
                    )
                  : Column(
                      children: [
                        ProductDetailsGridView(
                          controller: controller,
                          height: height,
                          width: width,
                          bottom: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: AppColor.primary,
                          ),
                        )
                      ],
                    );
            },
          )
        ],
      )),
    );
  }
}
