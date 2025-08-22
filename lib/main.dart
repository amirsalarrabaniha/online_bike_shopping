import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_mvvm/core/di/di.dart';
import 'package:flutter_news_mvvm/core/localization/app_localizations.dart';
import 'package:flutter_news_mvvm/features/news/presentation/bloc/detail_news_bloc.dart';
import 'package:flutter_news_mvvm/settings/settings_bloc.dart';
import 'core/theme/app_theme.dart';
import 'features/news/data/datasources/news_remote_data_source.dart';
import 'features/news/data/repositories/news_repository_impl.dart';
import 'features/news/domain/usecases/get_news.dart';
import 'features/news/presentation/bloc/news_bloc.dart';
import 'features/news/presentation/pages/news_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //DI
  setupMain();
  setupNews();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(create: (_) => SettingsBloc()),
        BlocProvider<NewsBloc>(create: (_) => createNewsBloc()),
        BlocProvider<DetailNewsBloc>(create: (_) => DetailNewsBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          locale: state.locale,
          themeMode: state.themeMode,
          supportedLocales: AppLocal.supportedLocales,
          localizationsDelegates: AppLocal.localizationsDelegates,
          home: NewsListPage(),
        );
      },
    );
  }
}

NewsBloc createNewsBloc() =>
    NewsBloc(GetNews(NewsRepositoryImpl(NewsRemoteDataSourceImpl(dio: Dio()))));
