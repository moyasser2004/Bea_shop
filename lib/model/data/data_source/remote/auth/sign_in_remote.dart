import '../../../../../core/utrlis/api/curd.dart';
import '../../../../../core/utrlis/links/app_link.dart';

class SignInRemote {
  Curd curd;
  SignInRemote(this.curd);

  postData({
    required String phone,
    required String name,
    required String password,
    required String email,
  }) async {
    final response = await curd.post(AppLink.sigInLink, {
      "user_phone": phone,
      "user_password": password,
      "user_name": name,
      "user_email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
