import 'package:bea_shop/core/utrlis/api/curd.dart';
import 'package:bea_shop/core/utrlis/api/request_state.dart';
import 'package:bea_shop/core/function/handling_response.dart';
import 'package:get/get.dart';

import '../../core/services/services.dart';
import '../../model/data/data_source/remote/cart/cart_my_order.dart';
import '../../model/data/data_source/remote/cart/cart_rate.dart';

class MyOrderController extends GetxController {
  MyOrderRemote myOrderRemote = MyOrderRemote(Curd());
  RequestState? state;
  List data = [];
  late String userId;

  getData() async {
    state = RequestState.loading;
    update();
    final result = await myOrderRemote.postData(userId);
    state = handleResponse(result);
    if (state == RequestState.loaded) {
      if (result["status"] == "success") {
        data.addAll(result["data"]);
      } else {}
    }
    update();
  }

  refGet() {
    data.clear();
    getData();
    update();
  }

  //Rate
  CartRateRemote cartRateRemote = CartRateRemote(Curd());
  RequestState? state2;

  postRate({
    required String cartId,
    required String cartItemRate,
    required String cartItemId,
  }) async {
    state2 = RequestState.loading;
    update();
    final result = await cartRateRemote.postData(
        cartId: cartId,
        cartItemRate: cartItemRate,
        cartItemId: cartItemId);

    state2 = handleResponse(result);
    if (state2 == RequestState.loaded) {
      postDoubleRate(
          cartId: cartId, cartItemId: cartItemId, data: result);
    }
  }

  postDoubleRate({
    required String cartId,
    required String cartItemId,
    required Map data,
  }) async {
    state2 = RequestState.loading;
    update();
    final result = await cartRateRemote.postDoubleRate(
      cartId: cartId,
      cartItemID: cartItemId,
      cartDoubleRate: data["data"]["sum"].toString(),
    );
    state2 = handleResponse(result);
    if (state2 == RequestState.loaded) {
      if (result["status"] == "success") {
        refGet();
      } else {}
    }
  }

  @override
  void onInit() {
    userId = MyServices.sharedPreferences.getString("id")!;
    getData();
    super.onInit();
  }
}
