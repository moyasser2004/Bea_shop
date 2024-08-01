import '../../../../../core/utrlis/api/curd.dart';
import '../../../../../core/utrlis/links/app_link.dart';

class InsertCartRemote {
  Curd curd;

  InsertCartRemote(this.curd);

  postData(
      {required String cartUserid,
      required String cartItemId,
      required String cartItemCount,
      required String cartAddressId,
      required String promoCodeDiscount,
      required String itemsCount,
      required String cartMethods}) async {
    var result = await curd.post(AppLink.cartInsertLink, {
      "cart_user_id": cartUserid,
      "cart_item_id": cartItemId,
      "cart_item_count": cartItemCount,
      "cart_address_id": cartAddressId,
      "cart_promo_code_discount": promoCodeDiscount,
      "items_count": itemsCount,
      "cart_methods": cartMethods,
    });
    return result.fold((l) => l, (r) => r);
  }
}
