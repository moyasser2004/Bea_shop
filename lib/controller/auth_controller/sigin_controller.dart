import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';

import '../../core/utrlis/api/curd.dart';
import '../../core/utrlis/api/request_state.dart';
import '../../core/const/app_routes.dart';
import '../../core/function/handling_response.dart';
import '../../core/services/services.dart';
import '../../model/data/data_source/remote/auth/sign_in_remote.dart';

class SigInController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController phoneController;

  late GlobalKey<FormState> formKeyEmail;
  late GlobalKey<FormState> formKeyPassword;
  late GlobalKey<FormState> formKeyName;
  late GlobalKey<FormState> formKeyPhone;

  bool showPassword = false;

  SignInRemote signInRemote = SignInRemote(Curd());
  RequestState? state;

  late ButtonState stateOnlyText;
  late ButtonState stateTextWithIcon;

  sigiIn() async {
    if (formKeyName.currentState!.validate() &&
        formKeyEmail.currentState!.validate() &&
        formKeyPassword.currentState!.validate() &&
        formKeyPhone.currentState!.validate()) {
      state = RequestState.loading;
      update();
      final result = await signInRemote.postData(
          phone: phoneController.text.toString(),
          name: nameController.text.toString(),
          password: passwordController.text.toString(),
          email: emailController.text.toString());
      state = handleResponse(result);
      if (state == RequestState.loaded) {
        if (result["status"] == "success") {
        } else {
          state = RequestState.notData;
          Get.defaultDialog(
            title: "WARING".tr,
            middleText: "Email or Phone  were used".tr,
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
    update();
  }

  toForgetPassword() {
    Get.offAllNamed(AppRoutes.forgetPassword);
  }

  toCheckCode() {
    Get.offAllNamed(AppRoutes.checkCode,
        arguments: {"email": emailController.text.toString()});
  }

  changeShowPassword() {
    showPassword = !showPassword;
    update();
  }

  void onPressedIconWithText() async {
    if (formKeyName.currentState!.validate() &&
        formKeyEmail.currentState!.validate() &&
        formKeyPassword.currentState!.validate() &&
        formKeyPhone.currentState!.validate()) {
      await MyServices.sharedPreferences
          .setString("email2", emailController.text.toString());
      switch (stateTextWithIcon) {
        case ButtonState.idle:
          stateTextWithIcon = ButtonState.loading;
          Future.delayed(
            const Duration(seconds: 1),
            () async {
              await sigiIn();
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
          toCheckCode();
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
    nameController = TextEditingController();
    phoneController = TextEditingController();
    formKeyEmail = GlobalKey<FormState>();
    formKeyPassword = GlobalKey<FormState>();
    formKeyName = GlobalKey<FormState>();
    formKeyPhone = GlobalKey<FormState>();
    stateOnlyText = ButtonState.idle;
    stateTextWithIcon = ButtonState.idle;
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
