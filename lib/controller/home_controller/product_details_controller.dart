import 'package:bea_shop/core/utrlis/api/curd.dart';
import 'package:bea_shop/core/utrlis/api/request_state.dart';
import 'package:bea_shop/core/function/handling_response.dart';
import 'package:bea_shop/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../core/class/tset.dart';
import '../../model/data/data_source/remote/favorite/delet_favorite_remote.dart';
import '../../model/data/data_source/remote/favorite/favorite.dart';
import '../../model/data/data_source/remote/items/saerch_remote.dart';
import 'favorite_controller.dart';

class ProductDetailController extends GetxController {
  late int count;
  late int id;
  late String date;
  late int price;
  late int discount;
  late String nameAr;
  late String nameEn;
  late String image;
  late String desAr;
  late String desEn;
  bool isLike = false;
  late String userId;
  late double rate;
  late String tag;
  late bool like;
  late List images;

  int counter = 1;
  late String colors;

  late ScrollController scrollController;
  bool isMax = false;
  int position = 0;

  FavoriteRemote favoriteRemote = FavoriteRemote(Curd());
  FavoriteDeleteRemote favoriteDeleteRemote =
      FavoriteDeleteRemote(Curd());
  RequestState? state;

  SearchRemote searchRemote = SearchRemote(Curd());
  RequestState? state2;
  List searchList = [];

  changeLike() async {
    isLike = !isLike;
    like = !like;
    FavoriteController controller = Get.put(FavoriteController());
    controller.getFromFavorite();
    addToFavorite(itemId: id.toString());
    update();
  }

//favorite
  addToFavorite({
    required String itemId,
  }) async {
    state = RequestState.loading;
    final request = await favoriteRemote.postData(
      itemId: itemId,
      userId: userId,
    );
    state = handleResponse(request);
    if (state == RequestState.loaded) {
      if (request["status"] == "success") {
        Fluttertoast.showToast(
          msg: 'Add To My Favorite',
        );
        FavoriteController controller = Get.put(FavoriteController());
        controller.getFromFavorite();
      } else {
        deleteFromFavorite(itemId: id.toString());
        Fluttertoast.showToast(
          msg: 'Delete From My Favorite',
        );
      }
    }
  }

  deleteFromFavorite({
    required String itemId,
  }) async {
    state = RequestState.loading;
    final request = await favoriteDeleteRemote.postData(
      itemId: itemId,
      userId: userId,
    );
    state = handleResponse(request);
    if (state == RequestState.loaded) {
      if (request["status"] == "success") {
        FavoriteController controller = Get.put(FavoriteController());
        controller.getFromFavorite();
      } else {}
    }
  }

  //cart
  bool addItem(Map<String, dynamic> newItem) {
    CartList.count.add(counter.toDouble());
    String newItemId = newItem["items_id"];
    int existingIndex = CartList.test
        .indexWhere((item) => item["items_id"] == newItemId);
    if (existingIndex != -1) {
      CartList.test[existingIndex] = newItem;
      return true;
    } else {
      CartList.test.add(newItem);
      return false;
    }
  }

  add() {
    if (counter < 20) {
      counter++;
    }
    update();
  }

  minus() {
    if (counter > 1) {
      counter--;
    }
    update();
  }

  back() async {
    await Fluttertoast.showToast(
      msg: '  Add to cart  ',
    );
    Get.back();
  }

  //search
  getItems([String itemName = ""]) async {
    state2 = RequestState.loading;
    update();
    final result = await searchRemote.postData10Items(
        search: itemName.isEmpty
            ? nameEn.split(" ").first.toString()
            : itemName,
        position: position.toString());
    state2 = handleResponse(result);
    if (state2 == RequestState.loaded) {
      isMax = false;
      if (result["status"] == "success") {
        searchList.addAll(result["data"]);
        searchList.removeWhere((element) =>
            element["items_id"].toString() == id.toString());
        position += 5;
        isMax = false;
      } else {
        state2 = RequestState.notData;
        Fluttertoast.showToast(
          msg: 'Ops ! No More Items'.tr,
        );
      }
    }
    update();
  }

  //pixel
  getPixel() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        isMax = true;
        getItems();
      }
    });
  }

  toProductDetails({
    required int count,
    required String date,
    required int price,
    required int discount,
    required String nameAr,
    required String nameEn,
    required String image,
    required String desAr,
    required String desEn,
    required int id,
    required double rate,
    required bool like,
    required bool isLike,
    required String colors,
    required List images,
    required String tag,
  }) async {
    this.count = count;
    this.date = date;
    this.price = price;
    this.discount = discount;
    this.nameAr = nameAr;
    this.nameEn = nameEn;
    this.image = image;
    this.desAr = desAr;
    this.desEn = desEn;
    this.id = id;
    this.rate = double.parse(rate.toString());
    this.like = false;
    this.isLike = false;
    this.colors = colors;
    this.colors = colors;
    this.images = images;
    this.tag = tag;
    position = 0;
    searchList.clear();
    getItems(nameEn);
    update();
  }

  Future<void> get() async {
    scrollController = ScrollController();
    count = Get.arguments["items_count"];
    date = Get.arguments["items_date"];
    price = Get.arguments["items_price"];
    discount = Get.arguments["items_discount"];
    nameAr = Get.arguments["items_name_ar"];
    nameEn = Get.arguments["items_name"];
    image = Get.arguments["items_image"];
    desAr = Get.arguments["items_des_ar"];
    desEn = Get.arguments["items_des"];
    id = Get.arguments["items_id"];
    like = Get.arguments["items_like"] ?? false;
    tag = Get.arguments["items_tag"] ?? Get.arguments["items_id"];
    rate = double.parse(Get.arguments["items_rate"].toString());
    userId = MyServices.sharedPreferences.getString("id")!;
    colors = Get.arguments["items_colors"] ?? "";
    images = Get.arguments["items_images"] ?? [];
    getPixel();
    await getItems();
  }

  @override
  void onInit() async {
    await get();
    super.onInit();
  }
}
