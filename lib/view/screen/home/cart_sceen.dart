import 'package:bea_shop/core/function/lang_changr.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/cart_controller.dart';
import '../../../controller/home_controller/my_order_controller.dart';
import '../../../core/const/app_color.dart';
import '../../../core/style/text_style.dart';
import '../../widget/custom_auth/button_auth.dart';
import '../../widget/custom_auth/text_form_auth.dart';
import '../../widget/home/cart_list.dart';
import '../../widget/home/cart_row.dart';
import '../../widget/home/home_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    Get.put(MyOrderController());
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height <= 700
        ? 800
        : MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColor.primary,
          title: Text(
            "BEA Shop",
            style: AppTextStyleData.googleRobotoSlab(
                color: AppColor.white),
          ),
          leading: IconButton(
            icon: const Icon(
              size: 26,
              Icons.arrow_back,
              color: AppColor.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
                vertical: 20, horizontal: 16),
            child: GetBuilder<CartController>(
              builder: (controller) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        " In My Cart".tr,
                        style: AppTextStyleData.googleAraPey(
                            color: AppColor.black,
                            fontSize: width / 19),
                      ),
                      const Spacer(),
                      Text("Orders: ${controller.viewData.length} "),
                    ],
                  ),
                  SizedBox(
                    height: langChang(height / 40, height / 20),
                  ),
                  CartList(
                    height: height / 1.3,
                    width: width,
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextFormAuth(
                          onTap: () {
                            controller.addAddress
                                ? null
                                : controller.toAddressScreen();
                          },
                          r: 5,
                          l: 20,
                          mine: 4,
                          controller: controller.promoController,
                          formKey: controller.promKey,
                          label: '',
                          hint: 'Promo Code'.tr,
                          val: 'promoCode cannot be empty'.tr,
                          icon: const Icon(Icons.add),
                          onFiledSubmit: (String value) {
                            controller.postCoupon();
                          },
                          obscure: false,
                          color: AppColor.black,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Expanded(
                        child: HomeButton(
                          vertical: 6,
                          horizontal: 5,
                          onPress: () {
                            controller.postCoupon();
                          },
                          text: 'Apply'.tr,
                          buttonColor: AppColor.primary,
                          textColor: AppColor.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height / 25,
                  ),
                  CartRow(
                      color: AppColor.grey600!,
                      text1: 'Cart total'.tr,
                      text2:
                          controller.cartTotal().round().toString()),
                  CartRow(
                    color: AppColor.grey600!,
                    text1: 'Delivery'.tr,
                    text2: controller.delivery().toString(),
                  ),
                  CartRow(
                    color: AppColor.grey600!,
                    text1: 'promo discount'.tr,
                    text2: (controller.promoCod / controller.t)
                        .toString(),
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  CartRow(
                    color: AppColor.red,
                    text1: 'Sub Total'.tr,
                    text2: controller.total().round().toString(),
                  ),
                  SizedBox(
                    height: height / 15,
                  ),
                  ButtonAuth(
                    bottom: 0,
                    text: 'Apply Order'.tr,
                    onTap: () {
                      controller.insertData(
                        cartUserid: controller.userId,
                        cartItemCount: '1',
                      );
                    },
                    color: AppColor.primary,
                  )
                ],
              ),
            )));
  }
}
