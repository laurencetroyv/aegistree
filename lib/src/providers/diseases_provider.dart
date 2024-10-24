import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:aegistree/src/entities/entities.dart';
import 'package:aegistree/src/providers/leafs_provider.dart';

part 'diseases_provider.g.dart';

@riverpod
class Disease extends _$Disease {
  @override
  List<DiseaseEntity> build() {
    return List.generate(
      7,
      (_) {
        final id = uuid.v4();
        return DiseaseEntity(
          id: id,
          name: id.split("-")[0],
          description: id,
          image: "https://robohash.org/$id?set=set4",
          createdAt: DateTime.now(),
        );
      },
    );
  }
}
