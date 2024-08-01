import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/const/app_routes.dart';

class OnBoardingController extends GetxController {
  late PageController pageController;
  int currentIndex = 0;

  toLogin() {
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
