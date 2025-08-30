import 'package:flutter/material.dart';
import 'package:online_bike_shopping/core/theme/app_colors.dart';
import 'package:online_bike_shopping/core/theme/app_radius.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class OutShadowButton extends StatelessWidget {
  String text;

  OutShadowButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 43,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              AppRadius.nRadius),
          color: AppColors.card,
          boxShadow: [
            BoxShadow(
              color: Color(0xff38445A),
              offset: Offset(-4, -4),
              blurRadius: 10,
            ),
          ]),
      child: GradientText(
        text,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        colors: [
          AppColors.colorTextGradiantFrom,
          AppColors.colorTextGradiantTo,
        ],
      ),
    );
  }
}
