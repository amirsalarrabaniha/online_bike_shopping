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
