import '../../../../../core/utrlis/api/curd.dart';
import '../../../../../core/utrlis/links/app_link.dart';

class LoginRemote {
  Curd curd;

  LoginRemote(this.curd);

  logIn({
    required String email,
    required String password,
  }) async {
    final response = await curd.post(AppLink.loginLink, {
      "user_email": email,
      "user_password": password,
    });

    return response.fold((l) => l, (r) => r);
  }
}
