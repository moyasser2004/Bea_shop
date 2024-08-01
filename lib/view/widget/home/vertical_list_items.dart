import 'package:bea_shop/view/widget/home/search_list_items_cart.dart';
import 'package:flutter/material.dart';

class VListItems extends StatelessWidget {
  final List searchData;
  final double width;
  final double height;
  final dynamic controller;

  const VListItems(
      {super.key,
      required this.searchData,
      required this.width,
      required this.height,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding:
          const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      physics: const BouncingScrollPhysics(),
      itemCount: searchData.length,
      itemBuilder: (context, index) => InkWell(
        radius: 30,
        onTap: () {
          controller.toProductDetails(
            count: searchData[index]["items_count"],
            date: searchData[index]["items_date"],
            price: searchData[index]["items_price"],
            discount: searchData[index]["items_discount"],
            nameAr: searchData[index]["items_name_ar"],
            nameEn: searchData[index]["items_name"],
            image: searchData[index]["items_image"],
            desAr: searchData[index]["items_des_ar"],
            desEn: searchData[index]["items_des"],
            id: searchData[index]["items_id"],
            rate: double.parse(
                searchData[index]["items_rate"].toString()),
            colors: searchData[index]["items_colors"],
            tag: searchData[index]["items_id"].toString(),
            images: searchData[index]["images_list"],
          );
        },
        child: Padding(
            padding: const EdgeInsets.all(7),
            child: SearchItemsListCart(
              width: width,
              height: height,
              searchData: controller.searchData,
              index: index,
            )),
      ),
    );
  }
}
