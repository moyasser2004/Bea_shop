import 'dart:math';

import 'package:flutter/material.dart';

class AppTextScales {
  static double textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = MediaQuery.of(context).size.width;
    const double referenceWidth = 1200;
    double val = (width / referenceWidth) * maxTextScaleFactor;

    // Adjust text scale factor based on device type
    if (isMobile(context)) {
      // For mobile devices
      return max(1, min(val, maxTextScaleFactor));
    } else if (isTablet(context)) {
      // For tablets
      return max(1.2, min(val, maxTextScaleFactor));
    } else {
      // For desktop
      return max(1.7, min(val, maxTextScaleFactor));
    }
  }

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide < 600;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide >= 600 &&
        MediaQuery.of(context).size.shortestSide < 900;
  }
}
