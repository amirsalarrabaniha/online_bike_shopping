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

  @override
  String get chooseYourBike => 'Choose Your Bike';

  @override
  String get description => 'Description';

  @override
  String get specification => 'Specification';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String get apply => 'Apply';

  @override
  String get checkout => 'Checkout';

  @override
  String get myShoppingCart => 'My Shopping Cart';

  @override
  String get yourCartQualifiesForFreeShipping =>
      'Your cart qualifies for free shipping';
}
