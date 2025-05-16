import 'package:flutter/services.dart';

// import 'package:aegistree/src/src.dart';

class DiseaseEntity {
  final String id;
  final String name;
  final String description;
  final Uint8List image;
  final String createdBy;
  final DateTime createdAt;
  final DateTime? updatedAt;

  DiseaseEntity({
    required this.id,
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
