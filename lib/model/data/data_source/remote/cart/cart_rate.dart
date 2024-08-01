import 'package:bea_shop/core/utrlis/links/app_link.dart';

import '../../../../../core/utrlis/api/curd.dart';

class CartRateRemote {
  Curd curd;
  CartRateRemote(this.curd);

  postData({
    required String cartId,
    required String cartItemRate,
    required String cartItemId,
  }) async {
    var response = await curd.post(AppLink.raterLink, {
      "cart_id": cartId,
      "cart_item_rate": cartItemRate,
      "cart_item_id": cartItemId,
    });
    return response.fold((l) => l, (r) => r);
  }

  postDoubleRate({
    required String cartId,
    required String cartItemID,
    required String cartDoubleRate,
  }) async {
    var response = await curd.post(AppLink.doubleRaterLink, {
      "new_items_rate": cartDoubleRate,
      "cart_item_id": cartItemID,
      "cart_id": cartId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
