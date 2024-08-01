import 'package:bea_shop/core/utrlis/api/request_state.dart';
import 'package:bea_shop/core/const/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utrlis/api/curd.dart';
import '../../../core/function/handling_response.dart';
import '../../../model/data/data_source/remote/auth/forget_password/check_email.dart';

class ForgetPasswordController extends GetxController {
  late TextEditingController emailController;
  late GlobalKey<FormState> emailFormKey;

  CheckEmailRemote checkEmailRemote = CheckEmailRemote(Curd());
  RequestState? state;

  forgetPassword() async {
    if (emailFormKey.currentState!.validate()) {
      state = RequestState.loading;
      update();
      final result = await checkEmailRemote.postData(
          email: emailController.text);
      state = handleResponse(result);
      if (state == RequestState.loaded) {
        if (result["status"] == "success") {
          toCheckCodeForgetPassword();
        } else {
          state = RequestState.notData;
          Get.defaultDialog(
            title: "WARING".tr,
            middleText: "Email not correct".tr,
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
  }

  toCheckCodeForgetPassword() {
    Get.offAllNamed(AppRoutes.checkCodeForgetPassword,
        arguments: {"email": emailController.text});
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    emailFormKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
