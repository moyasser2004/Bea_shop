import 'package:bea_shop/view/screen/home/categories_screen.dart';
import 'package:bea_shop/view/screen/home/favorite_screen.dart';
import 'package:bea_shop/view/screen/home/home_screen.dart';
import 'package:bea_shop/view/screen/home/my_oredr_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utrlis/api/curd.dart';
import '../../core/utrlis/api/request_state.dart';
import '../../core/const/app_routes.dart';
import '../../core/function/handling_response.dart';
import '../../core/services/services.dart';
import '../../model/data/data_source/remote/items/saerch_remote.dart';
import '../../view/screen/home/profile_screen.dart';

class MainController extends GetxController {
  late int currentIndex;
  late GlobalKey bottomNavigationKey;
  late String lang;
  late TextEditingController searchController;
  late GlobalKey<FormState> searchKey;

  List<Widget> list = [
    const ProfileScreen(),
    const CategoriesScreen(),
    const HomeScreen(),
    const FavoriteScreen(),
    const MyOrderScreen(),
  ];

  void getIndex(int index) {
    currentIndex = index;
    update();
  }

  //search

  SearchRemote searchRemote = SearchRemote(Curd());
  List searchData = [];
  RequestState? state;
  bool search = false;

  getSearch() async {
    searchData.clear();
    state = RequestState.loading;
    update();
    final result = await searchRemote.postData(
        search: searchController.text.trim().toString());
    state = handleResponse(result);
    if (state == RequestState.loaded) {
      if (result["status"] == "success") {
        searchData.clear();
        searchData.addAll(result["data"]);
      } else {
        state = RequestState.notData;
      }
    }
    update();
  }

  isSearch() {
    if (searchController.text.isNotEmpty) {
      search = true;
    } else {
      search = false;
    }
    update();
  }

  isNotSearch() {
    searchController.text = "";
    isSearch();
  }

  toProductDetails(
      {required int count,
      required String date,
      required int price,
      required int discount,
      required String nameAr,
      required String nameEn,
      required String image,
      required String desAr,
      required String desEn,
      required int id,
      required double rate,
      required String colors,
      required String tag,
      required List images}) {
    Get.toNamed(AppRoutes.productDetailsScreen, arguments: {
      "items_count": count,
      "items_date": date,
      "items_price": price,
      "items_discount": discount,
      "items_name_ar": nameAr,
      "items_name": nameEn,
      "items_image": image,
      "items_des_ar": desAr,
      "items_des": desEn,
      "items_id": id,
      "items_rate": rate,
      "items_colors": colors,
      "items_tag": tag,
      "items_images": images,
    });
  }

  void toCartScreen() {
    Get.toNamed(AppRoutes.cartScreen);
  }

  @override
  void onInit() {
    currentIndex = 2;
    bottomNavigationKey = GlobalKey();
    lang = MyServices.sharedPreferences.getString("language") ?? "";
    searchController = TextEditingController();
    searchKey = GlobalKey<FormState>();
    super.onInit();
  }
}
