import '../../../../../core/utrlis/api/curd.dart';
import '../../../../../core/utrlis/links/app_link.dart';

class RemoveRemote {
  final Curd curd;

  RemoveRemote(this.curd);

  changeLogOut({
    required String name,
    required String email,
  }) async {
    final response = await curd.post(AppLink.removeAccountLink, {
      "user_name": name,
      "user_email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
