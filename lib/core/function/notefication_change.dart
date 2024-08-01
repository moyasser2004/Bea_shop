import 'package:get/get.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../controller/home_controller/home_controller.dart';
import '../../controller/home_controller/my_order_controller.dart';

Future<void> requestPermissionNotification() async {}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((message) {
    Get.snackbar(message.notification!.title!,
        "${message.notification!.body!} " "${message.data['pageid']}",
        duration: const Duration(seconds: 7));
    refreshPageNotification(message.data);
  });
}

refreshPageNotification(data) {
  if (data['pagename'] == "orders") {
    MyOrderController controller = Get.put(MyOrderController());
    controller.refGet();
  }

  if (data['pagename'] == "items") {
    HomeController controller = Get.put(HomeController());
    controller.getData();
  }

  if (Get.currentRoute == "/CategoriesScreen" &&
      data['pagename'] == "category") {
    HomeController controller = Get.put(HomeController());
    controller.getData();
  }
}
