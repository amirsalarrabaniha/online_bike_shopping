import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_news_mvvm/core/theme/app_colors.dart';
import 'package:flutter_news_mvvm/core/theme/app_gradient.dart';
import 'package:flutter_news_mvvm/core/theme/app_radius.dart';
import 'package:flutter_news_mvvm/core/widgets/border_gradient_widget.dart';
import 'package:flutter_news_mvvm/features/news/model/category_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_news_mvvm/core/di/di.dart';

class CategoryCard extends ConsumerWidget {
  CategoryModel item;
  int index;

  CategoryCard(
    this.item,
    this.index, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(counterProvider);
    return Bounceable(
      onTap: () => ref.read(counterProvider.notifier).state = index,
      child: Container(
          margin: EdgeInsets.only(bottom: item.bottom),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withOpacity(0.6),
              spreadRadius: 0,
              offset: Offset(0, 20),
              blurRadius: 30,
            ),
          ]),
          child: currentIndex == index
              ? Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: AppGradient.buttonGradient,
                    borderRadius: BorderRadius.circular(AppRadius.nRadius),
                  ),
                  child: buildContent(ref),
                )
              : BorderGradientWidget(
                  padding: EdgeInsets.all(1),
                  width: 60,
                  height: 60,
                  child: buildContent(ref),
                )),
    );
  }

  buildContent(ref) => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12.0),
        child: item.text != null
            ? Text(
                item.text!,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            : SvgPicture.asset(
                'assets/icons/ic-${item.icon}.svg',
                width: 30,
                height: 30,
              ),
      );
}
