import 'package:flutter/services.dart';

// import 'package:aegistree/src/src.dart';

class LeafEntity {
  final String id;
  final String type;
  final Uint8List image;
  final double accuracy;
  final String createdBy;
  final DateTime createdAt;

  LeafEntity({
    required this.id,
    required this.type,
    required this.image,
    required this.accuracy,
    required this.createdBy,
    required this.createdAt,
  });

  String get uid => id.split("-")[0];

  // LeafModel get toModel => LeafModel(
  //       uid: uid,
  //       type: type,
  //       image: image.toList(),
  //       accuracy: accuracy,
  //       createdBy: createdBy,
  //       createdAt: createdAt,
  //     );

  // factory LeafEntity.fromModel(LeafModel entity) {
  //   return LeafEntity(
  //     id: entity.uid,
  //     type: entity.type,
  //     accuracy: entity.accuracy,
  //     createdBy: entity.createdBy,
  //     image: Uint8List.fromList(entity.image),
  //     createdAt: entity.createdAt,
  //   );
  // }

  Map<String, dynamic> get toJson => {
    "type": type,
    "accuracy": accuracy,
    "createdBy": createdBy,
    "createdAt": createdAt.toIso8601String(),
  };
}
