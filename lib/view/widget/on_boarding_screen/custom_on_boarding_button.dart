import 'package:bea_shop/core/const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/onBoarding_controller/on_boarding_controller.dart';
import '../../../core/style/text_style.dart';

class OnBoardingButton extends GetView<OnBoardingController> {
  final void Function() onPressed;
  final String? text;

  const OnBoardingButton(
      {super.key, required this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            backgroundColor: AppColor.primary,
            padding: const EdgeInsets.symmetric(horizontal: 5)),
        child: Text(
          text == null ? "Let's go".tr : "$text",
          style: AppTextStyleData.buttonTextOnBoarding(context),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
