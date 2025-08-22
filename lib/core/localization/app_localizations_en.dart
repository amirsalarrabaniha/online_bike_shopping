// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalEn extends AppLocal {
  AppLocalEn([String locale = 'en']) : super(locale);

  @override
  String get newsTitle => 'News';

  @override
  String get readMore => 'Read More';

  @override
  String get search => 'search..';

  @override
  String get newsApp => 'News App';
}
