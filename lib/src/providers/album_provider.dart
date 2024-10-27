import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:aegistree/src/entities/entities.dart';
import 'package:aegistree/src/providers/diseases_provider.dart';
import 'package:aegistree/src/providers/leafs_provider.dart';

part 'album_provider.g.dart';

@Riverpod(keepAlive: true)
class Album extends _$Album {
  @override
  List<LeafAlbumEntity> build() {
    final diseases = ref.watch(diseaseProvider);
    final leafs = ref.watch(leafsProvider);
    final albums = diseases.map((disease) {
      final leafsOfDisease = leafs.where((leaf) {
        return leaf.type == disease.id;
      }).toList();
      return LeafAlbumEntity(
        id: disease.id,
        title: disease.name,
        leafs: leafsOfDisease,
      );
    }).toList();

    return albums;
  }
}
