abstract class AppLink {
  //http://localhost/shopApp/auth/sigin.php

  static const String baserUrl = "http://192.168.1.5/shopApp/";

  //auth
  static const String sigInLink = "${baserUrl}auth/sigin.php";
  static const String verifyLink = "${baserUrl}auth/verify.php";
  static const String loginLink = "${baserUrl}auth/login.php";
  static const String removeAccountLink =
      "${baserUrl}auth/remove_acount.php";

  //forgetPassword
  static const String checkEmailLink =
      "${baserUrl}auth/checkEmail.php";
  static const String getCodeLink = "${baserUrl}auth/sendCode.php";
  static const String resetPasswordLink =
      "${baserUrl}auth/resetPassword.php";

  //categories
  static const String viewLink = "${baserUrl}categories/view.php";
  static const String categoryLink =
      "${baserUrl}categories/get_category.php";

  static String categoryImage(String image) {
    return "${baserUrl}upload/$image";
  }

  //items
  static const String selectItemLink =
      "${baserUrl}items/selected.php";
  static const String itemTopLink = "${baserUrl}items/item_top.php";
  static const String get10Items =
      "${baserUrl}items/get_10_items.php";

  //favorite
  static const String favoriteInsertLink =
      "${baserUrl}favorite/fav.php";
  static const String favoriteDeleteLink =
      "${baserUrl}favorite/deletefavorite.php";
  static const String favoriteGetLink =
      "${baserUrl}favorite/getfavorite.php";

  //cart
  static const String cartInsertLink =
      "${baserUrl}cart/cartinsert.php";
  static const String cartViewLink = "${baserUrl}cart/cartview.php";
  static const String myOrderLink = "${baserUrl}cart/myorder.php";
  static const String raterLink = "${baserUrl}cart/cartrate.php";
  static const String doubleRaterLink =
      "${baserUrl}cart/updaterate.php";

  //search
  static const String searchLink = "${baserUrl}items/search.php";

  //address
  static const String addressAddLink = "${baserUrl}address/add.php";

  //coupon
  static const String couponAddLink = "${baserUrl}coupon/add.php";
  static const String couponViewLink = "${baserUrl}coupon/view.php";
}
