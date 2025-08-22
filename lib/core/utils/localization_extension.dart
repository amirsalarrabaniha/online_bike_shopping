import 'package:flutter/widgets.dart';
import 'package:flutter_news_mvvm/core/localization/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocal get l10n => AppLocal.of(this)!;
}
