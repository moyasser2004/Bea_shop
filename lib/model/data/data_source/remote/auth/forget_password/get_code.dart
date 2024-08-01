import '../../../../../../core/utrlis/api/curd.dart';
import '../../../../../../core/utrlis/links/app_link.dart';

class GetCodeRemote {
  Curd curd;
  GetCodeRemote(this.curd);

  postData({required String email}) async {
    final response =
        await curd.post(AppLink.getCodeLink, {"user_email": email});

    return response.fold((l) => l, (r) => r);
  }
}
