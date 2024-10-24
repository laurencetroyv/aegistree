import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import 'package:aegistree/src/entities/entities.dart';

part 'leafs_provider.g.dart';

const Uuid uuid = Uuid();

@riverpod
class Leafs extends _$Leafs {
  @override
  List<LeafEntity> build() {
    return List.generate(
      25,
      (_) {
        final id = uuid.v4();
        return LeafEntity(
            id: id,
            type: "Plant",
            path: "https://robohash.org/$id?set=set4",
            createdAt: DateTime.now());
      },
    );
  }
}

@riverpod
class LeafAlbum extends _$LeafAlbum {
  @override
  List<LeafAlbumEntity> build() {
    return [];
  }

  void addAlbum(List<LeafAlbumEntity> album) {
    state = album;
  }
}
