import 'package:flutter/material.dart';

import '../../../controller/home_controller/product_details_controller.dart';
import '../../../core/const/app_color.dart';
import 'item_list_cart.dart';

class ProductDetailsGridView extends StatelessWidget {
  const ProductDetailsGridView(
      {super.key,
      required this.controller,
      required this.height,
      required this.width,
      required this.bottom});

  final ProductDetailController controller;
  final double height;
  final double width;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.only(
          top: 20, right: 15, left: 10, bottom: bottom),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: .7),
      itemCount: controller.searchList.length,
      itemBuilder: (BuildContext context, int index) => InkWell(
        highlightColor: AppColor.white,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColor.grey200,
          ),
          child: HomeScreenItemsListCart(
            data: controller.searchList,
            index: index,
            countList: 4,
            height: height * 1.1,
            width: width * 1.1,
          ),
        ),
        onTap: () {
          controller.toProductDetails(
            count: controller.searchList[index]["items_count"],
            date: controller.searchList[index]["items_date"],
            price: controller.searchList[index]["items_price"],
            discount: controller.searchList[index]["items_discount"],
            nameAr: controller.searchList[index]["items_name_ar"],
            nameEn: controller.searchList[index]["items_name"],
            image: controller.searchList[index]["items_image"],
            desAr: controller.searchList[index]["items_des_ar"],
            desEn: controller.searchList[index]["items_des"],
            id: controller.searchList[index]["items_id"],
            rate: double.parse(controller.searchList[index]
                    ["items_rate"]
                .toString()),
            like: true,
            colors: controller.searchList[index]["items_colors"],
            isLike: false,
            images: controller.searchList[index]["images_list"],
            tag: "${controller.searchList[index]["items_id"]} 4",
          );
        },
      ),
    );
  }
}
