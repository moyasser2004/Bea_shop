import '../../../../../core/utrlis/api/curd.dart';
import '../../../../../core/utrlis/links/app_link.dart';

class ViewCartRemote {
  Curd curd;

  ViewCartRemote(this.curd);

  postData({
    required String cartUserid,
  }) async {
    var result = await curd.post(AppLink.cartViewLink, {
      "cart_user_id": cartUserid,
    });
    return result.fold((l) => l, (r) => r);
  }

  postCouponView({
    required String couponName,
  }) async {
    var result = await curd.post(AppLink.couponViewLink, {
      "coupon_name": couponName,
    });
    return result.fold((l) => l, (r) => r);
  }

  postCouponAdd({
    required String couponName,
    required String couponCount,
  }) async {
    var result = await curd.post(AppLink.couponAddLink, {
      "coupon_name": couponName,
      "coupon_count": couponCount,
    });
    return result.fold((l) => l, (r) => r);
  }
}
