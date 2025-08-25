import 'package:flutter/material.dart';
import 'package:flutter_news_mvvm/core/localization/app_localizations.dart';
import 'package:flutter_news_mvvm/core/theme/app_theme.dart';
import 'package:flutter_news_mvvm/features/news/presentation/pages/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsProvider);

    return MaterialApp(
      theme: AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingsState.themeMode,
      locale: settingsState.locale,
      supportedLocales: AppLocal.supportedLocales,
      localizationsDelegates: AppLocal.localizationsDelegates,
      home: NewsListPage(),
    );
  }
}
