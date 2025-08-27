import 'package:flutter/material.dart';
import 'package:flutter_news_mvvm/core/theme/app_colors.dart';
import 'package:flutter_news_mvvm/core/theme/app_radius.dart';
import 'package:flutter_news_mvvm/core/utils/localization_extension.dart';
import 'package:flutter_news_mvvm/core/utils/random_image.dart';
import 'package:flutter_news_mvvm/core/widgets/action_button.dart';
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
                  padding: EdgeInsets.all(20),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
