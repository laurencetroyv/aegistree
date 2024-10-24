class LeafEntity {
  final String id;
  final String type;
  final String path;
  final DateTime createdAt;

  LeafEntity({
    required this.id,
    required this.type,
    required this.path,
    required this.createdAt,
  });

  String get uid => id.split("-")[0];
}
