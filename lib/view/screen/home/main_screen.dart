import 'package:bea_shop/core/class/handle_view_data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/main_controller.dart';
import '../../../core/const/app_color.dart';
import '../../widget/home/bottomNavBar.dart';
import '../../widget/home/main_screen_app_bar.dart';
import '../../widget/home/vertical_list_items.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime? currentBackPressTime;
    MainController controller = Get.put(MainController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.sizeOf(context).height <= 700
        ? 800
        : MediaQuery.of(context).size.height;
    return GetBuilder<MainController>(
      // ignore: deprecated_member_use
      builder: (c) => WillPopScope(
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
        child: Scaffold(
          backgroundColor: AppColor.white,
          appBar:
              MainScreenAppBar(width: width, controller: controller),
          body: Stack(children: [
            controller.search
                ? HandelViewData(
                    state: controller.state!,
                    widget: VListItems(
                      searchData: controller.searchData,
                      controller: controller,
                      width: width,
                      height: height / 1.2,
                    ),
                    height: height / 1.2)
                : controller.list[controller.currentIndex],
            !controller.search
                ? BottomNavBar(
                    currentIndex: controller.currentIndex,
                    onTap: (int index) {
                      controller.getIndex(index);
                    },
                  )
                : const SizedBox.shrink(),
          ]),
          floatingActionButton: controller.search
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: FloatingActionButton(
                    onPressed: () {
                      controller.getIndex(2);
                    },
                    backgroundColor: controller.currentIndex == 2
                        ? AppColor.black.withOpacity(.9)
                        : AppColor.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(Icons.home_outlined,
                        color: controller.currentIndex == 2
                            ? AppColor.white
                            : AppColor.black.withOpacity(.9)),
                  ),
                ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}
