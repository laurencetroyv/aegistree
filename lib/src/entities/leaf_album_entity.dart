import 'package:aegistree/src/entities/entities.dart';

class LeafAlbumEntity {
  final String id;
  final String title;
  final List<LeafEntity> leafs;

  LeafAlbumEntity({
    required this.id,
    required this.title,
    required this.leafs,
  });
}