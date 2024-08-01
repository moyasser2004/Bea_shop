import '../../../../../core/utrlis/api/curd.dart';
import '../../../../../core/utrlis/links/app_link.dart';

class AddressRemote {
  Curd curd;
  AddressRemote(this.curd);

  addData({
    required String city,
    required String street,
    required String addressGovernoral,
    required String addressPhone,
    required String userId,
  }) async {
    final result = await curd.post(AppLink.addressAddLink, {
      "address_user_id": userId,
      "address_city": city,
      "address_street": street,
      "address_governoral": addressGovernoral,
      "address_phone": addressPhone,
    });
    return result.fold((l) => l, (r) => r);
  }
}
