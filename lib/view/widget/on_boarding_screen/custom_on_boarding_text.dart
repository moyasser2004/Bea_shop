import 'package:flutter/material.dart';

import '../../../core/const/app_color.dart';
import '../../../core/style/text_style.dart';

class CustomOnBoardingText extends StatelessWidget {
  const CustomOnBoardingText(
      {super.key,
      required this.text1,
      required this.text2,
      required this.text3});
  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: AppTextStyleData.googleRoboto(context: context)
              .copyWith(color: AppColor.primaryLight2),
          textAlign: TextAlign.center,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text2,
              style: AppTextStyleData.googleRoboto(context: context)
                  .copyWith(color: AppColor.primaryLight2),
              textAlign: TextAlign.center,
            ),
            const SizedBox(width: 5),
            Text(
              text3,
              style: AppTextStyleData.googleRoboto(context: context)
                  .copyWith(
                      fontWeight: FontWeight.w600, fontSize: 21),
              textAlign: TextAlign.center,
            ),
          ],
        )
      ],
    );
  }
}
