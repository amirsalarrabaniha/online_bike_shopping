part of 'detail_news_bloc.dart';

class DetailNewsEvent {}

class SetNewsEvent extends DetailNewsEvent {
  NewsEntity news;

  SetNewsEvent(this.news);
}
