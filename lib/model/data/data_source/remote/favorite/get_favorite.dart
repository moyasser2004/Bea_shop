import '../../../../../core/utrlis/api/curd.dart';
import '../../../../../core/utrlis/links/app_link.dart';

class FavoriteGetRemote {
  Curd curd;

  FavoriteGetRemote(this.curd);

  postData({
    required String userId,
  }) async {
    var result = await curd.post(AppLink.favoriteGetLink, {
      "user_id": userId,
    });
    return result.fold((l) => l, (r) => r);
  }
}
