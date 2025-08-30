import 'package:flutter/material.dart';
import 'package:online_bike_shopping/core/theme/app_colors.dart';
import 'package:online_bike_shopping/core/utils/localization_extension.dart';
import 'package:online_bike_shopping/features/home/widgets/basket_card.dart';
import 'package:online_bike_shopping/features/detail/widgets/detail_appbar.dart';

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
            ),
            SizedBox(height: 20),
            _getBasketDetailCard('Subtotal:', '\$6119.99'),
            _getBasketDetailCard('Delivery Fee:', '\$0'),
            _getBasketDetailCard('Discount:', '30%'),
            _getBasketDetailCard('Total:', '\$4,283.99', isBold: true),
          ],
        ),
      ),
    );
  }

  _getBasketDetailCard(key, value, {isBold = false}) => Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 20, vertical: isBold ? 20 : 5),
        child: Row(
          children: [
            Expanded(
              child: Text(
                key,
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: TextStyle(
                    fontSize: 18,
                    color: isBold
                        ? AppColors.colorTextGradiantFrom
                        : AppColors.secondaryTextColor,
                    fontWeight: isBold ? FontWeight.bold : null),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      );
}
