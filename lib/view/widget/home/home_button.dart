import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/const/style/text_style.dart';
import '../../../core/style/text_style.dart';

class HomeButton extends StatelessWidget {
  final void Function() onPress;
  final String text;
  final Color buttonColor;
  final Color textColor;
  final double vertical;
  final double horizontal;
  final double fontSize;

  const HomeButton({
    super.key,
    required this.onPress,
    required this.text,
    required this.buttonColor,
    required this.textColor,
    this.vertical = 0,
    this.horizontal = 20,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          backgroundColor: buttonColor,
          padding: EdgeInsets.symmetric(
              horizontal: horizontal, vertical: vertical)),
      child: Text(text.tr,
          style: AppTextStyleData.googleAmIri(
            color: textColor,
            fontSize: fontSize,
          )),
    );
  }
}
