import 'package:flutter/material.dart';
import 'package:flutter_news_mvvm/core/di/di.dart';
import 'package:flutter_news_mvvm/core/utils/localization_extension.dart';
import 'package:flutter_news_mvvm/features/news/domain/entities/news.dart';
import 'package:flutter_news_mvvm/settings/settings_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'news_detail_page.dart';

class NewsListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsProvider);
    final newsState = ref.watch(newsNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.newsTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              final notifier = ref.read(settingsProvider.notifier);
              notifier.changeLocale(
                settingsState.locale.languageCode == 'en'
                    ? Locale('fa')
                    : Locale('en'),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.brightness_6),
            onPressed: () {
              ref.read(settingsProvider.notifier).toggleTheme();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (query) =>
                  ref.read(newsNotifierProvider.notifier).loadNews(query),
              decoration: InputDecoration(
                hintText: context.l10n.search,
              ),
            ),
          ),
          Expanded(
            child: Builder(
              builder: (_) {
                if (newsState.isLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (newsState.error.isNotEmpty) {
                  return Center(child: Text(newsState.error));
                } else if (newsState.news.isNotEmpty) {
                  return ListView.builder(
                    itemCount: newsState.news.length,
                    itemBuilder: (context, index) {
                      final news = newsState.news[index];
                      return InkWell(
                        onTap: () => navigateDetail(context, ref, news),
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
  }

  void navigateDetail(BuildContext context, WidgetRef ref, NewsEntity news) {
    ref.read(detailNewsProvider.notifier).setNews(news);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => NewsDetailPage()),
    );
  }
}
