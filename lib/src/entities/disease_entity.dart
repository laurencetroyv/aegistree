class DiseaseEntity {
  final String id;
  final String name;
  final String description;
  final String image;
  final DateTime createdAt;
  final DateTime? updatedAt;

  DiseaseEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.createdAt,
    this.updatedAt,
  });
}
