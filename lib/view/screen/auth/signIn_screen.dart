import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'package:progress_state_button/progress_button.dart';

import '../../../controller/auth_controller/sigin_controller.dart';
import '../../../core/const/app_images.dart';
import '../../../core/style/text_style.dart';
import '../../widget/custom_auth/mu_behavior_class.dart';
import '../../widget/custom_auth/text_form_auth.dart';
import '../../widget/custom_auth/text_top_padding.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final SigInController controller = Get.put(SigInController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height < 750
        ? 800
        : MediaQuery.of(context).size.height;
    double width = MediaQuery.sizeOf(context).width;
    DateTime? currentBackPressTime;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        // ignore: deprecated_member_use
        body: WillPopScope(
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
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              child: SizedBox(
                height: height,
                child: Stack(
                  children: [
                    SizedBox(
                      height: height,
                      child: Image.asset(
                        AppImagesName.imageOneLo,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              width: width * .9 - 65,
                              decoration: BoxDecoration(
                                color:
                                    Colors.grey[900]?.withOpacity(.8),
                                borderRadius:
                                    BorderRadius.circular(25),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextTopPadding(
                                    top: width * .10,
                                    bottom: width * .09,
                                    text: 'Sign In'.tr,
                                  ),
                                  TextFormAuth(
                                    h: 15,
                                    v: 0,
                                    keyboardType: TextInputType.text,
                                    color: Colors.white,
                                    obscure: false,
                                    controller:
                                        controller.nameController,
                                    formKey: controller.formKeyName,
                                    label: "Name".tr,
                                    hint: "Enter your Name".tr,
                                    val: 'Name can\'t be empty'.tr,
                                    icon: const Icon(
                                        Icons.person_outline_rounded,
                                        color: Colors.red),
                                    onFiledSubmit: (String value) {
                                      controller.sigiIn();
                                    },
                                  ),
                                  TextFormAuth(
                                    h: 15,
                                    v: 0,
                                    keyboardType:
                                        TextInputType.emailAddress,
                                    color: Colors.white,
                                    obscure: false,
                                    controller:
                                        controller.emailController,
                                    formKey: controller.formKeyEmail,
                                    label: "Email".tr,
                                    hint: "Enter your Email".tr,
                                    val: 'Email can\'t be empty'.tr,
                                    icon: const Icon(
                                        Icons.email_outlined,
                                        color: Colors.red),
                                    onFiledSubmit: (String value) {
                                      controller.sigiIn();
                                    },
                                  ),
                                  GetBuilder<SigInController>(
                                    builder: (con) => TextFormAuth(
                                      h: 15,
                                      v: 0,
                                      keyboardType:
                                          TextInputType.text,
                                      color: Colors.white,
                                      obscure:
                                          controller.showPassword,
                                      controller: controller
                                          .passwordController,
                                      formKey:
                                          controller.formKeyPassword,
                                      label: "Password".tr,
                                      hint: "Enter your Password".tr,
                                      val: 'Password can\'t be empty'
                                          .tr,
                                      icon: IconButton(
                                        onPressed: () {
                                          controller
                                              .changeShowPassword();
                                        },
                                        icon: Icon(
                                            controller.showPassword
                                                ? Icons
                                                    .lock_outline_sharp
                                                : Icons
                                                    .lock_open_rounded,
                                            color: Colors.red),
                                      ),
                                      onFiledSubmit: (String value) {
                                        controller.sigiIn();
                                      },
                                    ),
                                  ),
                                  TextFormAuth(
                                    h: 15,
                                    v: 0,
                                    mine: 11,
                                    keyboardType:
                                        TextInputType.number,
                                    color: Colors.white,
                                    obscure: false,
                                    controller:
                                        controller.phoneController,
                                    formKey: controller.formKeyPhone,
                                    label: "Phone".tr,
                                    hint:
                                        "Enter your Phone Number".tr,
                                    val: 'Phone cant be empty'.tr,
                                    icon: const Icon(
                                        Icons.phone_android,
                                        color: Colors.red),
                                    onFiledSubmit: (String value) {
                                      controller.sigiIn();
                                    },
                                  ),
                                  GetBuilder<SigInController>(
                                    builder: (controller) =>
                                        ProgressButton.icon(
                                            maxWidth: 200.0,
                                            height: 47.0,
                                            iconedButtons: {
                                              ButtonState.idle:
                                                  IconedButton(
                                                      text: 'Send',
                                                      icon: const Icon(
                                                          Icons.send,
                                                          color: Colors
                                                              .white),
                                                      color: Colors
                                                          .deepPurple
                                                          .shade500),
                                              ButtonState.loading:
                                                  IconedButton(
                                                      text: 'Loading',
                                                      color: Colors
                                                          .deepPurple
                                                          .shade700),
                                              ButtonState.fail:
                                                  IconedButton(
                                                      text: 'Failed',
                                                      icon: const Icon(
                                                          Icons
                                                              .cancel,
                                                          color: Colors
                                                              .white),
                                                      color: Colors
                                                          .red
                                                          .shade300),
                                              ButtonState.success:
                                                  IconedButton(
                                                      text: 'Success',
                                                      icon:
                                                          const Icon(
                                                        Icons
                                                            .check_circle,
                                                        color: Colors
                                                            .white,
                                                      ),
                                                      color: Colors
                                                          .green
                                                          .shade400)
                                            },
                                            onPressed: controller
                                                .onPressedIconWithText,
                                            state: controller
                                                .stateTextWithIcon),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Forget".tr,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color:
                                                      Colors.white),
                                            ),
                                            RichText(
                                              text: TextSpan(
                                                text: 'Password'.tr,
                                                style:
                                                    AppTextStyleData
                                                        .googleAmIri(
                                                  fontSize: 16,
                                                ).copyWith(
                                                  decoration:
                                                      TextDecoration
                                                          .underline,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap =
                                                          () async {
                                                        HapticFeedback
                                                            .lightImpact();
                                                        await Fluttertoast
                                                            .showToast(
                                                          msg:
                                                              'forget password'
                                                                  .tr,
                                                        );
                                                        controller
                                                            .toForgetPassword();
                                                      },
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
