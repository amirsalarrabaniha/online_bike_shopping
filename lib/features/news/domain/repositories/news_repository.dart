import 'package:flutter_news_mvvm/features/news/domain/entities/news.dart';

abstract class NewsRepository {
  Future<List<NewsEntity>> fetchNews(String q);
}
