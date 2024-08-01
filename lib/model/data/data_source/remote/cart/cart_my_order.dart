import '../../../../../core/utrlis/api/curd.dart';
import '../../../../../core/utrlis/links/app_link.dart';

class MyOrderRemote {
  Curd curd;
  MyOrderRemote(this.curd);

  postData(String cartUserId) async {
    var result = await curd
        .post(AppLink.myOrderLink, {"cart_user_id": cartUserId});
    return result.fold((l) => l, (r) => r);
  }
}
