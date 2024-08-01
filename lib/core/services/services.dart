import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import '../function/notefication_change.dart';

class MyServices extends GetxService {
  static late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    sharedPreferences = await SharedPreferences.getInstance();
    requestPermissionNotification();
    fcmConfig();
    return this;
  }
}

Future<void> intiServices() async {
  await Get.putAsync(() => MyServices().init());
}
