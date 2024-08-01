import 'package:bea_shop/core/function/lang_changr.dart';
import 'package:flutter/material.dart';
import '../../../core/const/app_color.dart';
import '../../../core/style/text_style.dart';
import 'image_border.dart';

class TopCartHomeScreen extends StatelessWidget {
  final double height;
  final void Function() onPress;
  final List itemTop;

  const TopCartHomeScreen(
      {super.key,
      required this.height,
      required this.onPress,
      required this.itemTop});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Row(
        children: [
          Expanded(
            child: Hero(
              tag: itemTop[0]["items_image"],
              child: ImageBorder(
                color: AppColor.grey200!,
                height: height / 10,
                image: itemTop[0]["items_image"] ?? "",
                borderColor: AppColor.black54,
                padding: 15,
                margin: 20,
                width: double.infinity,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                langChang(
                  Text(
                    itemTop[0]["items_name_ar"].toString(),
                    style: AppTextStyleData.googleRobot(),
                  ),
                  Text(itemTop[0]["items_name"].toString(),
                      style: AppTextStyleData.googleRobot()),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "EGP",
                          style: TextStyle(color: AppColor.red),
                        ),
                        itemTop[0]["items_discount"] != 0
                            ? Text(
                                " ${itemTop[0]["items_price"] * ((100 - itemTop[0]["items_discount"]) / 100)}",
                                style: const TextStyle(fontSize: 13))
                            : Text(
                                itemTop[0]["items_price"].toString(),
                                style: const TextStyle(fontSize: 15))
                      ],
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    itemTop[0]["items_discount"] != 0
                        ? Row(
                            children: [
                              const Text(
                                "   Was ",
                                style: TextStyle(
                                  color: AppColor.grey,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                  itemTop[0]["items_price"]
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: AppColor.grey400,
                                      decoration: TextDecoration
                                          .lineThrough)),
                            ],
                          )
                        : Container(),
                    const Spacer(
                      flex: 3,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
