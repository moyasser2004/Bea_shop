import 'package:bea_shop/core/utrlis/api/request_state.dart';
import 'package:bea_shop/core/const/app_routes.dart';
import 'package:bea_shop/core/function/handling_response.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../core/style/text_style.dart';
import '../../core/utrlis/api/curd.dart';
import '../../core/const/app_color.dart';
import '../../core/services/services.dart';

import '../../core/class/tset.dart';
import '../../model/data/data_source/remote/cart/cart_insert.dart';
import '../../model/data/data_source/remote/cart/cart_veiw.dart';

class CartController extends GetxController {
  late String userId;

  InsertCartRemote insertCartRemote = InsertCartRemote(Curd());
  ViewCartRemote viewCartRemote = ViewCartRemote(Curd());
  RequestState? state;
  RequestState? state2;

  List viewData = CartList.test;
  List<double> count = CartList.count;
  int counter = 1;
  bool addAddress = false;
  int t = CartList.test.isEmpty ? 1 : CartList.test.length;

  late TextEditingController promoController;
  late GlobalKey<FormState> promKey;

  toAddressScreen() {
    Get.offNamed(AppRoutes.addAddressScreen);
  }

  insertData({
    required String cartUserid,
    required String cartItemCount,
  }) async {
    if (CartList.test.isNotEmpty) {
      if (addAddress) {
        Get.defaultDialog(
            title: "",
            middleText: "Please select a order \n Method ",
            backgroundColor: AppColor.black.withOpacity(.6),
            middleTextStyle: AppTextStyleData.googleAraPey(
                fontSize: 18, color: AppColor.red),
            radius: 20,
            actions: [
              Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 10),
                  height: 30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColor.primary,
                      border:
                          Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(5)),
                  child: InkWell(
                    child: const Center(
                      child: Text(
                        "Delivery",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14, color: Colors.white),
                      ),
                    ),
                    onTap: () async {
                      for (int i = 0; i < viewData.length; i++) {
                        state = RequestState.loading;
                        update();
                        if (viewData[i]["items_count"] > 0) {
                          final result =
                              await insertCartRemote.postData(
                                  cartUserid: cartUserid,
                                  cartItemId: viewData[i]["items_id"],
                                  cartItemCount: count[i].toString(),
                                  cartAddressId: MyServices
                                      .sharedPreferences
                                      .getString("address_id")!,
                                  promoCodeDiscount:
                                      (promoCod / t).toString(),
                                  itemsCount: (viewData[i]
                                              ["items_count"] -
                                          count[i])
                                      .toString(),
                                  cartMethods: '1');
                          state = handleResponse(result);
                          if (state == RequestState.loaded) {
                            if (result["status"] == "success") {
                              cartTotal();
                              MyServices.sharedPreferences
                                  .setBool("AddressAdded", false);
                              promoController.clear();
                              Fluttertoast.showToast(
                                msg: ' Will Come soon  '.tr,
                              );
                              viewData.removeAt(i);
                              count.removeAt(i);
                            }
                          }
                        } else {
                          count.removeAt(i);
                          viewData.removeAt(i);
                          Fluttertoast.showToast(
                            msg: 'Sorry This Items not Available'.tr,
                          );
                        }
                      }
                      Get.back();
                      update();
                    },
                  )),
              Container(
                margin: const EdgeInsets.only(
                    right: 30, left: 30, bottom: 10),
                height: 30,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColor.primary,
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5)),
                child: InkWell(
                  child: const Center(
                    child: Text(
                      "From Shop ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14, color: Colors.white),
                    ),
                  ),
                  onTap: () async {
                    for (int i = 0; i < count.length; i++) {
                      if (count.length != viewData.length) {
                        count.removeLast();
                      }
                    }
                    for (int i = 0; i < viewData.length; i++) {
                      state = RequestState.loading;
                      update();
                      if (viewData[i]["items_count"] > 0) {
                        final result =
                            await insertCartRemote.postData(
                                cartUserid: cartUserid,
                                cartItemId: viewData[i]["items_id"],
                                cartItemCount: count[i].toString(),
                                cartAddressId: MyServices
                                    .sharedPreferences
                                    .getString("address_id")!,
                                promoCodeDiscount:
                                    (promoCod / t).toString(),
                                itemsCount: (viewData[i]
                                            ["items_count"] -
                                        count[i])
                                    .toString(),
                                cartMethods: '0');
                        state = handleResponse(result);
                        if (state == RequestState.loaded) {
                          if (result["status"] == "success") {
                            cartTotal();
                            MyServices.sharedPreferences
                                .setBool("AddressAdded", false);
                            Fluttertoast.showToast(
                              msg: ' Go to Your orders '.tr,
                            );
                            viewData.removeAt(i);
                            count.removeAt(i);
                          }
                        }
                      } else {
                        Fluttertoast.showToast(
                          msg: 'Sorry This Items not Available'.tr,
                        );
                      }
                    }
                    Get.back();
                    update();
                  },
                ),
              )
            ]);
      } else {
        toAddressScreen();
      }
    } else {
      count.clear();
      viewData.clear();
      Fluttertoast.showToast(
        msg: ' No items on card  '.tr,
      );
    }
  }

  deleteData({
    required String cartUserid,
    required String cartItemId,
    required int index,
  }) async {
    Fluttertoast.showToast(
      msg: ' Delete From Cart ',
    );
    count.removeAt(index);
    viewData.removeAt(index);
    cartTotal();
    for (int i = 0; i < count.length; i++) {
      if (count.length != viewData.length) {
        count.removeLast();
      }
    }
    update();
  }

  double cartTotal() {
    double price = 0;
    for (int i = 0; i < viewData.length; i++) {
      if (viewData[i]["items_discount"] != "0") {
        price += viewData[i]["items_price"] *
            ((100 - viewData[i]["items_discount"]) / 100) *
            count[i];
      } else {
        price += viewData[i]["items_price"] * count[i];
      }
    }
    return price;
  }

  double delivery() {
    if (viewData.isEmpty) {
      return 00.0;
    }
    return viewData.length * 10.0;
  }

  int promoCod = 0;

  double total() {
    return cartTotal() + delivery() - promoCod <= 0
        ? 0
        : cartTotal() + delivery() - promoCod;
  }

  //coupon

  postCoupon() async {
    if (promKey.currentState!.validate()) {
      if (addAddress) {
        state2 = RequestState.loading;
        update();
        if (MyServices.sharedPreferences.getString("promoCode") !=
            promoController.text.toString()) {
          final result = await viewCartRemote.postCouponView(
              couponName: promoController.text.toString());
          state2 = handleResponse(result);
          if (state2 == RequestState.loaded) {
            if (result["status"] == "success") {
              updateCoupon(
                couponName: promoController.text.toString(),
                couponCount:
                    (result["data"]["coupon_count"] - 1).toString(),
              );
              promoCod = result["data"]["coupon_des"] ?? 0;
              update();
              await MyServices.sharedPreferences.remove("promoCode");
              await MyServices.sharedPreferences.setString(
                  "promoCode", promoController.text.toString());
            } else {
              Fluttertoast.showToast(
                  msg: "the promo code isn't available".tr);
            }
          }

          MyServices.sharedPreferences.setBool("AddressAdded", false);
        } else {
          Fluttertoast.showToast(msg: "the promo code is used".tr);
        }

        update();
      } else {
        toAddressScreen();
      }
    }
  }

  updateCoupon({
    required String couponName,
    required String couponCount,
  }) async {
    state2 = RequestState.loading;
    update();
    final result = await viewCartRemote.postCouponAdd(
      couponName: couponName,
      couponCount: couponCount,
    );
    state2 = handleResponse(result);
    if (state2 == RequestState.loaded) {
      if (result["status"] == "success") {}
    }
    update();
  }

  @override
  void onInit() async {
    userId = MyServices.sharedPreferences.getString("id")!;
    addAddress =
        MyServices.sharedPreferences.getBool("AddressAdded") ?? false;
    promoController = TextEditingController();
    promKey = GlobalKey<FormState>();
    super.onInit();
  }
}
