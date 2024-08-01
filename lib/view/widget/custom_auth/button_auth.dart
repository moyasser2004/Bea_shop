import 'package:bea_shop/core/style/text_style.dart';
import 'package:flutter/material.dart';
import '../../../core/class/app_text_scall.dart';

class ButtonAuth extends StatelessWidget {
  final double bottom;
  final String text;
  final Color color;
  final Function()? onTap;

  const ButtonAuth(
      {super.key,
      required this.bottom,
      required this.text,
      required this.onTap,
      this.color = Colors.blueAccent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
      margin: EdgeInsets.only(
        bottom: bottom,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(
                vertical: 12, horizontal: 20)),
        onPressed: onTap,
        child: Container(
          alignment: Alignment.center,
          child: Text(text,
              style: AppTextStyleData.buttonTextOnBoarding(context)
                  .copyWith(
                      fontSize:
                          AppTextScales.textScaleFactor(context) *
                              15)),
        ),
      ),
    );
  }
}
