import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:online_bike_shopping/core/theme/app_colors.dart';
import 'package:online_bike_shopping/core/theme/app_gradient.dart';
import 'package:online_bike_shopping/core/theme/app_radius.dart';
import 'package:flutter_svg/svg.dart';

class ActionButton extends StatelessWidget {
  String icon;
  final GestureTapCallback? onTap;

  ActionButton(this.icon, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: AppGradient.buttonGradient,
            borderRadius: BorderRadius.circular(AppRadius.nRadius)),
        child: SvgPicture.asset('assets/icons/ic-$icon.svg'),
      ),
    );
  }
}
