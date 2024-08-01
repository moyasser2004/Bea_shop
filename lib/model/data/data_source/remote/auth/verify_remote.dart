import '../../../../../core/utrlis/api/curd.dart';
import '../../../../../core/utrlis/links/app_link.dart';

class VerifyRemote {
  Curd curd;
  VerifyRemote(this.curd);

  postData({
    required String email,
    required String verifyCode,
  }) async {
    var response = await curd.post(AppLink.verifyLink, {
      "user_email": email,
      "user_verifycode": verifyCode,
    });

    return response.fold((l) => l, (r) => r);
  }
}
