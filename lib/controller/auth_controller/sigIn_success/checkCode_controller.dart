import 'package:bea_shop/core/const/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utrlis/api/curd.dart';
import '../../../core/utrlis/api/request_state.dart';
import '../../../core/function/handling_response.dart';
import '../../../model/data/data_source/remote/auth/verify_remote.dart';

class CheckCodeController extends GetxController {
  late TextEditingController verifyController;
  late String email;

  VerifyRemote verifyRemote = VerifyRemote(Curd());
  RequestState? state;

  checkCode() async {
    state = RequestState.loading;
    update();
    final result = await verifyRemote.postData(
        email: email, verifyCode: verifyController.text);
    state = handleResponse(result);
    if (state == RequestState.loaded) {
      if (result["status"] == "success") {
        toLogin();
      } else {
        state = RequestState.notData;
        Get.defaultDialog(
          title: "WARING".tr,
          middleText: result["message"],
          backgroundColor: Colors.grey[800],
          titleStyle: const TextStyle(
            color: Colors.red,
            fontSize: 16,
          ),
          middleTextStyle: const TextStyle(
              color: Colors.white, fontSize: 14, height: 2),
          radius: 20,
        );
      }
    }
  }

  toLogin() {
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    verifyController = TextEditingController();
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  void dispose() {
    verifyController.dispose();
    super.dispose();
  }
}
