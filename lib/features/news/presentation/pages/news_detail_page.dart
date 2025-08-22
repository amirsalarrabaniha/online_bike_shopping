import 'package:flutter/material.dart';
import 'package:flutter_news_mvvm/core/di/di.dart';
import 'package:flutter_news_mvvm/core/utils/localization_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsDetailPage extends ConsumerWidget {
  const NewsDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(detailNewsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.readMore)),
      body: provider.news == null
          ? Center(child: Text(context.l10n.search))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    provider.news!.title,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    provider.news!.url,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    provider.news!.content,
                  ),
                  const SizedBox(height: 20),
                  Text(provider.news!.description),
                ],
              ),
            ),
    );
  }
}
