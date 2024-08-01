import 'package:bea_shop/core/const/app_images.dart';
import 'package:bea_shop/view/widget/on_boarding_screen/custom_on_boarding_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../controller/auth_controller/forget_password/forgetPassword_controller.dart';
import '../../../../core/class/app_text_scall.dart';
import '../../../../core/const/app_color.dart';
import '../../../../core/style/text_style.dart';
import '../../../widget/custom_auth/text_form_auth.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final ForgetPasswordController controller =
      Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height < 600
        ? 700
        : MediaQuery.of(context).size.height;
    DateTime? currentBackPressTime;
    return Scaffold(
        backgroundColor: AppColor.white,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: OnBoardingButton(
            onPressed: () {
              controller.forgetPassword();
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
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: height / 1.15,
                    padding: EdgeInsets.symmetric(
                        vertical: height / 20, horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height / 2.2,
                          child: AspectRatio(
                              aspectRatio: .8,
                              child: Image.asset(
                                AppImagesName.imageforgetPassword,
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.fill,
                              )),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Expanded(
                          child: Text(
                            "Our team checking \n Please Enter  your Email \n To receive  verification code"
                                .tr,
                            textAlign: TextAlign.center,
                            style: AppTextStyleData.bodyMedium(
                                context,
                                AppTextScales.textScaleFactor(
                                        context) *
                                    15),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        TextFormAuth(
                          l: 0,
                          r: 0,
                          v: 0,
                          keyboardType: TextInputType.emailAddress,
                          color: Colors.black87,
                          controller: controller.emailController,
                          formKey: controller.emailFormKey,
                          label: 'Email'.tr,
                          hint: 'Enter your Email'.tr,
                          val: 'Email cant be empty'.tr,
                          icon: const Icon(
                            Icons.email_outlined,
                            color: Colors.red,
                          ),
                          onFiledSubmit: (String value) {
                            if (controller.emailFormKey.currentState!
                                .validate()) {
                              controller.forgetPassword();
                            }
                          },
                          obscure: false,
                        ),
                      ],
                    ),
                  )),
            ))));
  }
}
