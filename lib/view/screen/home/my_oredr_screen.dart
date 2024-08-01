import 'package:bea_shop/core/class/handle_view_data.dart';
import 'package:bea_shop/core/utrlis/api/request_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_controller/my_order_controller.dart';
import '../../widget/home/my_oreder_screen_items_cart.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyOrderController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height <= 600
        ? 700
        : MediaQuery.of(context).size.height;
    return SafeArea(
      child: GetBuilder<MyOrderController>(
          builder: (controller) => RefreshIndicator(
              onRefresh: () async {
                await controller.refGet();
              },
              child: HandelViewData(
                state: controller.state ?? RequestState.loading,
                height: height / 1.1,
                widget: ListView.builder(
                    padding: const EdgeInsets.only(bottom: 70),
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.data.length,
                    itemBuilder: (BuildContext context, int index) =>
                        MyOrderScreenListCart(
                          height: height,
                          width: width,
                          index: index,
                          data: controller.data,
                        )),
              ))),
    );
  }
}
