import 'package:bea_shop/view/screen/on_boarding/change_language_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../controller/home_controller/my_order_controller.dart';
import '../../../core/const/app_color.dart';
import '../../../core/function/calculate_price.dart';
import '../../../core/function/lang_changr.dart';
import '../../../core/style/text_style.dart';
import 'home_button.dart';
import 'image_border.dart';

class MyOrderScreenListCart extends StatelessWidget {
  const MyOrderScreenListCart(
      {super.key,
      required this.height,
      required this.width,
      required this.index,
      required this.data});

  final double height;
  final double width;
  final int index;
  final List data;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        padding: const EdgeInsets.all(10),
        color: AppColor.grey100,
        height: height / 2.8,
        width: width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 120,
                width: 120,
                child: ImageBorder(
                  color: AppColor.grey200!,
                  height: height / 10,
                  image: data[index]["items_image"],
                  borderColor: AppColor.black54,
                  padding: 7,
                  margin: 12,
                  width: width,
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Order Number : ",
                      style: AppTextStyleData.googleAraPey(
                          fontSize: 18, color: AppColor.black),
                    ),
                    Text(
                      data[index]["cart_id"].toString(),
                      style: AppTextStyleData.googleRobotoSlab(
                          fontSize: 16, color: AppColor.black),
                    ),
                    const Spacer(),
                    Text(
                      Jiffy.parse(data[index]["cart_date"],
                              pattern: "yyyy-MM-dd HH:mm:ss")
                          .fromNow()
                          .toString(),
                      style: AppTextStyleData.googleAmIri(
                        fontSize: 16,
                        color: AppColor.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text("OrderType : ",
                        style: AppTextStyleData.googleAraPey(
                            fontSize: 16, color: AppColor.grey700)),
                    data[index]["cart_methods"] == 1
                        ? const Text("Delivery")
                        : const Text("From shop")
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Text("OrderPrice : ".tr,
                        style: AppTextStyleData.googleAraPey(
                            fontSize: 16, color: AppColor.grey700)),
                    Text(calculateCartItem(
                        itemsPrice: data[index]["items_price"],
                        itemsDiscount: data[index]["items_discount"],
                        cartItemCount: data[index]
                            ["cart_item_count"]))
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Text("Delivery Price : ",
                        style: AppTextStyleData.googleAraPey(
                            fontSize: 16, color: AppColor.grey700)),
                    data[index]["cart_item_delivery"] != 0 &&
                            data[index]["cart_methods"] == 1
                        ? Text(data[index]["cart_item_delivery"]
                            .toString())
                        : data[index]["cart_item_delivery"] == 0 &&
                                data[index]["cart_methods"] == 1
                            ? const Text("From 10 to 30")
                            : const Text("0")
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Text("Cart Promo Code : ",
                        style: AppTextStyleData.googleAraPey(
                            fontSize: 16, color: AppColor.grey700)),
                    Text(data[index]["cart_promo_code_discount"]
                        .toString())
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Text("Item Discount  : ",
                        style: AppTextStyleData.googleAraPey(
                            fontSize: 16, color: AppColor.grey700)),
                    Text(
                      data[index]["items_discount"].toString(),
                    ),
                    Text(" % ",
                        style: AppTextStyleData.googleAraPey(
                            fontSize: 16, color: AppColor.grey700)),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Text("Order Status : ",
                        style: AppTextStyleData.googleAraPey(
                            fontSize: 16, color: AppColor.grey600)),
                    Text(
                      data[index]["cart_order_state"] == 0
                          ? langChang("تم ارسال الطلب",
                              "The Order Pending Approved ")
                          : data[index]["cart_order_state"] == 1
                              ? langChang("تمت الموافقة على الطلب",
                                  "The Order Has Approved ")
                              : data[index]["cart_order_state"] == 2
                                  ? langChang("سيتم تسليم الطلب",
                                      "The Order Will delivery")
                                  : langChang("تم تسليم الطلب",
                                      "The Order Has delivered "),
                      style: const TextStyle(
                          backgroundColor: Colors.limeAccent,
                          fontSize: 10),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text("Total Price : ",
                        style: AppTextStyleData.googleAraPey(
                            fontSize: 16, color: AppColor.red)),
                    Text(calculateCartItemTotal(
                      itemsPrice: data[index]["items_price"],
                      delivery:
                          data[index]["cart_item_delivery"] != 0 &&
                                  data[index]["cart_methods"] == 1
                              ? data[index]["cart_item_delivery"]
                              : data[index]["cart_item_delivery"],
                      itemsDiscount: data[index]["items_discount"],
                      cartItemCount: data[index]["cart_item_count"],
                      cartPromoCodeDiscount: data[index]
                          ["cart_promo_code_discount"],
                    )),
                    const Spacer(
                      flex: 10,
                    ),
                    if (data[index]["cart_item_rate"] == 0 &&
                        data[index]["cart_order_state"] == 3)
                      GetBuilder<MyOrderController>(
                        builder: (controller) => HomeButton(
                          vertical: 0,
                          fontSize: 14,
                          onPress: () {
                            showDialog(
                                context: context,
                                barrierDismissible: true,
                                builder: (context) => RatingDialog(
                                      initialRating: 2.0,
                                      title: Text('Rating Dialog',
                                          textAlign: TextAlign.center,
                                          style: AppTextStyleData
                                              .googleRobotoSlab(
                                            color: AppColor.black,
                                          )),
                                      message: Text(
                                          'Tap a star to set your rating',
                                          textAlign: TextAlign.center,
                                          style: AppTextStyleData
                                              .bodyMedium2(
                                                  context, 12)),
                                      image: null,
                                      submitButtonText: 'Submit',
                                      submitButtonTextStyle:
                                          AppTextStyleData
                                              .googleAraPey(
                                                  color:
                                                      AppColor.black,
                                                  fontSize: 17),
                                      commentHint: '',
                                      starSize: 35,
                                      enableComment: false,
                                      onCancelled: () => {},
                                      onSubmitted: (response) {
                                        controller.postRate(
                                          cartId: data[index]
                                                  ["cart_id"]
                                              .toString(),
                                          cartItemRate: response
                                              .rating
                                              .toString(),
                                          cartItemId: controller
                                              .data[index]
                                                  ["cart_item_id"]
                                              .toString(),
                                        );
                                      },
                                    ));
                          },
                          text: "Rating".tr,
                          buttonColor: AppColor.primary,
                          textColor: AppColor.white,
                        ),
                      ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
