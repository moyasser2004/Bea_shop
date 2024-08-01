import '../../../../../../core/utrlis/api/curd.dart';
import '../../../../../../core/utrlis/links/app_link.dart';

class ResetPasswordRemote {
  Curd curd;
  ResetPasswordRemote(this.curd);

  postData({required String email, required String password}) async {
    final response = await curd.post(AppLink.resetPasswordLink, {
      "user_email": email,
      "user_password": password,
    });

    return response.fold((l) => l, (r) => r);
  }
}
