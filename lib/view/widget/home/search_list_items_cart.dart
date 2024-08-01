import 'package:flutter/material.dart';

import '../../../core/const/app_color.dart';
import '../../../core/function/lang_changr.dart';
import '../../../core/style/text_style.dart';
import 'image_border.dart';

class SearchItemsListCart extends StatelessWidget {
  const SearchItemsListCart(
      {super.key,
      required this.width,
      required this.height,
      required this.searchData,
      required this.index});

  final double width;
  final double height;
  final List searchData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.grey200,
      ),
      height: height / 5.3,
      child: Row(
        children: [
          Expanded(
              child: Hero(
            tag: searchData[index]["items_id"].toString(),
            child: ImageBorder(
              color: AppColor.grey200!,
              height: height / 10,
              image: searchData[index]["items_image"],
              borderColor: AppColor.black54,
              padding: 7,
              margin: 10,
              width: width,
            ),
          )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      langChang(searchData[index]["items_name_ar"],
                          searchData[index]["items_name"]),
                      style: AppTextStyleData.googleAraPey(
                          color: AppColor.grey800, fontSize: 16),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Text(
                        langChang(
                          searchData[index]["items_des_ar"],
                          searchData[index]["items_des"],
                        ),
                        style: const TextStyle(
                          color: AppColor.black54,
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "EGP",
                              style: TextStyle(color: AppColor.red),
                            ),
                            searchData[index]["items_discount"] != 0
                                ? Text(
                                    " ${(searchData[index]["items_price"] * ((100 - searchData[index]["items_discount"]) / 100)).round()}",
                                    style:
                                        const TextStyle(fontSize: 12))
                                : Text(
                                    " ${searchData[index]["items_price"]}",
                                    style:
                                        const TextStyle(fontSize: 12))
                          ],
                        ),
                        searchData[index]["items_discount"] != 0
                            ? Row(
                                children: [
                                  Text(
                                    "   Was ",
                                    style: TextStyle(
                                      color: AppColor.grey400,
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                      searchData[index]["items_price"]
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: AppColor.grey400,
                                          decoration: TextDecoration
                                              .lineThrough)),
                                ],
                              )
                            : Container(),
                        const Spacer(),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                            "${DateTime.parse(searchData[index]["items_date"]).year}-${DateTime.parse(searchData[index]["items_date"]).month.toString().padLeft(2, '0')}-${DateTime.parse(searchData[index]["items_date"]).day.toString().padLeft(2, '0')}",
                            style: const TextStyle(fontSize: 11)),
                        const Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.white),
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10),
                          child: Text(
                            "${langChang("العدد", "count")}: ${searchData[index]["items_count"].toString()}",
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
