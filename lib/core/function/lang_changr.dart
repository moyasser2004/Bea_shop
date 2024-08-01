import 'package:bea_shop/core/services/services.dart';

langChang(ar, en) {
  if (MyServices.sharedPreferences.getString("language") == "en") {
    return en;
  } else {
    return ar;
  }
}
