// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalFa extends AppLocal {
  AppLocalFa([String locale = 'fa']) : super(locale);

  @override
  String get newsTitle => 'اخبار';

  @override
  String get readMore => 'ادامه مطلب';

  @override
  String get search => 'جست و جو';

  @override
  String get newsApp => 'اپلیکیشن خبر';
}
