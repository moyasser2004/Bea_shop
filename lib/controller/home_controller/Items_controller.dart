import 'package:bea_shop/core/const/app_routes.dart';
import 'package:bea_shop/core/function/handling_response.dart';
import 'package:bea_shop/core/utrlis/api/request_state.dart';
import 'package:get/get.dart';

import '../../core/utrlis/api/curd.dart';
import '../../model/data/data_source/remote/items/item_selected_remote.dart';

class ItemsController extends GetxController {
  late String id;

  ItemSelectRemote itemSelectRemote = ItemSelectRemote(Curd());
  RequestState? state;
  List items = [];

  getItems(String itemsId) async {
    state = RequestState.loading;
    update();
    final result = await itemSelectRemote.postData(itemsId);
    state = handleResponse(result);
    if (state == RequestState.loaded) {
      if (result["status"] == "success") {
        items.addAll(result["data"]);
      } else {
        state = RequestState.notData;
      }
    }
    update();
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

  @override
  void onInit() {
    id = Get.arguments["categoryInd"].toString();
    getItems(id);
    super.onInit();
  }
}
