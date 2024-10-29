import 'package:flutter/services.dart';

class LeafEntity {
  final String id;
  final String type;
  final Uint8List image;
  final DateTime createdAt;

  LeafEntity({
    required this.id,
    required this.type,
    required this.image,
    required this.createdAt,
  });

  String get uid => id.split("-")[0];
}
