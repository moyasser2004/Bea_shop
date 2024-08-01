import 'package:bea_shop/core/utrlis/api/request_state.dart';
import 'package:get/get.dart';

import '../../core/utrlis/api/curd.dart';
import '../../core/const/app_routes.dart';
import '../../core/function/handling_response.dart';
import '../../core/services/services.dart';
import '../../model/data/data_source/remote/favorite/get_favorite.dart';

class FavoriteController extends GetxController {
  late String userId;
  FavoriteGetRemote favoriteGetRemote = FavoriteGetRemote(Curd());
  RequestState? state;

  List favoriteData = [];

  getFromFavorite() async {
    state = RequestState.loading;
    update();
    favoriteData.clear();
    final request = await favoriteGetRemote.postData(
      userId: userId,
    );
    state = handleResponse(request);
    if (state == RequestState.loaded) {
      if (request["status"] == "success") {
        favoriteData.clear();
        favoriteData.addAll(request["data"]);
      } else {
        state = RequestState.notData;
      }
    }
    update();
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
    required bool like,
    required String colors,
    required String tag,
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
      "items_like": like,
      "items_colors": colors,
      "items_tag": tag,
      "items_images": images,
    });
  }

  Future<void> getData() async {
    userId = MyServices.sharedPreferences.getString("id")!;
    await getFromFavorite();
  }

  @override
  void onInit() {
    userId = MyServices.sharedPreferences.getString("id")!;
    getFromFavorite();
    super.onInit();
  }
}
