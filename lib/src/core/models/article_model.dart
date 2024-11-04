import 'package:isar/isar.dart';

part 'article_model.g.dart';

@collection
class ArticleModel {
  late int id;
  final String uid;
  final String title;
  final String image;
  final String diseaseId;
  final String author;
  final String url;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ArticleModel({
    required this.uid,
    required this.title,
    required this.image,
    required this.diseaseId,
    required this.author,
    required this.url,
    this.createdAt,
    this.updatedAt,
  });
}
