import 'package:flutter_news_mvvm/features/news/domain/entities/news.dart';
import 'package:flutter_news_mvvm/features/news/domain/repositories/news_repository.dart';
import 'package:flutter_news_mvvm/features/news/data/datasources/news_remote_data_source.dart';
import 'package:flutter_news_mvvm/features/news/data/models/news_model.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remote;

  NewsRepositoryImpl(this.remote);

  @override
  Future<List<NewsEntity>> fetchNews(String q) async {
    final models = await remote.fetchNews(q);
    return models.map((m) => m.toEntity()).toList();
  }
}
