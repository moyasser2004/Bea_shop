import 'package:bea_shop/core/utrlis/api/request_state.dart';
import 'package:bea_shop/core/const/app_routes.dart';
import 'package:bea_shop/model/data/data_source/remote/categories/categories.dart';
import 'package:get/get.dart';

import '../../core/utrlis/api/curd.dart';
import '../../core/function/handling_response.dart';

class HomeController extends GetxController {
  CategoriesRemote categories = CategoriesRemote(Curd());
  RequestState? state;

  List category = [];
  List item = [];
  List itemNow = [];
  List itemTop = [];
  List itemTopSelling = [];

  getCategories() async {
    category.clear();
    item.clear();
    item.clear();
    itemNow.clear();
    state = RequestState.loading;
    update();
    final result = await categories.postData();
    state = handleResponse(result);
    if (state == RequestState.loaded) {
      if (result["status"] == "success") {
        category.addAll(result["categories"]);
        item.addAll(result["itemView"]);
        itemNow.addAll(result["itemNow"]);
      } else {
        state = RequestState.notData;
      }
    }
    update();
  }

  // top selling items
  getTopSelling() async {
    itemTopSelling.clear();
    for (int i = 0; i < itemNow.length; i++) {
      if (itemNow[i]["item_top_selling"] == 1) {
        itemTopSelling.add(itemNow[i]);
      }
    }
    update();
  }

  // get  top item
  getItemsTop() async {
    itemTop.clear();
    state = RequestState.loading;
    update();
    final result = await categories.postItemTop();
    state = handleResponse(result);
    if (state == RequestState.loaded) {
      if (result["status"] == "success") {
        itemTop.addAll(result["data"]);
      }
    }
    update();
  }

  toCategory(List categories) {
    Get.toNamed(AppRoutes.categoriesScreen, arguments: {
      "categories": categories,
    });
  }

  toProductDetails({
    required int count,
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
    required String tag,
    required String colors,
    required List images,
  }) {
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
      "items_tag": tag,
      "items_colors": colors,
      "items_images": images,
    });
  }

  Future<void> getData() async {
    await getCategories();
    await getItemsTop();
    await getTopSelling();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  void onClose() {
    category.clear();
    item.clear();
    itemNow.clear();
    itemTop.clear();
    itemTopSelling.clear();
    super.onClose();
  }
}
