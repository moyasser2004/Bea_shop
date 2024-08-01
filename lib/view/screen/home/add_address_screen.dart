import 'package:bea_shop/controller/home_controller/add_address_controller.dart';
import 'package:bea_shop/core/const/app_color.dart';
import 'package:bea_shop/view/widget/on_boarding_screen/custom_on_boarding_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/style/text_style.dart';
import '../../widget/custom_auth/text_form_auth.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height < 400
        ? 600
        : MediaQuery.of(context).size.height;
    return GetBuilder<AddAddressController>(
      builder: (controller) => Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: AppColor.primary,
            title: Text(
              "BEA Shop",
              style: AppTextStyleData.googleRobotoSlab(
                  color: AppColor.white),
            ),
            centerTitle: true,
          ),
          backgroundColor: AppColor.white,
          bottomNavigationBar: OnBoardingButton(
            text: 'Add My Address',
            onPressed: () {
              controller.sendAddress();
            },
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 30),
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  height: height / 3.3,
                  width: width / 1.24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)),
                  child: Image.asset(
                    "images/photo_2023-10-02_18-44-13.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: height / 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormAuth(
                    colorLabel: AppColor.black54,
                    controller: controller.coverController,
                    formKey: controller.coverKey,
                    label: 'Governorate',
                    hint: 'Alex',
                    val: 'Governorate cant be empty',
                    icon: const Icon(
                      Icons.add_location_alt_outlined,
                      color: AppColor.primaryLight,
                    ),
                    onFiledSubmit: (String value) {
                      controller.sendAddress();
                    },
                    obscure: false,
                    color: AppColor.grey600!,
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormAuth(
                    v: 0,
                    colorLabel: AppColor.black54,
                    controller: controller.cityController,
                    formKey: controller.cityKey,
                    label: 'City',
                    hint: 'Borg El Arab',
                    val: 'City cant be empty',
                    icon: const Icon(
                      Icons.location_city,
                      color: AppColor.primaryLight,
                    ),
                    onFiledSubmit: (String value) {
                      controller.sendAddress();
                    },
                    obscure: false,
                    color: AppColor.grey600!,
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormAuth(
                    v: 0,
                    colorLabel: AppColor.black54,
                    controller: controller.streetController,
                    formKey: controller.streetKey,
                    label: 'Street',
                    hint: 'El Ahale Street',
                    val: 'Street cant be empty',
                    icon: const Icon(
                      Icons.add_home_work_outlined,
                      color: AppColor.primaryLight,
                    ),
                    onFiledSubmit: (String value) {
                      controller.sendAddress();
                    },
                    obscure: false,
                    color: AppColor.grey600!,
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormAuth(
                    v: 0,
                    colorLabel: AppColor.black54,
                    controller: controller.phoneController,
                    formKey: controller.phoneKey,
                    label: 'Phone',
                    hint: 'Phone Number',
                    val: 'Phone cant be empty',
                    icon: const Icon(
                      Icons.phone_callback_outlined,
                      color: AppColor.primaryLight,
                    ),
                    onFiledSubmit: (String value) {
                      controller.sendAddress();
                    },
                    obscure: false,
                    color: AppColor.grey600!,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ))),
    );
  }
}
