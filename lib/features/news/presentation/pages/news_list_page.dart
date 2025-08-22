import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_mvvm/core/utils/localization_extension.dart';
import 'package:flutter_news_mvvm/features/news/data/datasources/news_remote_data_source.dart';
import 'package:flutter_news_mvvm/features/news/data/repositories/news_repository_impl.dart';
import 'package:flutter_news_mvvm/features/news/domain/entities/news.dart';
import 'package:flutter_news_mvvm/features/news/domain/usecases/get_news.dart';
import 'package:flutter_news_mvvm/features/news/presentation/bloc/detail_news_bloc.dart';
import 'package:flutter_news_mvvm/features/news/presentation/bloc/news_bloc.dart';
import 'package:flutter_news_mvvm/features/news/presentation/pages/news_detail_page.dart';
import 'package:flutter_news_mvvm/settings/settings_bloc.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.l10n.newsTitle),
            actions: [
              IconButton(
                  onPressed: () {
                    final bloc = context.read<SettingsBloc>();
                    bloc.add(ChangeLocaleEvent(state.locale.languageCode == 'en'
                        ? const Locale('fa')
                        : const Locale('en')));
                  },
                  icon: Icon(Icons.language)),
              IconButton(
                  onPressed: () {
                    context.read<SettingsBloc>().add(ToggleThemeEvent());
                  },
                  icon: Icon(Icons.brightness_6))
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    return TextField(
                      onSubmitted: (c) =>
                          context.read<NewsBloc>().add(LoadNewsEvent(c)),
                      decoration: InputDecoration(
                        hintText: context.l10n.search,
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    if (state is NewsLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is NewsError) {
                      return Center(child: Text(state.message));
                    } else if (state is NewsLoaded) {
                      return ListView.builder(
                        itemCount: state.news.length,
                        itemBuilder: (context, index) {
                          final news = state.news[index];
                          return InkWell(
                            onTap: () => navigateDetail(context, news),
                            child: ListTile(
                              title: Text(news.title),
                              subtitle: Text(news.description),
                            ),
                          );
                        },
                      );
                    }
                    return Center(child: Text(context.l10n.search));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void navigateDetail(BuildContext context, NewsEntity news) {
    context.read<DetailNewsBloc>().add(SetNewsEvent(news));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => NewsDetailPage()),
    );
  }
}
