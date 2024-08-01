import 'package:bea_shop/core/const/app_color.dart';
import 'package:bea_shop/core/const/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/const/app_routes.dart';
import '../../../core/localization/controller_local.dart';
import '../../widget/custom_auth/button_auth.dart';

class ChangeLang extends GetView<TranslationController> {
  const ChangeLang({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.white,
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonAuth(
              color: AppColor.primary,
              bottom: 10,
              text: "Arabic Language".tr,
              onTap: () {
                controller.changeLanguage("ar");
                Get.offAllNamed(AppRoutes.onBoarding);
              },
            ),
            ButtonAuth(
              color: AppColor.primary,
              bottom: 12,
              text: "English Language".tr,
              onTap: () {
                controller.changeLanguage("en");
                Get.offAllNamed(AppRoutes.onBoarding);
              },
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: AspectRatio(
              aspectRatio: 16 / 18,
              child: Image.asset(
                AppImagesName.imageLang,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ));
  }
}
