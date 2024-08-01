import 'package:bea_shop/core/const/app_color.dart';
import 'package:bea_shop/core/const/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../controller/auth_controller/sigIn_success/checkCode_controller.dart';
import '../../../../core/class/app_text_scall.dart';
import '../../../../core/style/text_style.dart';
import '../../../widget/on_boarding_screen/custom_on_boarding_button.dart';

class CheckCode extends StatelessWidget {
  CheckCode({super.key});

  final CheckCodeController controller =
      Get.put(CheckCodeController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height < 600
        ? 700
        : MediaQuery.of(context).size.height;
    DateTime? currentBackPressTime;
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: OnBoardingButton(
            onPressed: () {
              controller.checkCode();
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
              child: Container(
                height: height / 1.2,
                padding: EdgeInsets.symmetric(
                    vertical: height / 20, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: height / 2.2,
                      child: AspectRatio(
                          aspectRatio: .8,
                          child: ClipOval(
                            child: Image.asset(
                              AppImagesName.imageVerification,
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fill,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Text(
                        "Please Enter  your  Digit  Code \n Send  to ${controller.email}"
                            .tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyleData.bodyMedium(
                            context,
                            AppTextScales.textScaleFactor(context) *
                                15),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    OtpTextField(
                      enabledBorderColor: AppColor.black54,
                      fieldWidth: 45.0,
                      numberOfFields: 5,
                      borderRadius: BorderRadius.circular(12),
                      clearText: true,
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {},
                      onSubmit: (String verificationCode) {
                        controller.verifyController.text =
                            verificationCode;
                        controller.checkCode();
                      }, // end onSubmit
                    ),
                  ],
                ),
              ),
            ))));
  }
}
