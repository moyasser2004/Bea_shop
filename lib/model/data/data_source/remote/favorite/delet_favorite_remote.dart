import '../../../../../core/utrlis/api/curd.dart';
import '../../../../../core/utrlis/links/app_link.dart';

class FavoriteDeleteRemote {
  Curd curd;

  FavoriteDeleteRemote(this.curd);

  postData({
    required String itemId,
    required String userId,
  }) async {
    var result = await curd.post(AppLink.favoriteDeleteLink, {
      "user_id": userId,
      "item_id": itemId,
    });
    return result.fold((l) => l, (r) => r);
  }
}
