import 'package:flutter/services.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:aegistree/src/src.dart';

part 'leafs_provider.g.dart';

@Riverpod(keepAlive: true)
class Leafs extends _$Leafs {
  @override
  List<LeafEntity> build() {
    return [];
  }

  void addLeaf(String diseaseID, Uint8List image) {
    final leaf = LeafEntity(
      id: uuid.v4(),
      type: diseaseID,
      image: image,
      createdAt: DateTime.now(),
    );

    state = [...state, leaf];
  }

  List<LeafEntity> getLeafsByDisease(String id) {
    return state.where((leaf) => leaf.type == id).toList();
  }
}
