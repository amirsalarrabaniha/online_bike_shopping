import 'package:flutter/material.dart';
import 'package:flutter_news_mvvm/core/theme/app_colors.dart';
import 'package:flutter_news_mvvm/core/theme/app_gradient.dart';
import 'package:flutter_news_mvvm/core/theme/app_radius.dart';
import 'package:flutter_news_mvvm/core/utils/localization_extension.dart';
import 'package:flutter_news_mvvm/core/widgets/gradient_button.dart';
import 'package:flutter_news_mvvm/core/widgets/inner_shadow_button.dart';
import 'package:flutter_news_mvvm/core/widgets/out_shadow_button.dart';
import 'package:flutter_news_mvvm/features/news/widgets/detail_appbar.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/main_bg.png',
                ))),
        child: SafeArea(
          bottom: false, // disables safe area padding at the bottom
          child: Column(
            children: [
              DetailAppbar(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(
                  'assets/images/Image3.png',
                  width: double.infinity,
                  height: 200,
                ),
              ),
              SizedBox(height: 40),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppRadius.vhRadius),
                      topRight: Radius.circular(AppRadius.vhRadius),
                    ),
                    gradient: LinearGradient(
                      colors: [AppColors.card, AppColors.background],
                      transform: GradientRotation(1),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 30),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: OutShadowButton(
                                        text: context.l10n.description),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: InnerShadowButton(
                                        text: context.l10n.specification),
                                  )
                                ],
                              ),
                            ),
                            Text(
                              "PEUGEOT - LR01",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text(
                              """The LR01 uses the same design as the most iconic bikes from PEUGEOT Cycles' 130-year history and combines it with agile, dynamic performance that's perfectly suited to navigating today's cities. As well as a lugged steel frame and iconic PEUGEOT black-and-white chequer design, this city bike also features a 16-speed Shimano Claris drivetrain.""",
                              style: TextStyle(
                                fontSize: 15,
                                color: AppColors.secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: AppGradient.borderGradient.withOpacity(0.2),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColors.card2,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '\$ 1,999.99',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.colorTextGradiantFrom,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GradientButton(context.l10n.addToCart),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
