import '../../../../../core/utrlis/api/curd.dart';
import '../../../../../core/utrlis/links/app_link.dart';

class CategoriesRemote {
  Curd curd;

  CategoriesRemote(this.curd);

  postData() async {
    final result = await curd.post(AppLink.viewLink, {});
    return result.fold((l) => l, (r) => r);
  }

  postItemTop() async {
    var response = await curd.get(AppLink.itemTopLink);
    return response.fold((l) => l, (r) => r);
  }

  postCategories() async {
    final response = await curd.get(AppLink.categoryLink);
    return response.fold((l) => l, (r) => r);
  }
}
