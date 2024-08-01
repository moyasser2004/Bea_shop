import 'package:bea_shop/core/const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../class/app_text_scall.dart';

abstract class AppTextStyleData {
  static TextStyle? theme(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium;
  }

  static TextStyle titleMedium(BuildContext context,
      [double fontSize = 20, Color color = Colors.black]) {
    return theme(context)!.copyWith(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle bodyMedium(BuildContext context,
      [double fontSize = 17]) {
    return theme(context)!.copyWith(
      fontSize: fontSize,
      height: 1.5,
      fontWeight: FontWeight.w700,
      color: Colors.black54,
    );
  }

  static TextStyle bodyMedium2(BuildContext context,
      [double fontSize = 15]) {
    return TextStyle(
      fontSize: fontSize,
      color: Colors.black54,
      height: 2,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle buttonText(BuildContext context) {
    return theme(context)!.copyWith(
      fontSize: 14,
      color: Colors.white,
    );
  }

  static TextStyle buttonTextOnBoarding(BuildContext context) {
    return theme(context)!.copyWith(
      fontSize: AppTextScales.textScaleFactor(context) * 20,
      fontWeight: FontWeight.w700,
      color: AppColor.white,
    );
  }

  static TextStyle googleAraPey({
    double fontSize = 37,
    FontWeight fontWeight = FontWeight.bold,
    Color? color = Colors.blue,
  }) {
    return GoogleFonts.arapey(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: 1,
    );
  }

  static TextStyle googleRobotoSlab({
    Color color = Colors.blue,
    double fontSize = 20,
  }) {
    return GoogleFonts.robotoSlab(
      color: color,
      fontSize: fontSize,
    );
  }

  static TextStyle googleRoboto({
    Color color = AppColor.primaryLight,
    double fontSize = 23,
    required BuildContext context,
  }) {
    return GoogleFonts.roboto(
      color: color,
      height: 1.2,
      letterSpacing: 1.0,
      fontSize: AppTextScales.textScaleFactor(context) * fontSize,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle googleAmIri({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w500,
    Color? color = Colors.blue,
  }) {
    return GoogleFonts.amiri(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle googleSeaweedScript({
    double fontSize = 22,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return GoogleFonts.seaweedScript(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: AppColor.black.withOpacity(.8),
    );
  }

  static TextStyle googleRobot() {
    return GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColor.black);
  }
}
