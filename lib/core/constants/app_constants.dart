import 'package:online_bike_shopping/features/home/model/category_model.dart';

class AppConstants {
  static const appName = "News App";
  static const newsApiKey = "8cc02cf3a70945128d2a33b850951f31";
  static const mainFont = "poppins";

  static final List<CategoryModel> categories = [
    CategoryModel(bottom: 0, text: 'All'),
    CategoryModel(bottom: 30, icon: 'subtract'),
    CategoryModel(bottom: 60, icon: 'road'),
    CategoryModel(bottom: 90, icon: 'union'),
    CategoryModel(bottom: 120, icon: 'union-1'),
  ];
}
