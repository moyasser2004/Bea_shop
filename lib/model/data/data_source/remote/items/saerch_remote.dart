import '../../../../../core/utrlis/api/curd.dart';
import '../../../../../core/utrlis/links/app_link.dart';

class SearchRemote {
  Curd curd;
  SearchRemote(this.curd);

  postData({required String search}) async {
    final response =
        await curd.post(AppLink.searchLink, {"search": search});

    return response.fold((l) => l, (r) => r);
  }

  postData10Items({
    required String search,
    required String position,
  }) async {
    final response = await curd.post(
        AppLink.get10Items, {"search": search, "position": position});

    return response.fold((l) => l, (r) => r);
  }
}
