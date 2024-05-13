import 'package:flutter/material.dart';
import 'my_app_colors.dart';

class MyAppThemes {
  static final lightTheme = ThemeData(
    primaryColor: MyAppColors.lightTeal,
    secondaryHeaderColor: MyAppColors.grey,
    brightness: Brightness.light
  );
  static final darkTheme = ThemeData(
    primaryColor: MyAppColors.darkTeal,
    secondaryHeaderColor: MyAppColors.grey,
    brightness: Brightness.dark
  );
}