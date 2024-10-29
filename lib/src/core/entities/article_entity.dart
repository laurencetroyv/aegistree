class ArticleEntity {
  final String id;
  final String title;
  final String image;
  final String diseaseId;
  final String author;
  final String url;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ArticleEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.diseaseId,
    required this.author,
    required this.url,
    this.createdAt,
    this.updatedAt,
  });
}
