import 'package:flutter/material.dart';
import 'package:flutter_news_mvvm/core/constants/app_constants.dart';
import 'package:flutter_news_mvvm/core/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: AppConstants.mainFont,
  );
}
