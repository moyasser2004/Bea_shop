import 'package:bea_shop/controller/home_controller/setting_controller.dart';
import 'package:bea_shop/core/const/app_color.dart';
import 'package:bea_shop/core/const/app_images.dart';
import 'package:bea_shop/core/localization/controller_local.dart';
import 'package:bea_shop/core/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/home/profile_screen_cart.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    double height = MediaQuery.of(context).size.height < 800
        ? 900
        : MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        height: height * 1.03,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 2),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    maxRadius: 75,
                    backgroundColor: AppColor.primaryLight,
                    child: CircleAvatar(
                        maxRadius: 70,
                        backgroundImage: AssetImage(
                          AppImagesName.imagePerson,
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.facebook,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    child: Icon(
                      Icons.sensor_occupied_sharp,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    child: Icon(
                      Icons.touch_app_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GetBuilder<ProfileController>(
                  builder: (controller) => Column(
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              Text(controller.name,
                                  style: AppTextStyleData
                                      .googleSeaweedScript(
                                          fontSize: 25))
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [Text(controller.email)],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ProfileScreenCart(
                            leading: Icon(
                              controller.notify
                                  ? Icons.notification_add
                                  : Icons.notifications_off,
                              color: AppColor.primaryLight,
                            ),
                            title: 'Notification',
                            onTap: () => controller.changeNotify(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ProfileScreenCart(
                            leading: const Icon(
                              Icons.question_mark_outlined,
                              color: AppColor.primaryLight,
                            ),
                            title: 'about us',
                            onTap: () => controller.launch(
                                'https://www.facebook.com/profile.php?id=100008757818870&mibextid=ZbWKwL'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ProfileScreenCart(
                            leading: const Icon(
                              Icons.phone_callback_outlined,
                              color: AppColor.primaryLight,
                            ),
                            title: 'Contact us',
                            onTap: () => controller.launch(
                                'https://wa.me/<20 01201496372>'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GetBuilder<TranslationController>(
                              builder: (logic) {
                            return ProfileScreenCart(
                              leading: const Icon(
                                Icons.published_with_changes_outlined,
                                color: AppColor.primaryLight,
                              ),
                              title: 'Change Lang',
                              onTap: () {
                                controller.changeLang();
                                if (controller.lang) {
                                  logic.changeLanguage("ar");
                                } else {
                                  logic.changeLanguage("en");
                                }
                              },
                            );
                          }),
                          const SizedBox(
                            height: 10,
                          ),
                          ProfileScreenCart(
                            leading: const Icon(
                              Icons.logout,
                              color: AppColor.primaryLight,
                            ),
                            title: 'Logout',
                            onTap: () => controller.toLogin(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ProfileScreenCart(
                            leading: const Icon(
                              Icons.no_accounts_sharp,
                              color: AppColor.primaryLight,
                            ),
                            title: 'Remove Account',
                            onTap: () {},
                          ),
                        ],
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
