import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../services/services.dart';

class TranslationController extends GetxController {
  void changeLanguage(String language) async {
    Locale locale = Locale(language);
    await MyServices.sharedPreferences
        .setString("language", language);
  }

  Locale? initLocal =
      MyServices.sharedPreferences.getString("language") == null
          ? Get.deviceLocale
          : MyServices.sharedPreferences.getString("language") == "en"
              ? const Locale("en")
              : const Locale("ar");
}
