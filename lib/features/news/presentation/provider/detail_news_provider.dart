import 'package:flutter_news_mvvm/core/params/search_params.dart';
import 'package:flutter_news_mvvm/features/news/domain/entities/news.dart';
import 'package:flutter_news_mvvm/features/news/domain/usecases/get_news.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// State
class DetailNewsState {
  NewsEntity? news;

  DetailNewsState({
    this.news,
  });
}

// Notifier
class DetailNewsNotifier extends StateNotifier<DetailNewsState> {
  DetailNewsNotifier() : super(DetailNewsState());

  Future<void> setNews(NewsEntity news) async {
    state.news = news;
  }
}
