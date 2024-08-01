import 'package:bea_shop/controller/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_color.dart';
import 'item_list_cart.dart';

class HomeScreenItemsList extends GetView<HomeController> {
  final double height;
  final double width;
  final List data;
  final int countList;

  const HomeScreenItemsList(
      {super.key,
      required this.height,
      required this.width,
      required this.countList,
      required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) => InkWell(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2, horizontal: 12),
                  child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.white,
                      ),
                      width: width,
                      child: HomeScreenItemsListCart(
                        data: data,
                        index: index,
                        countList: countList,
                        height: height,
                        width: width,
                      ))),
              onTap: () {
                controller.toProductDetails(
                  count: data[index]["items_count"],
                  date: data[index]["items_date"],
                  price: data[index]["items_price"],
                  discount: data[index]["items_discount"],
                  nameAr: data[index]["items_name_ar"],
                  nameEn: data[index]["items_name"],
                  image: data[index]["items_image"],
                  desAr: data[index]["items_des_ar"],
                  desEn: data[index]["items_des"],
                  id: data[index]["items_id"],
                  rate: double.parse(
                      data[index]["items_rate"].toString()),
                  tag: "${data[index]["items_id"]} $countList",
                  colors: data[index]["items_colors"],
                  images: data[index]["images_list"],
                );
              },
            ));
  }
}
