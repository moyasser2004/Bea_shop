import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/onBoarding_controller/on_boarding_controller.dart';
import '../../../core/services/services.dart';
import '../../../model/data/data_source/local/on_boarding_list.dart';
import '../../widget/on_boarding_screen/custom_on_boarding_button.dart';
import '../../widget/on_boarding_screen/custom_on_boarding_smooth_page.dart';
import '../../widget/on_boarding_screen/page_view.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingController());
    double height = MediaQuery.sizeOf(context).height < 600
        ? 900
        : MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: OnBoardingButton(
          onPressed: () async {
            if (controller.currentIndex == onBoarding.length - 1) {
              await MyServices.sharedPreferences
                  .setString("step", "1");
              controller.toLogin();
            } else {
              controller.pageController.nextPage(
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.fastEaseInToSlowEaseOut);
            }
          },
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: height / 1.169,
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: PageViewScreen(
                  height: height / 2,
                  width: width,
                  pageController: controller.pageController,
                ),
              ),
              const Spacer(),
              SmoothPage(
                controller: controller,
                width: width,
              ),
              const Spacer(),
            ],
          ),
        ),
      )),
    );
  }
}
