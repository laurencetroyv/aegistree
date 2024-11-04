import 'package:isar/isar.dart';

part 'disease_model.g.dart';

@collection
class DiseaseModel {
  late int id;
  final String uid;
  final String name;
  final String description;
  final List<int> image;
  final String createdBy;
  final DateTime createdAt;
  final DateTime? updatedAt;

  DiseaseModel({
    required this.uid,
    required this.name,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.createdBy,
    this.updatedAt,
  });

  Map<String, dynamic> get toJson => {
        'name': name,
        'description': description,
        'createdAt': createdAt.toIso8601String(),
        'createdBy': createdBy,
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
