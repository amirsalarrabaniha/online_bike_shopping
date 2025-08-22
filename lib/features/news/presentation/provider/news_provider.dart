import 'package:flutter_news_mvvm/core/params/search_params.dart';
import 'package:flutter_news_mvvm/features/news/domain/entities/news.dart';
import 'package:flutter_news_mvvm/features/news/domain/usecases/get_news.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// State
class NewsState {
  final bool isLoading;
  final List<NewsEntity> news;
  final String error;

  NewsState({
    this.isLoading = false,
    this.news = const [],
    this.error = '',
  });

  NewsState copyWith({
    bool? isLoading,
    List<NewsEntity>? news,
    String? error,
  }) {
    return NewsState(
      isLoading: isLoading ?? this.isLoading,
      news: news ?? this.news,
      error: error ?? this.error,
    );
  }
}

// Notifier
class NewsNotifier extends StateNotifier<NewsState> {
  final GetNews getNewsUseCase;

  NewsNotifier(this.getNewsUseCase) : super(NewsState());

  Future<void> loadNews(String query) async {
    state = state.copyWith(isLoading: true, error: '');
    try {
      final result = await getNewsUseCase(SearchParams(query));
      state = state.copyWith(isLoading: false, news: result);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
