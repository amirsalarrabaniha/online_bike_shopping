// lib/core/di/di.dart
import 'package:dio/dio.dart';
import 'package:flutter_news_mvvm/features/news/domain/usecases/get_news.dart';
import 'package:flutter_news_mvvm/settings/settings_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_news_mvvm/features/news/data/repositories/news_repository_impl.dart';
import 'package:flutter_news_mvvm/features/news/data/datasources/news_remote_data_source.dart';
import 'package:flutter_news_mvvm/features/news/domain/repositories/news_repository.dart';

// Dio
final dioProvider = Provider<Dio>((ref) {
  return Dio();
});
// DataSource provider
final newsRemoteDataSourceProvider = Provider<NewsRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return NewsRemoteDataSourceImpl(dio: dio);
});

// Repository provider
final newsRepositoryProvider = Provider<NewsRepository>((ref) {
  final remoteDataSource = ref.watch(newsRemoteDataSourceProvider);
  return NewsRepositoryImpl(remoteDataSource);
});

// UseCase provider
final getNewsUseCaseProvider = Provider<GetNews>((ref) {
  final repository = ref.watch(newsRepositoryProvider);
  return GetNews(repository);
});

// Provider to store an integer
final counterProvider = StateProvider<int>((ref) => 0);

// Settings StateNotifier provider
final settingsProvider =
    StateNotifierProvider<SettingsNotifier, SettingsState>((ref) {
  return SettingsNotifier();
});
