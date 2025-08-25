import 'package:flutter/material.dart';
import 'package:flutter_news_mvvm/core/theme/app_gradient.dart';
import 'package:flutter_news_mvvm/core/theme/app_radius.dart';
import 'package:flutter_svg/svg.dart';

class ActionButton extends StatelessWidget {
  String icon;

  ActionButton(this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          gradient: AppGradient.buttonGradient,
          borderRadius: BorderRadius.circular(AppRadius.nRadius)),
      child: SvgPicture.asset('assets/icons/ic-$icon.svg'),
    );
  }
}
