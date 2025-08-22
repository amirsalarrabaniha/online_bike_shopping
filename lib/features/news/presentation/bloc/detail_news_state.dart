part of 'detail_news_bloc.dart';

abstract class DetailNewsState {}

class DetailNewsInitial extends DetailNewsState {}

class DetailNewsLoaded extends DetailNewsState {
  final NewsEntity news;

  DetailNewsLoaded(this.news);
}
