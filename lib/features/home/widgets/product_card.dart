import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:online_bike_shopping/core/theme/app_colors.dart';
import 'package:online_bike_shopping/core/theme/app_gradient.dart';
import 'package:online_bike_shopping/core/theme/app_radius.dart';
import 'package:online_bike_shopping/core/utils/random_image.dart';
import 'package:online_bike_shopping/core/widgets/slope_radius_widget.dart';
import 'package:online_bike_shopping/features/detail/presentation/pages/detail_page.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () => gotoDetail(context),
      child: SlopeRadiusWidget(
        borderDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.nRadius),
          gradient: AppGradient.borderGradient.withOpacity(0.2),
        ),
        borderWidth: 2,
        bottomSlope: 8,
        topSlope: 8,
        radius: 20,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: AppGradient.cardGradient.withOpacity(0.8),
            borderRadius: BorderRadius.circular(AppRadius.nRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(
                    randomImage(),
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
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
    );
  }

  gotoDetail(context) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => DetailPage()));
}
