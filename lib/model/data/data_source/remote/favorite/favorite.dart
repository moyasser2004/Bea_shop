import '../../../../../core/utrlis/api/curd.dart';
import '../../../../../core/utrlis/links/app_link.dart';

class FavoriteRemote {
  Curd curd;

  FavoriteRemote(this.curd);

  postData({
    required String itemId,
    required String userId,
  }) async {
    var result = await curd.post(AppLink.favoriteInsertLink, {
      "user_id": userId,
      "item_id": itemId,
    });
    return result.fold((l) => l, (r) => r);
  }
}
