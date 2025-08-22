import 'package:flutter_news_mvvm/features/news/domain/entities/news.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';

part 'news_model.g.dart';

@freezed
abstract class NewsResponse with _$NewsResponse {
  const factory NewsResponse({
    required String status,
    required int totalResults,
    required List<NewsModel> articles,
  }) = _NewsResponse;

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
}

@freezed
abstract class NewsModel with _$NewsModel {
  const factory NewsModel({
    required Source source,
    String? author,
    required String title,
    @Default('Empty') String description,
    required String url,
    String? urlToImage,
    required String publishedAt,
    String? content,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}

@freezed
abstract class Source with _$Source {
  const factory Source({
    String? id,
    required String name,
  }) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}

extension NewsModelX on NewsModel {
  NewsEntity toEntity() => NewsEntity(
        title: title,
        description: description,
        content: content ?? '',
        url: url,
      );
}
