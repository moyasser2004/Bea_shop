import 'package:bea_shop/core/class/app_text_scall.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/main_controller.dart';
import '../../../core/const/app_color.dart';
import '../../../core/const/app_routes.dart';
import '../../../core/style/text_style.dart';
import '../custom_auth/text_form_auth.dart';

class MainScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const MainScreenAppBar(
      {super.key, required this.width, required this.controller});

  final double width;
  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: AppColor.primary,
      title: controller.search
          ? IconButton(
              onPressed: () {
                controller.isNotSearch();
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 26,
                color: AppColor.white,
              ),
            )
          : Text(
              "BEA Shop",
              style: AppTextStyleData.googleRoboto(
                  color: AppColor.white,
                  context: context,
                  fontSize:
                      22 * AppTextScales.textScaleFactor(context)),
            ),
      actions: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 9.7),
              width: width / 2.8,
              decoration: BoxDecoration(
                  color: AppColor.grey200,
                  borderRadius: BorderRadius.circular(20)),
              child: TextFormAuth(
                r: 0,
                l: 0,
                v: 5,
                h: 12,
                controller: controller.searchController,
                formKey: controller.searchKey,
                label: "",
                hint: 'Search',
                val: 'search cant be empty',
                icon: const Icon(Icons.search),
                onFiledSubmit: (String value) {
                  controller.getSearch();
                  controller.isSearch();
                },
                obscure: false,
                color: AppColor.grey700!,
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 15, vertical: 9),
              width: width / 7,
              decoration: BoxDecoration(
                  color: AppColor.grey200,
                  borderRadius: BorderRadius.circular(12)),
              child: IconButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.cartScreen);
                },
                splashRadius: 30,
                splashColor: Colors.white.withOpacity(.4),
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                ),
                color: AppColor.black,
                iconSize: 22,
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
