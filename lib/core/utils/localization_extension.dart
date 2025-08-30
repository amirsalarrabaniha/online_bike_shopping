import 'package:flutter/widgets.dart';
import 'package:online_bike_shopping/core/localization/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocal get l10n => AppLocal.of(this)!;
}
