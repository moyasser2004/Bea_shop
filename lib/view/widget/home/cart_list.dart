import 'package:bea_shop/controller/home_controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../core/const/app_color.dart';
import '../../../core/const/style/text_style.dart';
import '../../../core/function/lang_changr.dart';
import '../../../core/style/text_style.dart';
import 'image_border.dart';

class CartList extends StatelessWidget {
  final double height;
  final double width;

  const CartList(
      {Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height / 2.5,
        child: GetBuilder<CartController>(
          builder: (controller) => ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.viewData.length,
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.grey100!.withOpacity(.6),
                        ),
                        width: width,
                        height: height / 5.78,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: ImageBorder(
                                color: AppColor.grey200!,
                                height: height / 10,
                                image: controller.viewData[index]
                                    ["items_image"],
                                borderColor: AppColor.black54,
                                padding: 10,
                                margin: 15,
                                width: width,
                              ),
                            ),
                            Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, bottom: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        langChang(
                                            controller.viewData[index]
                                                ["items_name_ar"],
                                            controller.viewData[index]
                                                ["items_name"]),
                                        style: AppTextStyleData
                                            .googleAraPey(
                                                color:
                                                    AppColor.grey800,
                                                fontSize: 16),
                                        textAlign: TextAlign.start,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                "EGP",
                                                style: TextStyle(
                                                    color:
                                                        AppColor.red),
                                              ),
                                              controller.viewData[
                                                              index][
                                                          "items_discount"] !=
                                                      0
                                                  ? Text(
                                                      " ${controller.viewData[index]["items_price"] * ((100 - controller.viewData[index]["items_discount"]) / 100)}",
                                                      style:
                                                          const TextStyle(
                                                              fontSize:
                                                                  10))
                                                  : Text(
                                                      controller
                                                          .viewData[
                                                              index][
                                                              "items_price"]
                                                          .toString(),
                                                      style:
                                                          const TextStyle(
                                                              fontSize:
                                                                  10))
                                            ],
                                          ),
                                          controller.viewData[index][
                                                      "items_discount"] !=
                                                  0
                                              ? Row(
                                                  children: [
                                                    Text(
                                                      "   Was ",
                                                      style:
                                                          TextStyle(
                                                        color: AppColor
                                                            .grey400,
                                                        fontSize: 10,
                                                      ),
                                                    ),
                                                    Text(
                                                        controller
                                                            .viewData[
                                                                index]
                                                                [
                                                                "items_price"]
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize:
                                                                12,
                                                            color: AppColor
                                                                .grey400,
                                                            decoration:
                                                                TextDecoration
                                                                    .lineThrough)),
                                                  ],
                                                )
                                              : Container(),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                              "${DateTime.parse(controller.viewData[index]["items_date"]).year}-${DateTime.parse(controller.viewData[index]["items_date"]).month.toString().padLeft(2, '0')}-${DateTime.parse(controller.viewData[index]["items_date"]).day.toString().padLeft(2, '0')}",
                                              style: const TextStyle(
                                                  fontSize: 11)),
                                          const Spacer(),
                                          Padding(
                                              padding:
                                                  const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10),
                                              child: Row(
                                                children: [
                                                  const Text(
                                                    "count: ",
                                                    style: TextStyle(
                                                        fontSize: 12),
                                                  ),
                                                  Text(
                                                    controller
                                                        .count[index]
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color:
                                                            AppColor
                                                                .red,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: const EdgeInsets.all(15),
                            height: width / 14,
                            width: width / 14,
                            decoration: BoxDecoration(
                                color: AppColor.red.withOpacity(.8),
                                borderRadius:
                                    BorderRadius.circular(10)),
                            child: IconButton(
                              splashRadius: 20,
                              splashColor: AppColor.red,
                              onPressed: () {
                                controller.deleteData(
                                    cartUserid: controller.userId,
                                    cartItemId: controller
                                        .viewData[index]["items_id"],
                                    index: index);
                              },
                              icon: const Icon(
                                Icons.highlight_remove,
                                size: 13,
                              ),
                            ),
                          )),
                    ],
                  ))),
        ));
  }
}
