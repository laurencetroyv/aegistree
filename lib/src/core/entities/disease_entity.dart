import 'package:flutter/services.dart';

import 'package:aegistree/src/src.dart';

class DiseaseEntity {
  final String id;
  final String diseaseId;
  final String name;
  final String description;
  final Uint8List image;
  final String createdBy;
  final DateTime createdAt;
  final DateTime? updatedAt;

  DiseaseEntity({
    required this.id,
    required this.diseaseId,
    required this.name,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.createdBy,
    this.updatedAt,
  });

  DiseaseModel get toModel => DiseaseModel(
        uid: id,
        diseaseId: diseaseId,
        name: name,
        description: description,
        image: image,
        createdAt: createdAt,
        createdBy: createdBy,
        updatedAt: updatedAt,
      );

  factory DiseaseEntity.fromModel(DiseaseModel entity) {
    return DiseaseEntity(
      id: entity.uid,
      diseaseId: entity.diseaseId,
      name: entity.name,
      description: entity.description,
      image: Uint8List.fromList(entity.image),
      createdAt: entity.createdAt,
      createdBy: entity.createdBy,
      updatedAt: entity.updatedAt,
    );
  }

  Map<String, dynamic> get toJson => {
        'name': name,
        'description': description,
        'createdAt': createdAt.toIso8601String(),
        'createdBy': createdBy,
        'updatedAt': updatedAt?.toIso8601String(),
      };
}
