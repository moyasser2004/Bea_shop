import 'package:flutter/material.dart';
import '../const/app_color.dart';

Gradient gradient() => LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColor.primaryLight.withOpacity(0.2),
        AppColor.primaryLight.withOpacity(0.35),
        AppColor.primaryLight.withOpacity(0.5),
        AppColor.primaryLight.withOpacity(0.65),
        AppColor.primaryLight.withOpacity(0.8),
        AppColor.primaryLight.withOpacity(0.65),
        AppColor.primaryLight.withOpacity(0.85),
        AppColor.primaryLight.withOpacity(0.9),
        AppColor.primaryLight.withOpacity(0.91),
        AppColor.primary.withOpacity(0.85),
        AppColor.primary.withOpacity(0.95),
      ],
    );
