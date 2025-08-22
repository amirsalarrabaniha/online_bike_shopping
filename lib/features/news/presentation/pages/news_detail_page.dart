import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_mvvm/core/utils/localization_extension.dart';
import 'package:flutter_news_mvvm/features/news/presentation/bloc/detail_news_bloc.dart';

class NewsDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.readMore)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<DetailNewsBloc, DetailNewsState>(
          builder: (BuildContext context, DetailNewsState state) {
            if (state is DetailNewsLoaded) {
              return Column(
                children: [
                  Text(state.news.title),
                  SizedBox(height: 20),
                  Text(state.news.url),
                  SizedBox(height: 20),
                  Text(state.news.content),
                  SizedBox(height: 20),
                  Text(state.news.description),
                ],
              );
            }

            return SizedBox();
          },
        ),
      ),
    );
  }
}
