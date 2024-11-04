import 'package:isar/isar.dart';

part 'leaf_model.g.dart';

@collection
class LeafModel {
  late int id;
  final String uid;
  final String type;
  final List<int> image;
  final String createdBy;
  final DateTime createdAt;

  LeafModel({
    required this.uid,
    required this.type,
    required this.image,
    required this.createdBy,
    required this.createdAt,
  });

  EmbeddedLeafModel toEmbedded() {
    return EmbeddedLeafModel(
      uid: uid,
      type: type,
      image: image,
      createdBy: createdBy,
      createdAt: createdAt,
    );
  }

  Map<String, dynamic> get toJson => {
        "type": type,
        "createdBy": createdBy,
        "createdAt": createdAt.toIso8601String(),
      };
}

@embedded
class EmbeddedLeafModel {
  final String uid;
  final String type;
  final List<int> image;
  final String createdBy;
  final DateTime createdAt;

  EmbeddedLeafModel({
    required this.uid,
    required this.type,
    required this.image,
    required this.createdBy,
    required this.createdAt,
  });

  // Convert to collection version
  LeafModel toLeafModel() {
    return LeafModel(
      uid: uid,
      type: type,
      image: image,
      createdBy: createdBy,
      createdAt: createdAt,
    );
  }
}
