import 'package:flutter/material.dart';
import 'package:flutter_news_mvvm/core/theme/app_colors.dart';
import 'package:flutter_news_mvvm/core/theme/app_gradient.dart';
import 'package:flutter_news_mvvm/core/theme/app_radius.dart';
import 'package:flutter_news_mvvm/core/utils/localization_extension.dart';
import 'package:flutter_news_mvvm/core/widgets/action_button.dart';
import 'package:flutter_news_mvvm/core/widgets/border_gradient_widget.dart';
import 'package:flutter_news_mvvm/core/widgets/slope_radius_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NewsListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.chooseYourBike),
        centerTitle: false,
        actions: [
          ActionButton('search'),
          SizedBox(width: 20),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.scaleDown,
                image: AssetImage(
                  'assets/images/main_bg.png',
                ))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              SlopeRadiusWidget(
                padding: EdgeInsets.symmetric(horizontal: 20),
                borderDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.nRadius),
                  gradient: AppGradient.borderGradient,
                ),
                borderWidth: 2,
                bottomSlope: 10,
                radius: 20,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: AppGradient.cardGradient,
                    borderRadius: BorderRadius.circular(AppRadius.nRadius),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Image.asset(
                              'assets/images/electric_bicycle.png')),
                      SizedBox(height: 10),
                      Text(
                        '30% Off',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, -40),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _getCategoryCard(0, 'subtract'),
                      _getCategoryCard(40, 'road'),
                      _getCategoryCard(80, 'union'),
                      _getCategoryCard(120, 'union-1'),
                      _getCategoryCard(160, 'union'),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, -110),
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 20,
                      crossAxisCount: 2,
                      childAspectRatio: 0.8),
                  itemCount: 4,
                  itemBuilder: (context, index) => Transform.translate(
                    offset: Offset(0, index % 2 != 0 ? -40 : 0),
                    child: SlopeRadiusWidget(
                      borderDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadius.nRadius),
                        gradient: AppGradient.borderGradient,
                      ),
                      borderWidth: 2,
                      bottomSlope: 8,
                      topSlope: 8,
                      radius: 20,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: AppGradient.cardGradient,
                          borderRadius:
                              BorderRadius.circular(AppRadius.nRadius),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/images/unsplash_removebg_preview.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Road Helmet',
                              style: TextStyle(
                                color: AppColors.secondaryTextColor,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'PEUGEOT - LR01',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '\$ 1,999.99',
                              style: TextStyle(
                                color: AppColors.secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCategoryCard(double bottom, icon) => Padding(
        padding: EdgeInsets.only(bottom: bottom),
        child: BorderGradientWidget(
          padding: EdgeInsets.all(1),
          width: 60,
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/icons/ic-$icon.svg',
              width: 50,
            ),
          ),
        ),
      );
}
