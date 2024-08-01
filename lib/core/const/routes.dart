import 'package:bea_shop/core/const/app_routes.dart';
import 'package:bea_shop/view/screen/auth/sigin_suceess/checK_code_screen.dart';
import 'package:bea_shop/view/screen/auth/forget_Password/check_code_forget_password_screen.dart';
import 'package:bea_shop/view/screen/auth/forget_Password/forget_password_screen.dart';
import 'package:bea_shop/view/screen/auth/login_screen.dart';
import 'package:bea_shop/view/screen/auth/forget_Password/reset_password_screen.dart';
import 'package:bea_shop/view/screen/auth/signIn_screen.dart';
import 'package:bea_shop/view/screen/home/add_address_screen.dart';
import 'package:bea_shop/view/screen/home/cart_sceen.dart';
import 'package:bea_shop/view/screen/home/categories_screen.dart';
import 'package:bea_shop/view/screen/home/favorite_screen.dart';
import 'package:bea_shop/view/screen/home/item_screen.dart';
import 'package:bea_shop/view/screen/home/main_screen.dart';
import 'package:bea_shop/view/screen/home/my_oredr_screen.dart';
import 'package:bea_shop/view/screen/home/product_details_screen.dart';
import 'package:bea_shop/view/screen/home/profile_screen.dart';
import 'package:bea_shop/view/screen/on_boarding/change_language_screen.dart';
import 'package:bea_shop/view/screen/on_boarding/on_boarding_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: AppRoutes.loginScreen, page: () => LogInScreen()),
  GetPage(name: AppRoutes.signInScreen, page: () => SignInScreen()),
  GetPage(name: AppRoutes.changeLang, page: () => const ChangeLang()),
  GetPage(
      name: AppRoutes.onBoarding,
      page: () => const OnBoardingScreen()),
  GetPage(
      name: AppRoutes.forgetPassword, page: () => ForgetPassword()),
  GetPage(name: AppRoutes.checkCode, page: () => CheckCode()),
  GetPage(name: AppRoutes.home, page: () => const MainScreen()),
  GetPage(
      name: AppRoutes.checkCodeForgetPassword,
      page: () => CheckCodeForgetPassword()),
  GetPage(name: AppRoutes.resetPassword, page: () => ResetPassword()),
  GetPage(
      name: AppRoutes.categoriesScreen,
      page: () => const CategoriesScreen()),
  GetPage(name: AppRoutes.itemScreen, page: () => const ItemScreen()),
  GetPage(
      name: AppRoutes.productDetailsScreen,
      page: () => const ProductDetailsScreen()),
  GetPage(
      name: AppRoutes.favoriteScreen,
      page: () => const FavoriteScreen()),
  GetPage(
      name: AppRoutes.profileScreen,
      page: () => const ProfileScreen()),
  GetPage(name: AppRoutes.cartScreen, page: () => const CartScreen()),
  GetPage(
      name: AppRoutes.addAddressScreen,
      page: () => const AddAddressScreen()),
  GetPage(
      name: AppRoutes.myOrderScreen,
      page: () => const MyOrderScreen()),
];
