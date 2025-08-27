import 'package:flutter/material.dart';
import 'package:flutter_news_mvvm/core/constants/app_constants.dart';
import 'package:flutter_news_mvvm/core/theme/app_colors.dart';
import 'package:flutter_news_mvvm/core/theme/app_gradient.dart';
import 'package:flutter_news_mvvm/core/theme/app_radius.dart';
import 'package:flutter_news_mvvm/core/utils/localization_extension.dart';
import 'package:flutter_news_mvvm/core/widgets/action_button.dart';
import 'package:flutter_news_mvvm/core/widgets/slope_radius_widget.dart';
import 'package:flutter_news_mvvm/features/news/presentation/pages/detail_page.dart';
import 'package:flutter_news_mvvm/features/news/widgets/bottom_navigation.dart';
import 'package:flutter_news_mvvm/features/news/widgets/category_card.dart';
import 'package:flutter_news_mvvm/features/news/widgets/product_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
                bottomSlope: 8,
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
                      Center(child: Image.asset('assets/images/image0.png')),
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
                offset: Offset(0, -30),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (int i = 0; i < AppConstants.categories.length; i++)
                        CategoryCard(AppConstants.categories[i], i)
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, -80),
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 20,
                      crossAxisCount: 2,
                      childAspectRatio: 0.7),
                  itemCount: 4,
                  itemBuilder: (context, index) => Transform.translate(
                    offset: Offset(0, index % 2 != 0 ? -40 : 0),
                    child: ProductCard(),
                  ),
                ),
              ),
              SizedBox(height: 60)
            ],
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: CustomBottomNav(onTabSelected: (i) {}),
    );
  }
}
