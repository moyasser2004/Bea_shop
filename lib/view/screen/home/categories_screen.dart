import 'package:bea_shop/controller/home_controller/categories_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/home/category_body.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriseController());
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.sizeOf(context).height <= 700
        ? 800
        : MediaQuery.of(context).size.height;
    return GetBuilder<CategoriseController>(
      builder: (controller) => Column(
        children: [
          Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.only(
                      top: 30, bottom: 100, left: 20, right: 20),
                  physics: const BouncingScrollPhysics(),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: .99,
                  ),
                  itemCount: controller.category.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        controller.toItemScreen(controller
                            .category[index]["categories_id"]);
                      },
                      child: CategoryBody(
                        height: height,
                        width: width,
                        category: controller.category,
                        index: index,
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
