import 'package:bea_shop/core/const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/app_text_scall.dart';
import '../../../core/style/text_style.dart';

class TextTopPadding extends StatelessWidget {
  final double top;
  final double bottom;
  final String text;

  const TextTopPadding(
      {super.key,
      required this.top,
      required this.bottom,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        bottom: bottom,
      ),
      child: Text(
        text,
        style: AppTextStyleData.googleRoboto(
            fontSize: 35, color: AppColor.white, context: context),
      ),
    );
  }
}
