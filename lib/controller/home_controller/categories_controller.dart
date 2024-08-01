import 'package:bea_shop/core/const/app_routes.dart';
import 'package:get/get.dart';

import '../../core/function/handling_response.dart';
import '../../core/utrlis/api/curd.dart';
import '../../core/utrlis/api/request_state.dart';
import '../../model/data/data_source/remote/categories/categories.dart';

class CategoriseController extends GetxController {
  CategoriesRemote categories = CategoriesRemote(Curd());
  RequestState? state;

  List category = [];

  getCategories() async {
    category.clear();
    state = RequestState.loading;
    update();
    final result = await categories.postCategories();
    state = handleResponse(result);
    if (state == RequestState.loaded) {
      if (result["status"] == "success") {
        category.addAll(result["data"]);
      } else {
        state = RequestState.notData;
      }
    }
    update();
  }

  toItemScreen(int categoryInd) {
    Get.toNamed(AppRoutes.itemScreen,
        arguments: {"categoryInd": categoryInd});
  }

  @override
  void onInit() {
    getCategories();
    super.onInit();
  }
}
