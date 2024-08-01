import 'package:bea_shop/view/widget/on_boarding_screen/custom_on_boarding_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../controller/auth_controller/forget_password/resetPassword_controller.dart';
import '../../../../core/class/app_text_scall.dart';
import '../../../../core/const/app_color.dart';
import '../../../../core/const/app_images.dart';
import '../../../../core/style/text_style.dart';
import '../../../widget/custom_auth/text_form_auth.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  final ResetPasswordController controller =
      Get.put(ResetPasswordController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height < 700
        ? 700
        : MediaQuery.sizeOf(context).height;
    DateTime? currentBackPressTime;
    return Scaffold(
        backgroundColor: AppColor.white,
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: OnBoardingButton(
            onPressed: () {
              if (controller.rePasswordKey.currentState!.validate() &&
                  controller.passwordKey.currentState!.validate()) {
                if (controller.passwordController.text ==
                    controller.rePasswordController.text) {
                  controller.resetPassword();
                } else {
                  Get.defaultDialog(
                    title: "WARING".tr,
                    middleText: "Password not correct".tr,
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
            },
          ),
        ),
        // ignore: deprecated_member_use
        body: WillPopScope(
            onWillPop: () async {
              if (currentBackPressTime == null ||
                  DateTime.now().difference(currentBackPressTime!) >
                      const Duration(seconds: 3) ||
                  DateTime.now().difference(currentBackPressTime!) >
                      const Duration(seconds: 2)) {
                currentBackPressTime = DateTime.now();
                Fluttertoast.showToast(
                  msg: 'Press back again to exit',
                );
                return false;
              }
              return true;
            },
            child: SafeArea(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                height: height / 1.1,
                padding: EdgeInsets.symmetric(
                  vertical: height / 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Reset Password".tr,
                      style: AppTextStyleData.titleMedium(
                          context, Get.textScaleFactor * 20),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: height / 2.5,
                      child: AspectRatio(
                        aspectRatio: .8,
                        child: Image.asset(
                          AppImagesName.imageforgetPassword,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Please enter your new Password".tr,
                      textAlign: TextAlign.center,
                      style: AppTextStyleData.bodyMedium(
                          context,
                          AppTextScales.textScaleFactor(context) *
                              15),
                      overflow: TextOverflow.ellipsis,
                    ),
                    TextFormAuth(
                      v: 0,
                      keyboardType: TextInputType.emailAddress,
                      color: Colors.black87,
                      controller: controller.passwordController,
                      formKey: controller.passwordKey,
                      label: 'Password'.tr,
                      hint: "Enter your Password".tr,
                      val: controller.passwordController.text !=
                              controller.rePasswordController.text
                          ? "Password cant be empty".tr
                          : "old Password can't be ass new Password"
                              .tr,
                      icon: const Icon(
                        Icons.email_outlined,
                        color: Colors.red,
                      ),
                      onFiledSubmit: (String value) {
                        controller.resetPassword();
                      },
                      obscure: false,
                    ),
                    TextFormAuth(
                      v: 0,
                      keyboardType: TextInputType.emailAddress,
                      color: Colors.black87,
                      controller: controller.rePasswordController,
                      formKey: controller.rePasswordKey,
                      label: 'Password'.tr,
                      hint: 'Enter your Re password'.tr,
                      val: "Password cant be empty".tr,
                      icon: const Icon(
                        Icons.email_outlined,
                        color: Colors.red,
                      ),
                      onFiledSubmit: (String value) {
                        controller.resetPassword();
                      },
                      obscure: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ))));
  }
}
