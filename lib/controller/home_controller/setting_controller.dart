import 'package:bea_shop/core/utrlis/api/request_state.dart';
import 'package:bea_shop/core/const/app_routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/function/handling_response.dart';
import '../../core/utrlis/api/curd.dart';
import '../../core/services/services.dart';
import '../../model/data/data_source/remote/auth/logOut_remote.dart';

class ProfileController extends GetxController {
  late String email;
  late String name;
  late bool notify;
  bool lang = false;

  RemoveRemote removeRemote = RemoveRemote(Curd());
  RequestState? state;

  void changeNotify() async {
    notify = !notify;
    await MyServices.sharedPreferences.setBool("notify", notify);
    getNotify(notify);
    update();
  }

  void changeLang() {
    lang = !lang;
    update();
  }

  toAddress() {
    Get.toNamed(AppRoutes.addAddressScreen);
  }

  toMyOrder() {
    Get.toNamed(AppRoutes.myOrderScreen);
  }

  toLogin() async {
    String id = MyServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$id");
    await MyServices.sharedPreferences.remove("id");
    await MyServices.sharedPreferences.remove("name");
    await MyServices.sharedPreferences.remove("email");
    await MyServices.sharedPreferences.remove("phone");
    await MyServices.sharedPreferences.remove("step");
    await MyServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.loginScreen);
  }

  removeAccount() async {
    state = RequestState.loading;
    update();
    final result =
        await removeRemote.changeLogOut(name: name, email: email);
    state = handleResponse(result);
    if (state == RequestState.loaded) {
      if (result["status"] == "success") {
        toLogin();
      }
    }
  }

  launch(String link) async {
    await launchUrl(Uri.parse(link));
  }

  getNotify(bool n) {
    if (n) {
      FirebaseMessaging.instance.subscribeToTopic("users");
    } else {
      FirebaseMessaging.instance.unsubscribeFromTopic("users");
    }
  }

  @override
  void onInit() {
    name = MyServices.sharedPreferences.getString("name")!;
    email = MyServices.sharedPreferences.getString("email")!;
    notify = MyServices.sharedPreferences.getBool("notify") ?? true;
    getNotify(notify);
    super.onInit();
  }
}
