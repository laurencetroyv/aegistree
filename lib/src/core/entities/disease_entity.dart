import 'package:flutter/services.dart';

class DiseaseEntity {
  final String id;
  final String name;
  final String description;
  final Uint8List image;
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
