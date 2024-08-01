import 'package:bea_shop/core/const/app_routes.dart';
import 'package:bea_shop/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';

import '../../core/utrlis/api/curd.dart';
import '../../core/utrlis/api/request_state.dart';
import '../../core/function/handling_response.dart';
import '../../model/data/data_source/remote/auth/login_remote.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late GlobalKey<FormState> formKeyEmail;
  late GlobalKey<FormState> formKeyPassword;

  bool showPassword = false;

  LoginRemote loginRemote = LoginRemote(Curd());
  RequestState? state;

  late ButtonState stateOnlyText;
  late ButtonState stateTextWithIcon;

  login() async {
    state = RequestState.loading;
    update();
    final result = await loginRemote.logIn(
        email: emailController.text,
        password: passwordController.text);
    state = handleResponse(result);
    if (state == RequestState.loaded) {
      if (result["status"] == "success") {
        if (result["data"]["user_approve"].toString() == "1") {
          await MyServices.sharedPreferences
              .setString("id", result["data"]["user_id"].toString());
          await MyServices.sharedPreferences
              .setString("name", result["data"]["user_name"]);
          await MyServices.sharedPreferences
              .setString("email", result["data"]["user_email"]);
          await MyServices.sharedPreferences
              .setString("phone", result["data"]["user_phone"]);
          await MyServices.sharedPreferences.setString("step", "2");

          //FCM
          String id = result["data"]["user_id"].toString();
          await FirebaseMessaging.instance.subscribeToTopic("users");
          await FirebaseMessaging.instance
              .subscribeToTopic("users$id");
        } else {
          toCheckCode();
        }
      } else {
        state = RequestState.notData;
        Get.defaultDialog(
          title: "WARING".tr,
          middleText: "Email or Password not correct".tr,
          backgroundColor: Colors.grey[800],
          titleStyle: TextStyle(
            color: Colors.red,
            fontSize: Get.textScaleFactor * 16,
          ),
          middleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: Get.textScaleFactor * 14,
              height: 2),
          radius: 20,
        );
      }
    }
    update();
  }

  toSignIn() {
    Get.offAllNamed(AppRoutes.signInScreen);
    Get.delete<LoginController>();
  }

  toHome() {
    Get.offAllNamed(AppRoutes.home);
    Get.delete<LoginController>();
  }

  toCheckCode() {
    Get.offAllNamed(AppRoutes.checkCode,
        arguments: {"email": emailController.text.toString()});
  }

  changeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  void onPressedIconWithText() {
    if (formKeyEmail.currentState!.validate() &&
        formKeyPassword.currentState!.validate()) {
      switch (stateTextWithIcon) {
        case ButtonState.idle:
          stateTextWithIcon = ButtonState.loading;
          Future.delayed(
            const Duration(seconds: 1),
            () async {
              await login();
              stateTextWithIcon = state == RequestState.loaded
                  ? ButtonState.success
                  : ButtonState.fail;
              update();
            },
          );
          break;
        case ButtonState.loading:
          break;
        case ButtonState.success:
          toHome();
          stateTextWithIcon = ButtonState.idle;
          break;
        case ButtonState.fail:
          stateTextWithIcon = ButtonState.idle;
          break;
      }
      stateTextWithIcon = stateTextWithIcon;
      update();
    }
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKeyEmail = GlobalKey<FormState>();
    formKeyPassword = GlobalKey<FormState>();
    stateOnlyText = ButtonState.idle;
    stateTextWithIcon = ButtonState.idle;
    super.onInit();
  }

  @override
  dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
