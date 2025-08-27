import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_news_mvvm/core/theme/app_gradient.dart';
import 'package:flutter_news_mvvm/core/theme/app_radius.dart';
import 'package:flutter_news_mvvm/core/widgets/action_button.dart';
import 'package:flutter_news_mvvm/core/widgets/slope_radius_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/app_colors.dart' show AppColors;

class CustomBottomNav extends StatefulWidget {
  final Function(int) onTabSelected;
  final int selectedIndex;

  CustomBottomNav({required this.onTabSelected, this.selectedIndex = 4});

  @override
  _CustomBottomNavState createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
    widget.onTabSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: double.infinity,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SlopeRadiusWidget(
              borderDecoration: BoxDecoration(
                gradient: AppGradient.borderGradient.withOpacity(0.4),
              ),
              borderWidth: 2,
              bottomSlope: 0,
              radius: 0,
              topSlope: 2,
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.card, AppColors.background],
                    transform: GradientRotation(1),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _buildNavItem('bn-bicycle', 0),
                  _buildNavItem('map.fill', 1),
                  _buildNavItem('cart.fill', 2),
                  _buildNavItem('person.fill', 3),
                  _buildNavItem('doc.text.fill', 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String icon, int index) {
    bool isSelected = _currentIndex == index;
    return Expanded(
      child: isSelected
          ? Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor.withOpacity(0.6),
                  spreadRadius: 10,
                  offset: Offset(0, 20),
                  blurRadius: 30,
                ),
              ]),
              margin: const EdgeInsets.only(bottom: 40),
              child: SlopeRadiusWidget(
                borderDecoration: BoxDecoration(
                  gradient: AppGradient.buttonGradient,
                ),
                borderWidth: 2,
                radius: 14,
                bottomSlope: 7,
                topSlope: 7,
                child: Container(
                  width: 60,
                  height: 60,
                  padding: EdgeInsets.all(17),
                  child: SvgPicture.asset(
                    'assets/icons/ic-$icon.svg',
                    width: 25,
                    height: 25,
                    fit: BoxFit.contain,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Bounceable(
                onTap: () => _onTap(index),
                child: SvgPicture.asset(
                  'assets/icons/ic-$icon.svg',
                  width: 25,
                  height: 25,
                  fit: BoxFit.contain,
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ),
    );
  }
}
