import 'package:flutter/material.dart';
import 'package:flutter_news_mvvm/core/utils/localization_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.chooseYourBike),
      ),
    );
  }
}
