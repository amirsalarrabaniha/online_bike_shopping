import 'package:flutter/material.dart';
import 'package:flutter_news_mvvm/core/theme/app_colors.dart';
import 'package:flutter_news_mvvm/core/theme/app_radius.dart';
import 'package:flutter_news_mvvm/core/widgets/inner_shadow.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class InnerShadowButton extends StatelessWidget {
  String text;

  InnerShadowButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      blur: 8,
      offset: Offset(-4, -4),
      color: Color(0xff414753),
      child: Container(
        height: 43,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              AppRadius.nRadius),
          color: AppColors.card,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
