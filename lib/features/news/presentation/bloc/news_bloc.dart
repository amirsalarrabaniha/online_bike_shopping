// features/news/presentation/bloc/news_bloc.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_mvvm/core/params/search_params.dart';
import 'package:flutter_news_mvvm/core/usecase/usecase.dart';
import 'package:flutter_news_mvvm/features/news/domain/entities/news.dart';
import 'package:flutter_news_mvvm/features/news/domain/usecases/get_news.dart';

part 'news_event.dart';

part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNews getNews;

  NewsBloc(this.getNews) : super(NewsInitial()) {
    on<LoadNewsEvent>((event, emit) async {
      emit(NewsLoading());
      try {
        final news = await getNews(SearchParams(event.query));
        emit(NewsLoaded(news));
      } catch (e) {
        emit(NewsError(e.toString()));
      }
    });
  }
}
