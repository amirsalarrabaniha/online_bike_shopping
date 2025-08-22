// features/news/presentation/bloc/news_event.dart

part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object?> get props => [];
}

class LoadNewsEvent extends NewsEvent {
  String query;

  LoadNewsEvent(this.query);
}
