import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../controller/onBoarding_controller/on_boarding_controller.dart';
import '../../../core/const/app_color.dart';
import '../../../model/data/data_source/local/on_boarding_list.dart';

class SmoothPage extends StatelessWidget {
  const SmoothPage(
      {super.key, required this.controller, required this.width});
  final OnBoardingController controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller.pageController,
      count: onBoarding.length,
      effect: ExpandingDotsEffect(
        activeDotColor: AppColor.primary,
        dotColor: AppColor.black,
        dotHeight: 7,
        dotWidth: width / 20,
        spacing: 7,
        expansionFactor: 3,
        radius: 20,
      ),
    );
  }
}
