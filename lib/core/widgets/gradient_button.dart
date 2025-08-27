import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_news_mvvm/core/theme/app_gradient.dart';
import 'package:flutter_news_mvvm/core/theme/app_radius.dart';
import 'package:flutter_svg/svg.dart';

class GradientButton extends StatelessWidget {
  String text;
  final GestureTapCallback? onTap;

  GradientButton(this.text, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 44,
        height: 44,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: AppGradient.buttonGradient,
            borderRadius: BorderRadius.circular(AppRadius.nRadius)),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
