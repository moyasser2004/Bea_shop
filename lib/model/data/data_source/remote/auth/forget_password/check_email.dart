import '../../../../../../core/utrlis/api/curd.dart';
import '../../../../../../core/utrlis/links/app_link.dart';

class CheckEmailRemote {
  Curd curd;
  CheckEmailRemote(this.curd);

  postData({required String email}) async {
    final response = await curd
        .post(AppLink.checkEmailLink, {"user_email": email});

    return response.fold((l) => l, (r) => r);
  }
}
