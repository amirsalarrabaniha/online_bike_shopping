import 'package:flutter/material.dart';
import 'package:flutter_news_mvvm/core/theme/app_gradient.dart';
import 'package:flutter_news_mvvm/core/theme/app_radius.dart';

class BorderGradientWidget extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final double? width;
  final double? height;

  const BorderGradientWidget({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.nRadius),
        gradient: AppGradient.borderGradient,
      ),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: AppGradient.cardGradient,
          borderRadius: BorderRadius.circular(AppRadius.nRadius),
        ),
        child: child,
      ),
    );
  }
}
