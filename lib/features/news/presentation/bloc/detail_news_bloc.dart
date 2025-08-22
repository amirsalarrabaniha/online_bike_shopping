import 'package:bloc/bloc.dart';
import 'package:flutter_news_mvvm/features/news/domain/entities/news.dart';
import 'package:meta/meta.dart';

part 'detail_news_event.dart';

part 'detail_news_state.dart';

class DetailNewsBloc extends Bloc<DetailNewsEvent, DetailNewsState> {
  DetailNewsBloc() : super(DetailNewsInitial()) {
    on<SetNewsEvent>((event, emit) {
      emit(DetailNewsLoaded(event.news));
    });
  }
}
