import 'package:bea_shop/controller/home_controller/favorite_controller.dart';
import 'package:bea_shop/core/class/handle_view_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/const/app_color.dart';
import '../../widget/home/item_list_cart.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Get.put(FavoriteController());
    return GetBuilder<FavoriteController>(
        builder: (controller) => RefreshIndicator(
              color: AppColor.primary,
              displacement: 20,
              onRefresh: () async {
                await controller.getData();
              },
              child: HandelViewData(
                  state: controller.state!,
                  widget: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding:
                        const EdgeInsets.fromLTRB(15, 15, 15, 65),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 20,
                            crossAxisCount: 2,
                            childAspectRatio: .8),
                    itemCount: controller.favoriteData.length,
                    itemBuilder: (BuildContext context, int index) =>
                        Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      child: InkWell(
                        highlightColor: AppColor.white,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColor.grey200,
                          ),
                          child: HomeScreenItemsListCart(
                            data: controller.favoriteData,
                            index: index,
                            height: height,
                            width: width,
                            countList: 1,
                          ),
                        ),
                        onTap: () {
                          controller.toProductDetails(
                            count: controller.favoriteData[index]
                                ["items_count"],
                            date: controller.favoriteData[index]
                                ["items_date"],
                            price: controller.favoriteData[index]
                                ["items_price"],
                            discount: controller.favoriteData[index]
                                ["items_discount"],
                            nameAr: controller.favoriteData[index]
                                ["items_name_ar"],
                            nameEn: controller.favoriteData[index]
                                ["items_name"],
                            image: controller.favoriteData[index]
                                ["items_image"],
                            desAr: controller.favoriteData[index]
                                ["items_des_ar"],
                            desEn: controller.favoriteData[index]
                                ["items_des"],
                            id: controller.favoriteData[index]
                                ["items_id"],
                            rate: double.parse(controller
                                .favoriteData[index]["items_rate"]
                                .toString()),
                            like: true,
                            colors: controller.favoriteData[index]
                                ["items_colors"],
                            tag:
                                "${controller.favoriteData[index]["items_id"]} 1",
                            images: controller.favoriteData[index]
                                ["images_list"],
                          );
                        },
                      ),
                    ),
                  ),
                  height: height / 1.2),
            ));
  }
}
