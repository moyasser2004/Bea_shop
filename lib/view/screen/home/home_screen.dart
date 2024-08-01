import 'package:bea_shop/core/utrlis/api/request_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/home_controller.dart';
import '../../../core/class/handle_view_data.dart';
import '../../../core/const/app_color.dart';
import '../../../core/style/text_style.dart';
import '../../widget/home/items_now.dart';
import '../../widget/home/list_category.dart';
import '../../widget/home/top_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.of(context).size.height < 700
        ? 800
        : MediaQuery.of(context).size.height;
    return Scaffold(
      body: GetBuilder<HomeController>(
          builder: (controller) => RefreshIndicator(
              color: AppColor.primary,
              onRefresh: () async {
                await controller.getData();
              },
              child: HandelViewData(
                state: controller.state ?? RequestState.loading,
                widget: SingleChildScrollView(
                  child: SizedBox(
                    height: height * 1.52,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: AppColor.primary,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft:
                                            Radius.circular(30),
                                        bottomRight:
                                            Radius.circular(30))),
                                width: width,
                                height: height / 8.2,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  right: 35,
                                  left: 35,
                                  top: height / 30,
                                  bottom: height / 40),
                              height: height / 6,
                              width: width,
                              decoration: BoxDecoration(
                                  color: AppColor.grey100,
                                  borderRadius:
                                      BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: AppColor.black54,
                                        spreadRadius: 4,
                                        offset: Offset(1, 6),
                                        blurRadius: 20)
                                  ]),
                              child: TopCartHomeScreen(
                                height: height,
                                onPress: () {
                                  controller.toProductDetails(
                                    count: controller.itemTop[0]
                                        ["items_count"],
                                    date: controller.itemTop[0]
                                        ["items_date"],
                                    price: controller.itemTop[0]
                                        ["items_price"],
                                    discount: controller.itemTop[0]
                                        ["items_discount"],
                                    nameAr: controller.itemTop[0]
                                        ["items_name_ar"],
                                    nameEn: controller.itemTop[0]
                                        ["items_name"],
                                    image: controller.itemTop[0]
                                        ["items_image"],
                                    desAr: controller.itemTop[0]
                                        ["items_des_ar"],
                                    desEn: controller.itemTop[0]
                                        ["items_des"],
                                    id: controller.itemTop[0]
                                        ["items_id"],
                                    rate: double.parse(controller
                                        .itemTop[0]["items_rate"]
                                        .toString()),
                                    tag: controller.itemTop[0]
                                            ["items_image"]
                                        .toString(),
                                    colors: controller.itemTop[0]
                                            ["items_Colors"] ??
                                        "",
                                    images: controller.itemTop[0]
                                        ["images_list"],
                                  );
                                },
                                itemTop: controller.itemTop,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height / 8.1,
                          width: width,
                          child: ListCategory(
                            height: height,
                            width: width,
                            category: controller.category,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(
                              right: width / 35,
                              left: width / 35,
                              top: height / 20),
                          height: height * 1.1,
                          decoration: BoxDecoration(
                            color: AppColor.grey200,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35)),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Offer Products",
                                    style: AppTextStyleData
                                        .googleSeaweedScript(
                                            fontSize: 22)),
                              ),
                              SizedBox(
                                  height: height / 3.3,
                                  child: HomeScreenItemsList(
                                    width: width / 2.58,
                                    height: height,
                                    data: controller.item,
                                    countList: 1,
                                  )),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("New Products".tr,
                                    style: AppTextStyleData
                                        .googleSeaweedScript(
                                            fontSize: 22)),
                              ),
                              SizedBox(
                                  height: height / 3.3,
                                  child: HomeScreenItemsList(
                                    width: width / 2.58,
                                    height: height,
                                    data: controller.itemNow,
                                    countList: 2,
                                  )),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Top Selling".tr,
                                    style: AppTextStyleData
                                        .googleSeaweedScript(
                                            fontSize: 22)),
                              ),
                              SizedBox(
                                  height: height / 3.3,
                                  child: HomeScreenItemsList(
                                    width: width / 2.58,
                                    height: height,
                                    data: controller.itemTopSelling,
                                    countList: 3,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                height: height / 1.1,
              ))),
    );
  }
}
