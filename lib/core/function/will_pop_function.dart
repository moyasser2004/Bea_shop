import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> willPop() {
  DateTime currentBackPressTime = DateTime.now();
  if (DateTime.now().difference(currentBackPressTime) >
      const Duration(seconds: 2)) {
    currentBackPressTime = DateTime.now();
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      const SnackBar(
        content: Text('Press back again to exit'),
        duration: Duration(seconds: 2),
      ),
    );
    return Future.value(false);
  }
  return Future.value(true);
}
