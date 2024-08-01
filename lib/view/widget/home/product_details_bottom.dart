import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller/product_details_controller.dart';
import '../../../core/const/app_color.dart';
import '../../../core/function/color_convert.dart';
import '../../../core/function/lang_changr.dart';
import '../../../core/style/text_style.dart';

class ProductDetailsBottom extends StatelessWidget {
  final double height;
  final double width;

  const ProductDetailsBottom({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                langChang(controller.nameAr, controller.nameEn),
                style: AppTextStyleData.googleAraPey(
                  color: AppColor.grey800,
                  fontSize: 18,
                ),
                textAlign: TextAlign.start,
              ),
              const Spacer(),
              Row(
                children: [
                  const Text(
                    "EGP",
                    style: TextStyle(color: AppColor.red),
                  ),
                  controller.discount != 0
                      ? Text(
                          " ${((controller.price * ((100 - controller.discount) / 100)).round())}",
                          style: const TextStyle(fontSize: 14),
                        )
                      : Text(
                          controller.price.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                  if (controller.discount != 0)
                    Row(
                      children: [
                        Text(
                          "   Was ",
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          controller.price.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColor.grey400,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Rate ",
                style: AppTextStyleData.googleAraPey(
                  color: Colors.orange,
                  fontSize: 16,
                ),
              ),
              for (int i = 0;
                  i <
                      (controller.rate <= 0.20
                          ? 1
                          : controller.rate <= 0.40
                              ? 2
                              : controller.rate <= 0.60
                                  ? 3
                                  : controller.rate <= 0.80
                                      ? 4
                                      : 5);
                  i++)
                const Icon(Icons.star,
                    color: Colors.orange, size: 23),
              const Spacer(),
              Container(
                height: height / 20,
                width: width / 3.5,
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: AppColor.grey600!, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    IconButton(
                      splashRadius: 15,
                      splashColor: AppColor.grey600,
                      onPressed: () {
                        controller.add();
                      },
                      icon: const Icon(Icons.add, size: 18),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        controller.counter.toString(),
                        style:
                            const TextStyle(fontSize: 12, height: 1),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      splashRadius: 15,
                      splashColor: AppColor.grey600,
                      onPressed: () {
                        controller.minus();
                      },
                      icon: const Icon(Icons.remove, size: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            "Details",
            style: AppTextStyleData.googleAraPey(
              color: AppColor.grey800,
              fontSize: 18,
            ),
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: height / 10,
            child: Text(
              langChang(controller.desAr, controller.desEn),
              style: TextStyle(
                color: AppColor.grey600,
                fontSize: 14,
                height: 1,
              ),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          ),
          const SizedBox(height: 10),
          if (controller.colors.isNotEmpty)
            Row(
              children: [
                Text(
                  "Colors:  ",
                  style: AppTextStyleData.googleAraPey(
                    color: AppColor.grey800,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
                const Spacer(flex: 1),
                for (Color color
                    in convertStringToColors(controller.colors))
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 7),
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColor.black, width: 1),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      color: color,
                    ),
                  ),
                const Spacer(flex: 2),
              ],
            ),
          const SizedBox(height: 20),
          const SizedBox(height: 35),
          Row(
            children: [
              Text(
                "Date:",
                style: AppTextStyleData.googleAraPey(
                  color: AppColor.grey800,
                  fontSize: 18,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(width: 10),
              Text(
                "${DateTime.parse(controller.date).year}-${DateTime.parse(controller.date).month.toString().padLeft(2, '0')}-${DateTime.parse(controller.date).day.toString().padLeft(2, '0')}",
                style: AppTextStyleData.googleAraPey(
                  color: AppColor.grey600,
                  fontSize: 12,
                ),
              ),
              const Spacer(),
              Text(
                "Count:",
                style: AppTextStyleData.googleAraPey(
                  color: AppColor.grey800,
                  fontSize: 18,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(width: 10),
              Text(
                controller.count.toString(),
                style: AppTextStyleData.googleAraPey(
                  color: AppColor.grey600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
