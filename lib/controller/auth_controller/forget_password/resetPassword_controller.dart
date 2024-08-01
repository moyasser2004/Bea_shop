import 'package:bea_shop/core/const/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utrlis/api/curd.dart';
import '../../../core/utrlis/api/request_state.dart';
import '../../../core/function/handling_response.dart';
import '../../../model/data/data_source/remote/auth/forget_password/reset_password.dart';

class ResetPasswordController extends GetxController {
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;

  late GlobalKey<FormState> passwordKey;
  late GlobalKey<FormState> rePasswordKey;

  late String email;

  ResetPasswordRemote resetPasswordRemote =
      ResetPasswordRemote(Curd());
  RequestState? state;
  // List data = [];

  resetPassword() async {
    if (rePasswordKey.currentState!.validate() &&
        passwordKey.currentState!.validate()) {
      if (passwordController.text == rePasswordController.text) {
        state = RequestState.loading;
        final result = await resetPasswordRemote.postData(
            email: email, password: rePasswordController.text);
        state = handleResponse(result);
        if (state == RequestState.loaded) {
          if (result["status"] == "success") {
            // data.add(result["status"]);
            toLogin();
          } else {
            state = RequestState.notData;
          }
        }
      }
    }
  }

  toLogin() {
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    passwordKey = GlobalKey<FormState>();
    rePasswordKey = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void dispose() {
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }
}
