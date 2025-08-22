import 'package:equatable/equatable.dart';

class NewsEntity extends Equatable {
  final String title;
  final String description;
  final String content;
  final String url;

  const NewsEntity({
    required this.title,
    required this.description,
    required this.content,
    required this.url,
  });

  @override
  List<Object?> get props => [title, description];
}
