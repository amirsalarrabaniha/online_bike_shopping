import 'package:dio/dio.dart';
import 'package:flutter_news_mvvm/core/constants/app_constants.dart';
import 'package:flutter_news_mvvm/features/news/data/models/news_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<NewsModel>> fetchNews(String q);
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio dio;

  NewsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<NewsModel>> fetchNews(String q) async {
    try {
      final response = await dio.get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: {
          'q': q,
          'apiKey': AppConstants.newsApiKey,
        },
      );

      final newsResponse = NewsResponse.fromJson(response.data);
      return newsResponse.articles;
    } catch (e) {
      throw Exception('Error fetching news: $e');
    }
  }
}
