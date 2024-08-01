import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class ThemesData {
  static ThemeData theme = ThemeData(
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.black,
              systemNavigationBarDividerColor: Colors.black)));
}
