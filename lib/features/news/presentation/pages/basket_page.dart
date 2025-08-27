import 'package:flutter/material.dart';
import 'package:flutter_news_mvvm/core/theme/app_colors.dart';
import 'package:flutter_news_mvvm/core/theme/app_gradient.dart';
import 'package:flutter_news_mvvm/core/theme/app_radius.dart';
import 'package:flutter_news_mvvm/core/utils/localization_extension.dart';
import 'package:flutter_news_mvvm/core/widgets/gradient_button.dart';
import 'package:flutter_news_mvvm/core/widgets/inner_shadow_button.dart';
import 'package:flutter_news_mvvm/core/widgets/out_shadow_button.dart';
import 'package:flutter_news_mvvm/features/news/widgets/basket_card.dart';
import 'package:flutter_news_mvvm/features/news/widgets/detail_appbar.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            DetailAppbar(context.l10n.myShoppingCart),
            SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => BasketCard(),
              itemCount: 3,
              separatorBuilder: (BuildContext context, int index) => Divider(),
            ),
            Text(
              context.l10n.yourCartQualifiesForFreeShipping,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.secondaryTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
