import 'package:bea_shop/core/const/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utrlis/api/curd.dart';
import '../../../core/utrlis/api/request_state.dart';
import '../../../core/function/handling_response.dart';
import '../../../model/data/data_source/remote/auth/forget_password/get_code.dart';

class CheckCodeForgetPasswordController extends GetxController {
  late String email;

  GetCodeRemote checkCodeRemote = GetCodeRemote(Curd());
  RequestState? state;
  List data = [];

  checkCodeForget() async {
    state = RequestState.loading;
    update();
    final result = await checkCodeRemote.postData(email: email);
    state = handleResponse(result);
    if (state == RequestState.loaded) {
      if (result["status"] == "success") {
        data.add(result);
      } else {
        state = RequestState.notData;
      }
    }
  }

  checkCode({required String verificationCode}) {
    if (data[0]["user_verifycode"].toString() == verificationCode) {
      toResetPassword();
    } else {
      Get.defaultDialog(
        title: "WARING".tr,
        middleText: " verification Code not correct".tr,
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

  toResetPassword() {
    Get.offAllNamed(AppRoutes.resetPassword,
        arguments: {"email": email});
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    checkCodeForget();
    super.onInit();
  }
}
