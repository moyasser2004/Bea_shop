import 'package:bea_shop/core/class/handle_view_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/Items_controller.dart';
import '../../widget/home/vertical_list_items.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height <= 600
        ? 700
        : MediaQuery.of(context).size.height;
    return GetBuilder<ItemsController>(
        builder: (controller) => HandelViewData(
            state: controller.state!,
            widget: VListItems(
              searchData: controller.items,
              controller: controller,
              width: width,
              height: height / 1.2,
            ),
            height: height / 1.2));
  }
}
