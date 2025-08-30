import 'package:flutter/material.dart';
import 'package:online_bike_shopping/core/theme/app_colors.dart';
import 'package:online_bike_shopping/core/theme/app_gradient.dart';
import 'package:online_bike_shopping/core/theme/app_radius.dart';
import 'package:online_bike_shopping/core/utils/random_image.dart';

class BasketCard extends StatelessWidget {
  const BasketCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(AppRadius.nRadius)),
            padding: EdgeInsets.all(10),
            child: Image.asset(
              randomImage(),
              width: 90,
              height: 90,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PILOT - CHROMOLY 520',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    '\$ 3,999.99',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.colorTextGradiantFrom,
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Color(0xff1e2635),
                        borderRadius: BorderRadius.circular(AppRadius.lRadius)),
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              gradient: AppGradient.buttonGradient,
                              borderRadius:
                                  BorderRadius.circular(AppRadius.lRadius)),
                          child: Text(
                            '+',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            '1',
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.card,
                              borderRadius:
                                  BorderRadius.circular(AppRadius.lRadius)),
                          child: Text(
                            '-',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }
}
