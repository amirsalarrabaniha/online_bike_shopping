// lib/core/di/di.dart
import 'package:dio/dio.dart';
import 'package:flutter_news_mvvm/features/news/domain/usecases/get_news.dart';
import 'package:flutter_news_mvvm/settings/settings_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_news_mvvm/features/news/data/repositories/news_repository_impl.dart';
import 'package:flutter_news_mvvm/features/news/data/datasources/news_remote_data_source.dart';
import 'package:flutter_news_mvvm/features/news/domain/repositories/news_repository.dart';
import 'package:flutter_news_mvvm/features/news/presentation/bloc/news_bloc.dart';

final getIt = GetIt.instance;

void setupMain() {
  getIt.registerFactory<SettingsBloc>(() => SettingsBloc());
}

void setupNews() {
  // Core / external
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Core / external
  getIt.registerLazySingleton<NewsRemoteDataSource>(
      () => NewsRemoteDataSourceImpl(dio: getIt()));

  // Repository
  getIt
      .registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(getIt()));

  // UseCase
  getIt.registerLazySingleton<GetNews>(() => GetNews(getIt()));

  // Blocs
  getIt.registerFactory<NewsBloc>(() => NewsBloc(getIt()));
}
