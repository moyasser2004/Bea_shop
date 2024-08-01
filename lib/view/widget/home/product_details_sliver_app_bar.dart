import 'package:bea_shop/controller/home_controller/product_details_controller.dart';
import 'package:bea_shop/view/widget/home/product_details_change_like.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const/app_color.dart';
import 'icon.dart';
import 'image_border.dart';

class ProductDetailsSliverAppBar extends StatelessWidget {
  const ProductDetailsSliverAppBar(
      {super.key,
      required this.height,
      required this.width,
      required this.images,
      required this.tag,
      required this.image});

  final double height;
  final double width;
  final List images;
  final String tag;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      leading: const SizedBox.shrink(),
      expandedHeight: 350,
      scrolledUnderElevation: 20,
      backgroundColor: AppColor.primary,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1.3,
        collapseMode: CollapseMode.parallax,
        background: Container(
          padding: const EdgeInsets.only(top: 30, right: 3, left: 3),
          color: Colors.white,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.isEmpty ? 1 : images.length,
            itemBuilder: (BuildContext context, int index) => Stack(
              children: [
                GetBuilder<ProductDetailController>(
                    builder: (controller) => Hero(
                        tag: tag,
                        child: ImageBorder(
                          color: AppColor.grey200!,
                          height: height / 10,
                          image: controller.images[index],
                          borderColor: AppColor.black54,
                          padding: 20,
                          margin: 15,
                          width: width / 1.1,
                        ))),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconWidget(
                    onPress: () {
                      Get.back();
                    },
                    icon: Icons.arrow_back_outlined,
                    top: 15,
                    left: 10,
                    right: 10,
                    bottom: 0,
                  ),
                ),
                const Align(
                    alignment: Alignment.topRight,
                    child: ProductDetailsChangeLike()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
