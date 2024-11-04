import 'package:flutter/services.dart';

import 'package:aegistree/src/src.dart';

class LeafEntity {
  final String id;
  final String type;
  final Uint8List image;
  final String createdBy;
  final DateTime createdAt;

  LeafEntity({
    required this.id,
    required this.type,
    required this.image,
    required this.createdBy,
    required this.createdAt,
  });

  String get uid => id.split("-")[0];

  LeafModel get toModel => LeafModel(
        uid: uid,
        type: type,
        image: image.toList(),
        createdBy: createdBy,
        createdAt: createdAt,
      );

  factory LeafEntity.fromModel(LeafModel entity) {
    return LeafEntity(
      id: entity.uid,
      type: entity.type,
      createdBy: entity.createdBy,
      image: Uint8List.fromList(entity.image),
      createdAt: entity.createdAt,
    );
  }

  Map<String, dynamic> get toJson => {
        "type": type,
        "createdBy": createdBy,
        "createdAt": createdAt.toIso8601String(),
      };
}
