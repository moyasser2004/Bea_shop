import 'package:bea_shop/core/const/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/utrlis/api/curd.dart';
import '../../core/utrlis/api/request_state.dart';
import '../../core/function/handling_response.dart';
import '../../core/services/services.dart';
import '../../core/utrlis/api/curd.dart';
import '../../model/data/data_source/remote/address/address_remote.dart';

class AddAddressController extends GetxController {
  late TextEditingController cityController;
  late TextEditingController coverController;
  late TextEditingController streetController;
  late TextEditingController phoneController;
  late GlobalKey<FormState> cityKey;
  late GlobalKey<FormState> coverKey;
  late GlobalKey<FormState> streetKey;
  late GlobalKey<FormState> phoneKey;

  AddressRemote addressRemote = AddressRemote(Curd());
  RequestState? state;
  late String userId;
  List data = [];

  addAddress() async {
    state = RequestState.loading;
    update();
    final result = await addressRemote.addData(
      city: cityController.text.trim().toString(),
      street: streetController.text.trim().toString(),
      addressGovernoral: coverController.text.trim().toString(),
      addressPhone: phoneController.text.trim().toString(),
      userId: userId,
    );

    state = handleResponse(result);
    if (state == RequestState.loaded) {
      if (result["status"] == "success") {
        data.add(result["data"]);
        MyServices.sharedPreferences.remove("address_id");
        MyServices.sharedPreferences.remove("AddressAdded");
        await MyServices.sharedPreferences
            .setBool("AddressAdded", true);
        await MyServices.sharedPreferences.setString(
            "address_id", data[0]["address_id"].toString());

        await MyServices.sharedPreferences.remove(
          "coverController",
        );
        await MyServices.sharedPreferences.remove("cityController");
        await MyServices.sharedPreferences.remove("streetController");
        await MyServices.sharedPreferences.remove("phoneController");

        await MyServices.sharedPreferences.setString(
            "coverController", coverController.text.toString());
        await MyServices.sharedPreferences.setString(
            "cityController", cityController.text.toString());
        await MyServices.sharedPreferences.setString(
            "streetController", streetController.text.toString());
        await MyServices.sharedPreferences.setString(
            "phoneController", phoneController.text.toString());

        Get.offNamed(
          AppRoutes.cartScreen,
        );
      } else {
        state = RequestState.notData;
      }
    }
  }

  sendAddress() {
    if (coverKey.currentState!.validate() &&
        cityKey.currentState!.validate() &&
        streetKey.currentState!.validate() &&
        phoneKey.currentState!.validate()) {
      addAddress();
    }
  }

  @override
  void onInit() {
    userId = MyServices.sharedPreferences.getString("id")!;
    cityController = TextEditingController();
    coverController = TextEditingController();
    streetController = TextEditingController();
    phoneController = TextEditingController();

    coverController.text =
        MyServices.sharedPreferences.getString("coverController") ??
            "";
    cityController.text =
        MyServices.sharedPreferences.getString("cityController") ??
            "";
    streetController.text =
        MyServices.sharedPreferences.getString("streetController") ??
            "";
    phoneController.text =
        MyServices.sharedPreferences.getString("phoneController") ??
            "";

    cityKey = GlobalKey<FormState>();
    coverKey = GlobalKey<FormState>();
    streetKey = GlobalKey<FormState>();
    phoneKey = GlobalKey<FormState>();
    super.onInit();
  }
}
