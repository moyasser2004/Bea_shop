import 'package:flutter/material.dart';

import '../../../core/const/app_color.dart';
import '../../../core/function/lang_changr.dart';
import '../../../core/style/text_style.dart';
import 'image_border.dart';

class HomeScreenItemsListCart extends StatelessWidget {
  const HomeScreenItemsListCart(
      {super.key,
      required this.data,
      required this.index,
      required this.height,
      required this.width,
      required this.countList});
  final List data;
  final int index;
  final double height;
  final double width;
  final int countList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Center(
                      child: Hero(
                          tag:
                              "${data[index]["items_id"]} $countList",
                          child: ImageBorder(
                            color: AppColor.grey200!,
                            height: height / 10,
                            image: data[index]["items_image"]
                                .toString()
                                .split(",")
                                .first,
                            borderColor: AppColor.black54,
                            padding: 7,
                            margin: 10,
                            width: width,
                          ))),
                  data[index]["items_discount"] != 0
                      ? Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.orange.withOpacity(.9),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 9),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10),
                            child: Text(
                              "${data[index]["items_discount"].toString()} %",
                              style: const TextStyle(fontSize: 10),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              )),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    langChang(data[index]["items_name_ar"],
                        data[index]["items_name"]),
                    style: AppTextStyleData.googleAmIri(
                        color: AppColor.black54, fontSize: 14),
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.grey200),
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "count: ${data[index]["items_count"].toString()}",
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        " \$",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColor.red2),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        " ${((data[index]["items_price"] * ((100 - data[index]["items_discount"]) / 100)).round())}",
                        style: const TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
