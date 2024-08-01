import 'package:bea_shop/core/const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/product_details_controller.dart';
import '../../../core/style/text_style.dart';
import '../../widget/home/product_details_sliver_app_bar.dart';
import '../../widget/home/product_details_sliver_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height < 500
        ? 600
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ProductDetailController controller =
        Get.put(ProductDetailController());
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          CustomScrollView(
            controller: controller.scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              ProductDetailsSliverAppBar(
                height: height,
                width: width,
                images: controller.images,
                tag: controller.tag,
                image: controller.image,
              ),
              ProductDetailsSliverBody(
                height: height,
                width: width,
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 40,
              ),
              width: width,
              height: 50,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  controller.addItem({
                    "items_id": controller.id.toString(),
                    "items_name": controller.nameEn,
                    "items_name_ar": controller.nameAr,
                    "items_des": controller.desEn,
                    "items_des_ar": controller.desAr,
                    "items_image": controller.image,
                    "items_count": controller.count,
                    "items_price": controller.price,
                    "items_date": controller.date,
                    "items_discount": controller.discount
                  });
                  Get.back();
                },
                child: Text(
                  "Add To Cart",
                  style: AppTextStyleData.googleAmIri(
                      fontSize: 19, color: AppColor.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
