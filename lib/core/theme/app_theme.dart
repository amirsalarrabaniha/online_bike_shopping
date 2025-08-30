import 'package:flutter/material.dart';
import 'package:online_bike_shopping/core/constants/app_constants.dart';
import 'package:online_bike_shopping/core/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: AppConstants.mainFont,
      appBarTheme: AppBarThemeData(
          backgroundColor: AppColors.background,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )));
}
