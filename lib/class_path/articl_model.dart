
import 'package:newsreader_app/class_path/source_model.dart';

class Article{
  Source source;
  String? uriToImage;
  String? title;
  String? publishedAt;
  String? description;
  String? author;
  Article(
  {
    required this.source,
    this.uriToImage,
    this.title,
    this.publishedAt,
    this.description,
    this.author
});
  factory Article.fromJson(Map<String,dynamic>json){
    return Article(
      source: Source.fromJson(json['source']),
      uriToImage: json['urlToImage'],
      title: json['title'],
      publishedAt: json['publishedAt'],
      description: json['description'],
      author: json['author']
    );
  }
}