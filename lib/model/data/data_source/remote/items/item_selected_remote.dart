import '../../../../../core/utrlis/api/curd.dart';
import '../../../../../core/utrlis/links/app_link.dart';

class ItemSelectRemote {
  Curd curd;

  ItemSelectRemote(this.curd);

  postData(String itemId) async {
    final response = await curd
        .post(AppLink.selectItemLink, {"items_category": itemId});
    return response.fold((l) => l, (r) => r);
  }
}
