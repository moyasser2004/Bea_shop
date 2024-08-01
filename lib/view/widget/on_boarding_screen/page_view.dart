import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../controller/onBoarding_controller/on_boarding_controller.dart';
import '../../../core/class/app_text_scall.dart';
import '../../../core/style/text_style.dart';
import '../../../model/data/data_source/local/on_boarding_list.dart';
import 'custom _on_boarding_image.dart';
import 'custom_on_boarding_text.dart';

class PageViewScreen extends GetView<OnBoardingController> {
  final PageController pageController;
  final double height;
  final double width;

  const PageViewScreen(
      {super.key,
      required this.pageController,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      controller: pageController,
      itemCount: onBoarding.length,
      itemBuilder: (BuildContext context, int index) => Column(
        children: [
          CustomOnBoardingImage(
            width: height,
            image: onBoarding[index].image,
          ),
          SizedBox(height: height * 0.05),
          SizedBox(
            height: height * 0.16,
            child: CustomOnBoardingText(
              text1: onBoarding[index].title1,
              text2: onBoarding[index].title2,
              text3: onBoarding[index].title3,
            ),
          ),
          const Spacer(),
          Text(
            onBoarding[index].description,
            style: AppTextStyleData.bodyMedium(
                context, AppTextScales.textScaleFactor(context) * 15),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: height * 0.05),
        ],
      ),
      onPageChanged: (i) {
        controller.currentIndex = i;
      },
    );
  }
}
