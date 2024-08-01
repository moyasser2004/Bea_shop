import 'package:bea_shop/core/const/routes.dart';
import 'package:bea_shop/view/screen/auth/login_screen.dart';
import 'package:bea_shop/view/screen/on_boarding/change_language_screen.dart';
import 'package:bea_shop/view/screen/splash/splach_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/localization/controller_local.dart';
import 'core/localization/translation_local.dart';
import 'core/services/services.dart';
import 'core/theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intiServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final TranslationController controller =
      Get.put(TranslationController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "BEA Shop",
      debugShowCheckedModeBanner: false,
      home: MyServices.sharedPreferences.getString("step") == "2"
          ? const MyCustomSplashScreen()
          : MyServices.sharedPreferences.getString("step") == "1"
              ? LogInScreen()
              : const ChangeLang(),
      getPages: routes,
      locale: controller.initLocal,
      theme: ThemesData.theme,
    );
  }
}
