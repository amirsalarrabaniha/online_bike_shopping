import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppGradient {
  static const buttonGradient = LinearGradient(
    colors: [
      AppColors.colorMainGradiantFrom,
      AppColors.colorMainGradiantTo,
    ],
    transform: GradientRotation(38),
  );
  static const cardGradient = LinearGradient(
    colors: [
      AppColors.card,
      AppColors.background,
    ],
  );
  static const borderGradient = LinearGradient(
    colors: [
      Color(0x99ffffff),
      Color(0x99000000),
    ],
    transform: GradientRotation(-30),
  );
}
