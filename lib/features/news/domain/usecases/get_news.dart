import 'package:flutter_news_mvvm/core/params/search_params.dart';
import 'package:flutter_news_mvvm/core/usecase/usecase.dart';
import 'package:flutter_news_mvvm/features/news/domain/entities/news.dart';
import 'package:flutter_news_mvvm/features/news/domain/repositories/news_repository.dart';

class GetNews implements UseCase<List<NewsEntity>, SearchParams> {
  final NewsRepository repository;

  GetNews(this.repository);

  @override
  Future<List<NewsEntity>> call(SearchParams params) {
    return repository.fetchNews(params.q);
  }
}
